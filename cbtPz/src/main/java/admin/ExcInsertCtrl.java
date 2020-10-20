package admin;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import common.FileRenamePolicy;
import controller.Controller;
import model.HashtagDAO;
import model.HashtagVO;
import model.PaperHeadDAO;
import model.PaperheadVO;
import model.ProblemDAO;
import model.ProblemVO;
import model.Problem_HashtagDAO;
import model.Problem_HashtagVO;

public class ExcInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// paperhead table insert

		String paperhead_id = request.getParameter("paperhead_id");
		String paper_type_cd = request.getParameter("paper_type_cd");
		String paper_round = request.getParameter("paper_round");

		PaperheadVO paper = new PaperheadVO();
		paper.setPaperhead_id(paperhead_id);
		paper.setPaper_type_cd(paper_type_cd);
		paper.setPaper_round(paper_round);
		PaperHeadDAO.getInstance().insert(paper);

		PaperheadVO paperhead_idVO = PaperHeadDAO.getInstance().selectNewOne();
		paperhead_id = paperhead_idVO.getPaperhead_id();

		String[] split_target = null;

		// problem table insert
		String problem_id = request.getParameter("problem_id");
		String subject = request.getParameter("subject");
		String haeseol = request.getParameter("haeseol");
		String problem_text = request.getParameter("problem_text");
		String ans_1 = request.getParameter("ans_1");
		String ans_2 = request.getParameter("ans_2");
		String ans_3 = request.getParameter("ans_3");
		String ans_4 = request.getParameter("ans_4");
		String ans_correct = request.getParameter("ans_correct");
		// paperhead_id = request.getParameter("paperhead_id");
		String problem_image = request.getParameter("problem_image");

		String path = "C:/upload";

		ProblemVO problem = new ProblemVO();

		problem.setProblem_id(problem_id);
		problem.setSubject(subject);
		problem.setHaeseol(haeseol);
		problem.setProblem_text(problem_text);
		problem.setAns_1(ans_1);
		problem.setAns_2(ans_2);
		problem.setAns_3(ans_3);
		problem.setAns_4(ans_4);
		problem.setAns_correct(ans_correct);
		problem.setPaperhead_id(paperhead_id);
		problem.setProblem_image(problem_image);

		// 경로 확인 후 서버에 파일 저장
		Part part = request.getPart("file_path");
		String file = getFileName(part);
		System.out.println(file);

		if (file != null && !file.isEmpty()) {

			File renameFile = FileRenamePolicy.rename(new File(path, file)); // 중복확인
			part.write(path + "/" + renameFile.getName());
			System.out.println(renameFile.getName());

			ProblemDAO dao = new ProblemDAO();
			new HashtagDAO();
			HashtagDAO hashDao = HashtagDAO.getInstance();

			// List<ProblemVO> list = new ArrayList<ProblemVO>();

			// 서버에 저장된 파일 읽어오기
			try {
				OPCPackage opcPackage = OPCPackage.open(renameFile); // opcPackage : 대용량 파일?(zip파일) 읽기
				@SuppressWarnings("resource")
				XSSFWorkbook workbook = new XSSFWorkbook(opcPackage); // xssfWorkbook : 엑셀 파일 전용

				// 첫번째 시트 불러오기
				XSSFSheet sheet = workbook.getSheetAt(0);

				System.out.println(sheet.getLastRowNum());

				for (int i = 0; i < sheet.getLastRowNum(); i++) {
					ProblemVO problem1 = new ProblemVO();
					// 해시태그 등록.
					HashtagVO hashVO = new HashtagVO();
					Problem_HashtagVO prob_hashVO = new Problem_HashtagVO();
					problem1.setProblem_id(renameFile.getName());
					XSSFRow row = sheet.getRow(i);

					// 행이 존재하지 않으면 패스
					if (null == row.getCell(0)) {
						continue;
					}

					// 행과 열 불러오기
					XSSFCell cell = row.getCell(0);
					if (null != cell)
						problem1.setProblem_id(Double.toString(cell.getNumericCellValue()));

					cell = row.getCell(1);
					if (null != cell)
						problem1.setSubject(cell.getStringCellValue());

					cell = row.getCell(2);
					if (null != cell)
						problem1.setHaeseol(cell.getStringCellValue());

					cell = row.getCell(3);
					if (null != cell)
						problem1.setProblem_text(cell.getStringCellValue());

					cell = row.getCell(4);
					if (null != cell)
						problem1.setAns_1(cell.getStringCellValue());

					cell = row.getCell(5);
					if (null != cell)
						problem1.setAns_2(cell.getStringCellValue());

					cell = row.getCell(6);
					if (null != cell)
						problem1.setAns_3(cell.getStringCellValue());

					cell = row.getCell(7);
					if (null != cell)
						problem1.setAns_4(cell.getStringCellValue());

					cell = row.getCell(8);
					if (null != cell)
						problem1.setAns_correct(Double.toString(cell.getNumericCellValue()));

					cell = row.getCell(9); 
					if (null != cell) 
						problem1.setPaperhead_id(Double.toString(cell.getNumericCellValue()));
				
					cell = row.getCell(10);
					if (null != cell) {
						String target = cell.getStringCellValue();
						split_target = target.split(",");
						System.out.println("split_target : " + split_target);

					}

					cell = row.getCell(1);
					if (null != cell)
						hashVO.setClassify_code_cd(cell.getStringCellValue());

					problem1.setPaperhead_id(paperhead_id);

					System.out.println(problem1);

					dao.insert(problem1);
					problem1.setProblem_id((dao.selectNewId()).getProblem_id());

					for (int j = 0; j < split_target.length; j++) {

						hashVO.setHashtag_name(split_target[j]);
						System.out.println("split_target 요소" + split_target[j]);

						ArrayList<HashtagVO> hashList = hashDao.selectHashtag(hashVO);
						System.out.println("hashList : " + hashList);

						if (hashList.size() == 0) { // hashTag가 새로운 태그라면 태그를 insert 하고 해당 태그를 다시 list에 담음.
							hashDao.insert(hashVO);
							hashList = hashDao.selectHashtag(hashVO);
						}

						System.out.println("hashList : " + hashList);
						// 해시태그에 한 개만 들어간다고 가정함.
						hashList.get(0).getHashtag_id();
						prob_hashVO.setHashtag_id(hashList.get(0).getHashtag_id());
						
						System.out.println("hashid last : " + hashList.get(0).getHashtag_id());
						
						prob_hashVO.setProblem_id(problem1.getProblem_id());
						
						System.out.println("problem1 last : " + problem1);
						
						Problem_HashtagDAO.getInstance().insert(prob_hashVO);
						System.out.println("======================================================");

					}

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		request.getRequestDispatcher("/admin/excelInsertOutput.jsp").forward(request, response);

	}

	private String getFileName(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

}
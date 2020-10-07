package admin;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;


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
import model.ProblemDAO;
import model.ProblemVO;

public class ExcInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// paperhead table insert
		
		/*
		 * String paperhead_id = request.getParameter("paperhead_id"); String
		 * paper_type_cd = request.getParameter("paper_type_cd"); String paper_round =
		 * request.getParameter("paper_round");
		 * 
		 * PaperheadVO paper = new PaperheadVO(); paper.setPaperhead_id(paperhead_id);
		 * paper.setPaper_type_cd(paper_type_cd); paper.setPaper_round(paper_round);
		 * 
		 * PaperHeadDAO.getInstance().insert(paper);
		 */
		

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
		String paperhead_id = request.getParameter("paperhead_id");
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

			// List<ProblemVO> list = new ArrayList<ProblemVO>();

			// 서버에 저장된 파일 읽어오기
			try {
				OPCPackage opcPackage = OPCPackage.open(renameFile); // opcPackage : 대용량 파일?(zip파일) 읽기
				@SuppressWarnings("resource")
				XSSFWorkbook workbook = new XSSFWorkbook(opcPackage); // xssfWorkbook : 엑셀 파일 전용

				// 첫번째 시트 불러오기
				XSSFSheet sheet = workbook.getSheetAt(0);

				for (int i = 0; i < sheet.getLastRowNum(); i++) {
					ProblemVO problem1 = new ProblemVO();
					problem1.setProblem_id(renameFile.getName());
					XSSFRow row = sheet.getRow(i);

					// 행이 존재하지 않으면 패스
					if (null == row) {
						continue;
					}
					
					// 행과 열 불러오기
					XSSFCell cell = row.getCell(0);
					if (null != cell) problem1.setProblem_id(Double.toString(cell.getNumericCellValue()));
					
					cell = row.getCell(1);
					if (null != cell) problem1.setSubject(cell.getStringCellValue());
					
					cell = row.getCell(2);
					if (null != cell) problem1.setHaeseol(cell.getStringCellValue());
					
					cell = row.getCell(3);
					if (null != cell) problem1.setProblem_text(cell.getStringCellValue());
					
					cell = row.getCell(4);
					if (null != cell) problem1.setAns_1(cell.getStringCellValue());
					
					cell = row.getCell(5);
					if (null != cell) problem1.setAns_2(cell.getStringCellValue());
					
					cell = row.getCell(6);
					if (null != cell) problem1.setAns_3(cell.getStringCellValue());
					
					cell = row.getCell(7);
					if (null != cell) problem1.setAns_4(cell.getStringCellValue());
					
					cell = row.getCell(8);
					if (null != cell) problem1.setAns_correct(Double.toString(cell.getNumericCellValue())); 
																								
					cell = row.getCell(9);
					if (null != cell) problem1.setPaperhead_id(Double.toString(cell.getNumericCellValue()));
					
					cell = row.getCell(10);
					if (null != cell) problem1.setProblem_image(Double.toString(cell.getNumericCellValue()));

					System.out.println(problem1);

					dao.insert(problem1);
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

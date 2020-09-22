package admin;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import common.FileRenamePolicy;
import controller.Controller;
import paperHead.PaperHeadDAO;
import paperHead.PaperHeadVO;

public class ExcelInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String paperhead_id =request.getParameter("paperhead_id");
		String paper_type_cd = request.getParameter("paper_type_cd");
		String paper_round = request.getParameter("paper_round");
		String excel_file = request.getParameter("excel_file");
		String path = "D:/upload";
		
		PaperHeadVO paper = new PaperHeadVO();
		paper.setPaperhead_id(paperhead_id);
		paper.setPaper_type_cd(paper_type_cd);
		paper.setPaper_round(paper_round);
		paper.setExcel_file(excel_file);
		
		Part part = request.getPart("excel_file");
		String excel_file1 = getFileName(part);
		
		if (excel_file1 != null && !excel_file1.isEmpty()) {
				 
			File renameFile = FileRenamePolicy.rename(new File(excel_file1));
			part.write(renameFile.getName());
			paper.setExcel_file(path+"/"+renameFile.getName());
		}
		PaperHeadDAO dao = new PaperHeadDAO();
		dao.insert(paper);

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
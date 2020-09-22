package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.HashTagDAO;
import model.HashTagVO;

public class HashInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hashtag_id = request.getParameter("hashtag_id");
		String classify_code_cd = request.getParameter("classify_code_cd"); 
		
		HashTagVO hashTag = new HashTagVO();
		hashTag.setHashtag_id(hashtag_id);
		hashTag.setClassify_code_cd(classify_code_cd);
		
		HashTagDAO.getInstance().insert(hashTag);
		
		request.getRequestDispatcher("/admin/excelInsertOutput.jsp").forward(request, response);
		
	}

}

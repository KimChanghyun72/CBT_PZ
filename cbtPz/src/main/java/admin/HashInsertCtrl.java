package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.HashtagDAO;
import model.HashtagVO;

public class HashInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hashtag_id = request.getParameter("hashtag_id");
		String classify_code_cd = request.getParameter("classify_code_cd"); 
		
		HashtagVO hashTag = new HashtagVO();
		hashTag.setHashtag_id(hashtag_id);
		hashTag.setClassify_code_cd(classify_code_cd);
		
		HashtagDAO.getInstance().insert(hashTag);
		
		request.getRequestDispatcher("/admin/excelInsertOutput.jsp").forward(request, response);
		
	}

}

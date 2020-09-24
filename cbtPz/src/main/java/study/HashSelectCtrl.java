package study;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.HashtagVO;
import model.PaperHeadDAO;

public class HashSelectCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("해쉬검색");
		String path = "hashSelect.jsp";
		
		
		//파라미터 변수에 저장
		String hashtag_name = request.getParameter("hashtag_name");
		
		//VO에 담기
		HashtagVO hash = new HashtagVO();
		hash.setHashtag_name(hashtag_name);
		
		//서비스		
		PaperHeadDAO dao = new PaperHeadDAO();
		List<Map<String, Object>> hashSelect = dao.selectHash(hash);
		
		
		//조회결과를 저장후에 결과페이지로 포워드
		request.setAttribute("hashSelect", hashSelect);
		
		request.getRequestDispatcher("/study/"+path).forward(request, response);
		
	}

}

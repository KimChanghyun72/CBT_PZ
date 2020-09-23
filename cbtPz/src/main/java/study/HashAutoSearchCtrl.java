package study;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.HashtagDAO;
import model.HashtagVO;
import net.sf.json.JSONArray;

//해쉬태그검색 자동완성
public class HashAutoSearchCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//파라미터 변수에 저장
		String hashtag_name = request.getParameter("hashtag_name");
		
		//VO에 담기
		HashtagVO hash = new HashtagVO();
		hash.setHashtag_name(hashtag_name);
		
		//서비스		
		HashtagDAO dao = new HashtagDAO();
		ArrayList<HashtagVO> hashSelect = dao.selectHashtag(hash);
		
		
		//조회결과를 저장후에 결과페이지로 포워드
		String str =  JSONArray.fromObject(hashSelect).toString();
		response.getWriter().print(str);
	}

}

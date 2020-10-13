package retest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.FavoriteDAO;
import model.FavoriteVO;
import model.MemberVo;

//즐겨찾기 등록
public class MyFavoriteInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		MemberVo memberVo= (MemberVo) request.getSession().getAttribute("login");
		
		//파라미터 변수에 저장
		String problem_id = request.getParameter("problem_id");
		String member_id = memberVo.getMember_id();
		
		//VO에 담기
		FavoriteVO favoriteVO = new FavoriteVO();
		
		favoriteVO.setProblem_id(problem_id);
		favoriteVO.setMember_id(member_id);
		
		//서비스		
		FavoriteDAO.getInstance().insertFavorite(favoriteVO);		
		

	}

}

package retest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.HttpUtil;
import controller.Controller;
import model.FavoriteDAO;
import model.FavoriteVO;
import model.MemberVo;
import model.SolveVO;

public class MyFavoriteCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Parameter 추출
		MemberVo member = (MemberVo) request.getSession().getAttribute("login");
		String member_id = member.getMember_id();
		
		SolveVO solvevo = new SolveVO();
		solvevo.setMember_id(member_id);
		
		// DAO 객체의 메소드 호출
		FavoriteDAO dao = FavoriteDAO.getInstance();
		ArrayList<FavoriteVO> favorite = dao.selectAllFavorite(solvevo);
		
		// page 이동
		request.setAttribute("favorite_list", favorite);
		HttpUtil.forward(request, response, "/mypage/myFavorite.jsp");
	}

}

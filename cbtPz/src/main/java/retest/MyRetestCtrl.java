package retest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.HttpUtil;
import controller.Controller;
import model.MemberVo;
import model.ProblemDAO;
import model.ProblemVO;
import model.SolveVO;

public class MyRetestCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Parameter 추출
		MemberVo member = (MemberVo) request.getSession().getAttribute("login");
		String member_id = member.getMember_id();
		//
		SolveVO solvevo = new SolveVO();
		solvevo.setMember_id(member_id);
		
		// DAO 객체의 메소드 호출
		ProblemDAO dao = ProblemDAO.getInstance();
		ArrayList<ProblemVO> problem = dao.selectAllRetest(solvevo);
		
		// page 이동
		request.setAttribute("retest_list", problem);
		HttpUtil.forward(request, response, "/mypage/myRetest.jsp");
	}

}

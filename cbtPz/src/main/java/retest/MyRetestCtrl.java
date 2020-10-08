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
		String path = "myRetest.jsp";
		// Parameter 추출
		MemberVo memberVo= (MemberVo) request.getSession().getAttribute("login");
		SolveVO solveVo = new SolveVO();
		
		//파라미터 변수에 저장
		String member_id = memberVo.getMember_id();
		
		// VO에 담기
		solveVo.setMember_id(member_id);
		
		// DAO 객체의 메소드 호출
		ArrayList<SolveVO> problem = ProblemDAO.getInstance().selectAllRetest(solveVo);
		
		// page 이동
		request.getSession().setAttribute("solvelist", problem);
		request.getRequestDispatcher("/mypage/"+path).forward(request, response);
	}

}

package study;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.SolveDAO;
import model.SolveVO;

public class SolveInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String path = "study_result.jsp";
				
		SolveVO solveVO = new SolveVO();

		solveVO.setSolve_score(request.getParameter("testScore"));
		solveVO.setMember_id(request.getParameter("member_id"));
		solveVO.setSolve_time(request.getParameter("testTime"));
		solveVO.setSolve_type_cd(request.getParameter("solve_type_cd"));
		solveVO.setSolve_cnt(request.getParameter("testNum"));
		
				
		SolveDAO dao = new SolveDAO();
		dao.insertSolve(solveVO);

		//response.sendRedirect("/study/"+path);

	}

}

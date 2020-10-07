package study;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.SolveDAO;
import model.SolveVO;

public class SolveUpdateCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//String path = "studyPaper.jsp";
		
		SolveVO solveVO = new SolveVO();
		System.out.println();
		solveVO.setSolve_score(request.getParameter("testScore"));	
		solveVO.setSolve_time(request.getParameter("testTime"));
		solveVO.setSolve_cnt(request.getParameter("testNum"));
		solveVO.setSolve_id(request.getParameter("solve_id"));
		
				
		SolveDAO dao = new SolveDAO();
		dao.UpateSolve(solveVO);

		//response.sendRedirect(path);
		
	}

}

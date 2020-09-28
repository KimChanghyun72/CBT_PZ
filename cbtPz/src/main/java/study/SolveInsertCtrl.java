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
		String path = "";
		
		String member_id = request.getParameter("member_id");
		String solve_type_cd = request.getParameter("solve_type_cd");
		
		SolveVO solve = new SolveVO();

		solve.setMember_id(member_id);
		solve.setSolve_type_cd(solve_type_cd);
		
		SolveDAO dao = new SolveDAO();
		dao.insertSolve(solve);;

		request.getRequestDispatcher(""+path).forward(request, response);

	}

}

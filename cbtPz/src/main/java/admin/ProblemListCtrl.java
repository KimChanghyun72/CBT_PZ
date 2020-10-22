package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.ProblemDAO;
import model.ProblemVO;

public class ProblemListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<ProblemVO> problemList = ProblemDAO.getInstance().selectAll(null);
		System.out.println(problemList);
		
		
		String path = "/admin/quizInsert.jsp";
		request.setAttribute("problemList", problemList);
		request.getRequestDispatcher(path).forward(request, response);
		
	}
}

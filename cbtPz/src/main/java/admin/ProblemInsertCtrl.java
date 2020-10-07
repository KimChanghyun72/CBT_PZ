package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.ProblemDAO;
import model.ProblemVO;

public class ProblemInsertCtrl implements Controller {    // 개별문제 등록 페이지 

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subject = request.getParameter("subject");
		String haeseol = request.getParameter("haeseol");
		String problem_text = request.getParameter("problem_text");
		String ans_1 = request.getParameter("ans_1");
		String ans_2 = request.getParameter("ans_2");
		String ans_3 = request.getParameter("ans_3");
		String ans_4 = request.getParameter("ans_4");
		String paperhead_id = request.getParameter("paperhead_id");
		String ans_correct = request.getParameter("ans_correct"); 
		System.out.println(subject);

		ProblemVO problem = new ProblemVO();
		problem.setSubject(subject);
		problem.setHaeseol(haeseol);
		problem.setProblem_text(problem_text);
		problem.setAns_1(ans_1);
		problem.setAns_2(ans_2);
		problem.setAns_3(ans_3);
		problem.setAns_4(ans_4);
		problem.setPaperhead_id(paperhead_id);
		problem.setAns_correct(ans_correct);
		
		ProblemDAO.getInstance().insert(problem);
		
		request.getRequestDispatcher("/admin/problemInsertOutput.jsp").forward(request, response);	
	}

}

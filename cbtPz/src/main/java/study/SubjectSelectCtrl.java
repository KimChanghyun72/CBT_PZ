package study;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class SubjectSelectCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("과목검색");
		String path = "subjectList.jsp";
		
		request.getSession().setAttribute("pageName", "과목별 학습하기");
		request.getRequestDispatcher(path).forward(request, response);
		/* request.getRequestDispatcher("/study/"+path).forward(request, response); */
	}

}

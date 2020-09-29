package study;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.PaperHeadDAO;
import model.ProblemVO;

public class ProblemSubCtrl implements Controller {
	/**과목별 문제 불러오기**/
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "studyPaper.jsp";
		
		ProblemVO subVO = new ProblemVO();
		
		String subject = request.getParameter("subject");
		
		subVO.setSubject(subject);
		
		PaperHeadDAO dao = new PaperHeadDAO();
		
		List<Map<String, Object>> sub = dao.selectSubjectType(subVO);
		
		request.getSession().setAttribute("problemList", sub);
		
		request.getRequestDispatcher("/study/"+path).forward(request, response);
	}

}

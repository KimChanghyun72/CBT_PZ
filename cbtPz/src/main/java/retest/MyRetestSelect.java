package retest;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.PaperHeadDAO;
import model.SearchVO;

public class MyRetestSelect implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "studyPaper.jsp";
		SearchVO searchVO = new SearchVO();
		
		String solve_id = request.getParameter("solve_id");
		
		searchVO.setSolve_id(solve_id);
		
		List<Map<String, Object>> selectproblem = PaperHeadDAO.getInstance().selectAllType(searchVO);
		request.getSession().setAttribute("problemList", selectproblem);
		request.getRequestDispatcher("/study/"+path).forward(request, response);
	}

}

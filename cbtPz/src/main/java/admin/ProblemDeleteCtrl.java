package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.ProblemDAO;
import model.ProblemVO;
import net.sf.json.JSONObject;
import net.sf.json.JSONString;

public class ProblemDeleteCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProblemVO resultVO = new ProblemVO();
		resultVO.setProblem_id(request.getParameter("problem_id"));
		
		System.out.println(resultVO);
		ProblemDAO.getInstance().delete(resultVO);
		
		
		String result = JSONObject.fromObject(resultVO).toString();
		
		response.getWriter().print(result);
	}

}

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

//오답노트  응시문제 재출력
public class MyRetestSelect implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "myRetestSelect.jsp";
		SearchVO searchVO = new SearchVO();
			
		String solve_id = request.getParameter("solve_id");
		String solve_type_name = request.getParameter("solve_type_name");
		
		searchVO.setSolve_id(solve_id);
		System.out.println(searchVO);
		List<Map<String, Object>> selectproblem = PaperHeadDAO.getInstance().selectAllType(searchVO);
		request.getSession().setAttribute("problemList", selectproblem);
		request.getSession().setAttribute("pageName", solve_type_name);
		request.getRequestDispatcher("/mypage/"+path).forward(request, response);
	}

}

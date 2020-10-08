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

//오답노트에서 응시했던 문제 재출력
public class MyRetestSelect implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "myRetestSelect.jsp";
		SearchVO searchVO = new SearchVO();
			
		String solve_id = request.getParameter("solve_id");
		
		searchVO.setSolve_id(solve_id);
		System.out.println(searchVO);
		List<Map<String, Object>> selectproblem = PaperHeadDAO.getInstance().selectAllType(searchVO);
		System.out.println(selectproblem);
		request.getSession().setAttribute("problemList", selectproblem);
		request.getRequestDispatcher("/mypage/"+path).forward(request, response);
	}

}

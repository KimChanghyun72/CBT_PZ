package study;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.PaperHeadDAO;
import model.SearchVO;

public class ProblemViewCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "studyPaper.jsp";
		SearchVO searchVO = new SearchVO();
		String solve_id = request.getParameter("solve_id");
		String solve_time = request.getParameter("solve_time");
		String check_num = request.getParameter("check_num");
		
		//문제조회
		searchVO.setSolve_id(solve_id); 	
		searchVO.setSolve_time(solve_time);
		searchVO.setCheck_num(check_num);
		List<Map<String, Object>> selectproblem = PaperHeadDAO.getInstance().selectAllType(searchVO);
		
		//조회결과를 저장후에 결과페이지로 포워드
		request.getSession().setAttribute("problemList", selectproblem);
		request.getRequestDispatcher("/study/"+path).forward(request, response);
	}

}

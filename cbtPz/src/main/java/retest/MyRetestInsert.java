package retest;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberVo;
import model.PaperHeadDAO;
import model.SearchVO;

//오답노트  응시문제 재응시
public class MyRetestInsert implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "studyPaper.jsp";
		
		MemberVo memberVo= (MemberVo) request.getSession().getAttribute("login");
		SearchVO searchVO = new SearchVO();
		
		String member_id = memberVo.getMember_id();
		String solve_id = request.getParameter("solve_id");
		
		//VO에 담기		
		searchVO.setMember_id(member_id);
		searchVO.setSolve_id(solve_id);
		
		//문제등록 				
		int next = PaperHeadDAO.getInstance().retest_Proc(searchVO);
		
		//문제조회
		searchVO.setSolve_id(Integer.toString(next)); 
		List<Map<String, Object>> selectproblem = PaperHeadDAO.getInstance().selectAllType(searchVO);

		request.getSession().setAttribute("problemList", selectproblem);
		
		request.getRequestDispatcher("/study/"+path).forward(request, response);
	}

}

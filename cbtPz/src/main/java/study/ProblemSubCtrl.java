package study;

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

public class ProblemSubCtrl implements Controller {
	/**과목별 문제 불러오기**/
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "studyPaper.jsp";
		
		MemberVo memberVo= (MemberVo) request.getSession().getAttribute("login");
		SearchVO searchVO = new SearchVO();
		
		String member_id = memberVo.getMember_id();
		String subject = request.getParameter("subject");
		
		
		
		//VO에 담기		
		searchVO.setMember_id(member_id);
		searchVO.setSubject(subject);
		
		//문제등록 				
		int next = PaperHeadDAO.getInstance().insert_Proc(searchVO);
		
		//문제조회
		searchVO.setSolve_id(Integer.toString(next)); 
		List<Map<String, Object>> selectproblem = PaperHeadDAO.getInstance().selectAllType(searchVO);

		request.getSession().setAttribute("problemList", selectproblem);
		
		request.getRequestDispatcher("/study/"+path).forward(request, response);
	}

}

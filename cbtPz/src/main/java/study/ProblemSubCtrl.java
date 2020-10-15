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
		String check = (String) request.getSession().getAttribute("check");
		MemberVo memberVo = new MemberVo();
		
		//일반회원 여부 체크
		if(check=="M") {
			memberVo= (MemberVo) request.getSession().getAttribute("login");
		
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
		
		response.sendRedirect(request.getContextPath()+"/study/problemView.do?solve_id="+next);

		} else {
			request.setAttribute("errcode", "1");
			request.setAttribute("errmsg", "일반회원만 문제를 풀 수 있습니다.");
			request.getRequestDispatcher("indexx.jsp").forward(request, response);
			/* response.sendRedirect("indexx.jsp"); */
		}
	}

}

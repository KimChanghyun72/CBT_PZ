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

public class ProblemHeadCtrl implements Controller {
	/**(모의/기출) 문제 불러오기**/
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		MemberVo memberVo = new MemberVo();
		String path = "studyPaper.jsp";
		String check = (String) request.getSession().getAttribute("check");
		
		
		
		memberVo= (MemberVo) request.getSession().getAttribute("login");
		
		SearchVO searchVO = new SearchVO();
		//문제 유형 세션에서 불러옴.
		
		
		//파라미터 변수에 저장
		String member_id = memberVo.getMember_id();
		String paperhead_id = request.getParameter("paperhead_id");
		
		
		//VO에 담기
		searchVO.setMember_id(member_id);
		searchVO.setPaperhead_id(paperhead_id);
		
		//문제등록 				
		int next = PaperHeadDAO.getInstance().insert_Proc(searchVO);
		
		//문제조회
		searchVO.setSolve_id(Integer.toString(next)); 
		List<Map<String, Object>> selectproblem = PaperHeadDAO.getInstance().selectAllType(searchVO);
		
		//조회결과를 저장후에 결과페이지로 포워드
		request.getSession().setAttribute("problemList", selectproblem);
		
		request.getRequestDispatcher("/study/"+path).forward(request, response);
		
		
	}

}

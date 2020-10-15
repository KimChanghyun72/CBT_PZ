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

public class HashSelectCtrl implements Controller {
	/**해쉬태그 문제 불러오기**/
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("해쉬검색");
		
		MemberVo memberVo= (MemberVo) request.getSession().getAttribute("login");
		SearchVO searchVO = new SearchVO();
		
		//파라미터 변수에 저장
		String member_id = memberVo.getMember_id();
		String hashtag_name = request.getParameter("hashtag_name");
		
		hashtag_name = hashtag_name.substring(0,hashtag_name.length()-1);
		
		//VO에 담기
		searchVO.setMember_id(member_id);
		searchVO.setHashtag_name(hashtag_name);
		
		//문제등록 				
		int next = PaperHeadDAO.getInstance().insert_Proc(searchVO);
		//서비스				
		searchVO.setSolve_id(Integer.toString(next)); 
		List<Map<String, Object>> selectproblem = PaperHeadDAO.getInstance().selectAllType(searchVO);
		//조회결과를 저장후에 결과페이지로 포워드
		request.getSession().setAttribute("problemList", selectproblem);
		response.sendRedirect(request.getContextPath()+"/study/problemView.do?solve_id="+next);
		
	}

}

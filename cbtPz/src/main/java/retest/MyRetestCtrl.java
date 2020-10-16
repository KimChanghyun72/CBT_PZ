package retest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;
import controller.Controller;
import model.MemberVo;
import model.ProblemDAO;
import model.SolveVO;

//응시이력 페이지 조회
public class MyRetestCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "myRetest.jsp";
		
		String p = request.getParameter("p");
		
		int page = 1;
		if(p != null) {
			page = Integer.parseInt(p);
		}
		
		Paging paging = new Paging();
		paging.setPageUnit(7);
		paging.setPageSize(5);
		paging.setPage(page);
		
		ProblemDAO dao = new ProblemDAO();
		
		
		// Parameter 추출
		MemberVo memberVo= (MemberVo) request.getSession().getAttribute("login");
		SolveVO solveVo = new SolveVO();
		
		//파라미터 변수에 저장
		String member_id = memberVo.getMember_id();
		
		// VO에 담기
		solveVo.setMember_id(member_id);
		paging.setTotalRecord(dao.count(solveVo));
		solveVo.setFirst(paging.getFirst());
		solveVo.setLast(paging.getLast());
		
		
		// DAO 객체의 메소드 호출
		ArrayList<SolveVO> problem = ProblemDAO.getInstance().selectAllRetest(solveVo);
		
		// page 이동
		request.getSession().setAttribute("pageName", "응시이력");
		request.setAttribute("paging", paging);
		request.getSession().setAttribute("solvelist", problem);
		request.getRequestDispatcher("/mypage/"+path).forward(request, response);
	}

}

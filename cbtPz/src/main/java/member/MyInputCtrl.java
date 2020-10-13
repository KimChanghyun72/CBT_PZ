package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.HttpUtil;
import common.Paging;
import controller.Controller;
import model.BoardDAO;
import model.BoardVO;
import model.MemberVo;

public class MyInputCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Parameter 추출
		MemberVo member = (MemberVo) request.getSession().getAttribute("login");
		String member_id = member.getMember_id();
		System.out.println(member_id);
		// member_id를 기준으로 조회
		
		BoardVO boardvo = new BoardVO();
		boardvo.setMember_id(member_id);
		
		// DAO 객체의 메소드 호출
		BoardDAO dao = BoardDAO.getInstance();
	
		
		
		
		
		/* paging 영역 - BoardListCtrl에서 가져옴 */
		
		String p = request.getParameter("p");	
		
		
		int page = 1;
		if(p != null) {
			page = Integer.parseInt(p);
		}
		Paging paging = new Paging();
		paging.setPageUnit(10);
		paging.setPageSize(3);
		paging.setPage(page);
		
		paging.setTotalRecord(dao.mycount(boardvo));
		boardvo.setFirst(paging.getFirst());
		boardvo.setLast(paging.getLast());
		// boardvo에 담음
		
		/* 여기까지 paging 영역 */
		
		ArrayList<BoardVO> board = dao.selectMemberAll(boardvo);
		
		
		//페이지이름 할당
		
		request.getSession().setAttribute("pageName", "작성글");
		// page 이동
		request.setAttribute("board_list", board);
		request.setAttribute("paging", paging);
		request.getSession().setAttribute("pageName", "작성글");
		HttpUtil.forward(request, response, "/mypage/myInput.jsp");
		// request.getRequestDispatcher("/mypage/myInput.jsp").forward(request, response);
	}
}

package board;

import java.io.IOException;
import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;
import controller.Controller;
import model.BoardDAO;
import model.BoardVO;

public class BoardListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		String p = request.getParameter("p");	
		String select = request.getParameter("select");	
		String board_title = null;
		String member_id = null ;
		BoardVO best = null;
		
		//###검색어 제목 or 작성자 값을 요청###
		if(("searchtitle").equals(select)) {
			board_title = request.getParameter("search");
		}
		if(("searchposter").equals(select)) {		
			member_id =  request.getParameter("search");
		}
		
		//###페이징처리###
		int page = 1;
		if(p != null) {
			page = Integer.parseInt(p);
		}
		Paging paging = new Paging();
		paging.setPageUnit(10);
		paging.setPageSize(3);
		paging.setPage(page);
		
		BoardVO board = new BoardVO();
		
		board.setFirst(paging.getFirst());
		board.setLast(paging.getLast());
		board.setBoard_title(board_title);
		board.setMember_id(member_id);
		paging.setTotalRecord(dao.count(board));
		
		best = dao.bestSelect(board);
		request.setAttribute("best", best);
		
		ArrayList<BoardVO> list = dao.selectAll(board);
		request.getSession().setAttribute("pageName", "자유게시판");
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.getRequestDispatcher("/board/boardList.jsp").forward(request, response);
	
		
	
	
	
	}

}

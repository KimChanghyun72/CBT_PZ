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
		
		
		int page = 1;
		if(p != null) {
			page = Integer.parseInt(p);
		}
		Paging paging = new Paging();
		paging.setPageUnit(10);
		paging.setPageSize(3);
		paging.setPage(page);
		
		BoardVO board = new BoardVO();
		
		paging.setTotalRecord(dao.count(board));
		board.setFirst(paging.getFirst());
		board.setLast(paging.getLast());
		
		ArrayList<BoardVO> list = dao.selectAll(board);
		request.getSession().setAttribute("pageName", "자유게시판");
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.getSession().setAttribute("pageName", "자유게시판");
		request.getRequestDispatcher("/board/boardList.jsp").forward(request, response);
	
		
	
	
	
	}

}

package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;
import controller.Controller;
import model.BoardVO;
import model.NoticeDAO;

public class NoticeListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeDAO dao = new NoticeDAO();
		
		String p = request.getParameter("p");	
		
		
		int page = 1;
		if(p != null) {
			page = Integer.parseInt(p);
		}
		Paging paging = new Paging();
		paging.setPageUnit(5);
		paging.setPageSize(3);
		paging.setPage(page);
		
		BoardVO board = new BoardVO();
		
		paging.setTotalRecord(dao.count(board));
		board.setFirst(paging.getFirst());
		board.setLast(paging.getLast());
		
		ArrayList<BoardVO> list = dao.selectAll(board);
		request.getSession().setAttribute("pageName", "공지사항");
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.getRequestDispatcher("/board/noticeList.jsp").forward(request, response);
	

	}

}

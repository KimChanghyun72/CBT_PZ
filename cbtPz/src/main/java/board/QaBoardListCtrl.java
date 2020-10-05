package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;
import controller.Controller;
import model.QaBoardDAO;
import model.QaBoardVO;

public class QaBoardListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QaBoardDAO dao = new QaBoardDAO();
		
		String p = request.getParameter("p");
		int page = 1;
		if(p !=null) {
			page = Integer.parseInt(p);
		}
		Paging paging = new Paging();
		paging.setPageUnit(5);
		paging.setPageSize(3);
		paging.setPage(page);
		
		QaBoardVO qaboard =  new QaBoardVO();
		
		paging.setTotalRecord(dao.count(qaboard));
		qaboard.setFirst(paging.getFirst());
		qaboard.setLast(paging.getLast());
		
		ArrayList<QaBoardVO> list = dao.selectAll(qaboard);
		request.getSession().setAttribute("pageName", "Q&A");
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.getSession().setAttribute("pageName", "Q&A 게시판");
		request.getRequestDispatcher("/board/qaboardList.jsp").forward(request, response);

	}

}

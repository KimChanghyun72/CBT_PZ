package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.BoardDAO;
import model.BoardVO;
import model.NoticeDAO;

public class NoticeSelectCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "notice.jsp";
		NoticeDAO dao = new NoticeDAO();
		String board_file=request.getParameter("board_file");
		String board_id = request.getParameter("board_id");
		BoardVO board = new BoardVO();
		board.setBoard_id(board_id);
		board.setBoard_file(board_file);
		if(board_id.isEmpty()) {
			
			request.getRequestDispatcher("}/board/"+path).forward(request, response);
			return;
		}
		
		board = dao.selectOne(board);
		request.setAttribute("board", board);
		
		request.getRequestDispatcher("/board/notice.jsp")
		.forward(request, response);
	}

}

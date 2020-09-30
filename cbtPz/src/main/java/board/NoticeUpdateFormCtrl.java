package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.BoardDAO;
import model.BoardVO;
import model.NoticeDAO;

public class NoticeUpdateFormCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String path = "/board/noticeUpdate.jsp";
		
		NoticeDAO dao = new NoticeDAO();			
		String board_id = request.getParameter("board_id");
		

		if(!board_id.isEmpty()) {
			BoardVO board = new BoardVO();
			board.setBoard_id(board_id);						
			board = dao.upselectOne(board);
			request.setAttribute("board", board);
		}
				
		request.getRequestDispatcher(path)
			.forward(request, response);
	}

}

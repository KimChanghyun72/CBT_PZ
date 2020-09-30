package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.BoardDAO;
import model.BoardVO;
import model.NoticeDAO;

public class NoticeDeleteCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String board_id = request.getParameter("board_id");
		BoardVO board  = new BoardVO();
		board.setBoard_id(board_id);
		NoticeDAO.getInstance().delete(board);
		request.getRequestDispatcher("/board/noticeDeleteOutput.jsp")
		.forward(request, response);

	}

}

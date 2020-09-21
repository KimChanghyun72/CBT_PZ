package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import controller.Controller;
import model.BoardDAO;
import model.BoardVO;

public class BoardDeleteCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String board_id = request.getParameter("board_id");
		BoardVO board  = new BoardVO();
		board.setBoard_id(Integer.parseInt(board_id));
		BoardDAO.getInstance().delete(board);
		request.getRequestDispatcher("/board/boardDeleteOutput.jsp")
		.forward(request, response);

	}

}

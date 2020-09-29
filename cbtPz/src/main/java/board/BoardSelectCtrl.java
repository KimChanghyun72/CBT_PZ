package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.BoardDAO;
import model.BoardVO;

public class BoardSelectCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "board.jsp";
		BoardDAO dao = new BoardDAO();
		String board_file=request.getParameter("board_file");
		String board_id = request.getParameter("board_id");
		BoardVO board = new BoardVO();
		board.setBoard_id(Integer.parseInt(board_id));
		board.setBoard_file(board_file);
		if(board_id.isEmpty()) {
			
			request.getRequestDispatcher("}/board/"+path).forward(request, response);
			return;
		}
		dao.updateBoardCnt(board);
		board = dao.selectOne(board);
		request.setAttribute("board", board);
		
		request.getRequestDispatcher("/board/board.jsp")
		.forward(request, response);
	}

}

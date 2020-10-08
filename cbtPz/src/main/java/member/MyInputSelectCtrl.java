package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.BoardDAO;
import model.BoardVO;

public class MyInputSelectCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/mypage/myInputSelect.jsp";
		// FrontController와 경로 맞춰야 함
		BoardDAO dao = new BoardDAO();
		String board_id = request.getParameter("board_id");
		BoardVO board = new BoardVO();
		board.setBoard_id(board_id);

		if (board_id.isEmpty()) {

			request.getRequestDispatcher("/board/" + path).forward(request, response);
			return;
		}
		dao.updateBoardCnt(board);
		board = dao.selectOne(board);
		request.setAttribute("board", board);

		request.getRequestDispatcher("/mypage/myInputSelect.jsp").forward(request, response);
	}

}

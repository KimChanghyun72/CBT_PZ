package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.BoardDAO;
import model.BoardVO;

public class myInputDelete implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] board_id = request.getParameterValues("chkDelete");
		for(int i=0; i<board_id.length; i++) {
		BoardVO board  = new BoardVO();
		board.setBoard_id(board_id[i]);
		BoardDAO.getInstance().delete(board);
		}
		
		response.sendRedirect("/cbtPz/mypage/myInput.do");
	}

}

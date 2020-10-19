package member;

import java.io.IOException;
import java.io.PrintWriter;

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
		PrintWriter out=response.getWriter();
		response.resetBuffer();
		response.setContentType("text/html;charset=utf-8");
		out.println("<script>");
		out.println("alert('삭제되었습니다')");
		out.println("location.href='/cbtPz/mypage/myInput.do'");
		out.println("</script>");
		response.flushBuffer();
		// 삭제 후 메시지 출력이 되어야 하기 때문에 삭제 후 메시지는 서버에서 추가해야 함.
		//response.sendRedirect("/cbtPz/mypage/myInput.do");
	}

}

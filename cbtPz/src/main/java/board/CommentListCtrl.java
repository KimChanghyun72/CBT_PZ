package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.CommentDAO;
import model.CommentVO;
import net.sf.json.JSONArray;

public class CommentListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentDAO dao = new CommentDAO();
		CommentVO vo = new CommentVO();
		String board_id = request.getParameter("board_id");
		vo.setBoard_id(board_id);
		
		ArrayList<CommentVO> list = dao.selectAll(vo);
		String result = JSONArray.fromObject(list).toString();
		System.out.println(result);
		response.getWriter().print(result);
		
	}

}

package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.CommentDAO;
import model.CommentVO;
import net.sf.json.JSONObject;

public class CommentInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentVO vo = new CommentVO();

		
		vo.setComment_poster(request.getParameter("comment_poster"));
		vo.setComment_contents(request.getParameter("comment_contents"));
		vo.setBoard_id(request.getParameter("board_id"));
		System.out.println(vo.getComment_poster());
		System.out.println(vo.getComment_contents());
		System.out.println(vo.getBoard_id());
		CommentDAO.getInstance().insert(vo);
		String result = JSONObject.fromObject(vo).toString();
		response.getWriter().print(result);
	}

}

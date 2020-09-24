package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.CommentDAO;
import model.CommentVO;
import net.sf.json.JSONObject;

public class CommentDeleteCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String comment_id = request.getParameter("comment_id");
		CommentVO vo = new CommentVO();
		vo.setComment_id(comment_id);
		CommentVO resultVO = CommentDAO.getInstance().selectOne(vo);
		String result = JSONObject.fromObject(resultVO).toString();
		response.getWriter().print(result);
		
		CommentDAO.getInstance().delete(vo);
		
	}

}

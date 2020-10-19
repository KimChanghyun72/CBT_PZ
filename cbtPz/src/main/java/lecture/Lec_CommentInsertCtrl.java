package lecture;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.CommentDAO;
import model.CommentVO;
import model.Lec_CommentsDAO;
import model.Lec_CommentsVO;
import net.sf.json.JSONObject;

public class Lec_CommentInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Lec_CommentsVO vo = new Lec_CommentsVO();
		
		vo.setLec_comments_poster(request.getParameter("comment_poster"));
		vo.setLec_comments_contents(request.getParameter("comment_contents"));
		vo.setLecture_id(request.getParameter("lecture_id"));
		
		System.out.println(vo.getLec_comments_contents());
		System.out.println(vo.getLec_comments_poster());
		System.out.println(vo.getLecture_id());
		vo = Lec_CommentsDAO.getInstance().insert(vo);
		System.out.println("insert vo" + vo);
		
		String result = JSONObject.fromObject(vo).toString();
		response.getWriter().print(result);

	}

}

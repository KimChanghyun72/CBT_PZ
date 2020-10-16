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

public class Lec_CommentDelCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String lec_comments_id = request.getParameter("lec_comments_id");
		System.out.println("lec_comments_id" + lec_comments_id);
		Lec_CommentsVO vo = new Lec_CommentsVO();
		vo.setLec_comments_id(lec_comments_id);
		System.out.println(vo);
		
		 //Lec_CommentsVO resultVO = Lec_CommentsDAO.getInstance() String result =
		
		int r = Lec_CommentsDAO.getInstance().delete(vo);
		System.out.println(r+"건이 삭제되었습니다.");
		String result = JSONObject.fromObject(vo).toString();
		response.getWriter().print(result);
		
	}

}

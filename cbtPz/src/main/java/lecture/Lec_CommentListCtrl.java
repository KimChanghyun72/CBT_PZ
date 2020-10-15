package lecture;

import java.awt.List;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Lec_CommentsDAO;
import model.Lec_CommentsVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Lec_CommentListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String lecture_id = request.getParameter("lecture_id");
		System.out.println("lecture_id :"+lecture_id);
		Lec_CommentsVO lec_commentsVO = new Lec_CommentsVO();
		ArrayList<Lec_CommentsVO> lec_commentsList = new ArrayList<Lec_CommentsVO>();
		
		lec_commentsVO.setLecture_id(lecture_id);
		
		lec_commentsList = Lec_CommentsDAO.getInstance().selectAll(lec_commentsVO);
		System.out.println("lec_commentsList : " + lec_commentsList);
		
		String result = JSONArray.fromObject(lec_commentsList).toString();
		System.out.println("제이슨 스트링"+result);
		response.getWriter().print(result);
		

	}

}

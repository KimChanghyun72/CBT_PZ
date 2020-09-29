package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.QaBoardDAO;
import model.QaBoardVO;
import net.sf.json.JSONObject;

public class QaCommentUpdateCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qaboard_id = request.getParameter("qaboard_id");
		String qaboard_ans = request.getParameter("qaboard_ans");
		
		QaBoardVO qaboard = new QaBoardVO();
		
		qaboard.setQaboard_ans(qaboard_ans);
		qaboard.setQaboard_id(Integer.parseInt(qaboard_id));
		QaBoardDAO.getInstance().replyawser(qaboard);
		String result = JSONObject.fromObject(qaboard).toString();
		response.getWriter().print(result);
		
	}

}

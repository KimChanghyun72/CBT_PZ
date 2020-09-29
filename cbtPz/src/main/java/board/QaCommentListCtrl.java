package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.QaBoardDAO;
import model.QaBoardVO;
import net.sf.json.JSONArray;

public class QaCommentListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QaBoardDAO dao =  new QaBoardDAO();
		QaBoardVO vo = new QaBoardVO();
		String qaboard_id = request.getParameter("qaboard_id");
		vo.setQaboard_id(Integer.parseInt(qaboard_id));
		
		ArrayList<QaBoardVO> list = dao.replyselectAll(vo);
		String result = JSONArray.fromObject(list).toString();
		response.getWriter().print(result);
		
		
	

	}

}

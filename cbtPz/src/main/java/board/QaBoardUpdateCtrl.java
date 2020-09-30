package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.QaBoardDAO;
import model.QaBoardVO;

public class QaBoardUpdateCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qaboard_id =request.getParameter("qaboard_id");
		String qaboard_title = request.getParameter("qaboard_title");
		String qaboard_contents = request.getParameter("qaboard_contents");
		String member_id = request.getParameter("member_id");

		QaBoardVO qaboard = new QaBoardVO();
		
		qaboard.setQaboard_title(qaboard_title);
		qaboard.setQaboard_contents(qaboard_contents);
		qaboard.setMember_id(member_id);
		qaboard.setQaboard_id(Integer.parseInt(qaboard_id));
		
		QaBoardDAO dao = new QaBoardDAO();
		dao.update(qaboard);
		
		request.getRequestDispatcher("/ajax/qaboardSelect.do?=qaboard_id"+qaboard_id).forward(request, response);
	}

}

package board;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.QaBoardDAO;
import model.QaBoardVO;

public class QaBoardInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qaboard_title = request.getParameter("qaboard_title");
		String qaboard_contents = request.getParameter("qaboard_contents");
		String member_id = request.getParameter("member_id");
		String qaboard_type_cd = request.getParameter("qaboard_type_cd");
	
		QaBoardVO qaboard = new QaBoardVO();

		qaboard.setQaboard_title(qaboard_title);
		qaboard.setQaboard_contents(qaboard_contents);
		qaboard.setMember_id(member_id);
		qaboard.setQaboard_type_cd(qaboard_type_cd);
	
		QaBoardDAO dao = new QaBoardDAO();
		dao.insert(qaboard);

		request.getRequestDispatcher("/board/qaboardInsertOutput.jsp").forward(request, response);
		
	}

	


	
}

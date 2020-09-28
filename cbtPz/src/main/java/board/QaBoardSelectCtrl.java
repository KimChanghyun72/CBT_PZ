package board;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.QaBoardDAO;
import model.QaBoardVO;

public class QaBoardSelectCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "qaboard.jsp";
		
		QaBoardDAO dao = new QaBoardDAO();
		String qaboard_id = request.getParameter("qaboard_id");
		QaBoardVO qaboard = new QaBoardVO();
		qaboard.setQaboard_id(Integer.parseInt(qaboard_id));
		
		if(qaboard_id.isEmpty()) {
			
			request.getRequestDispatcher("board/"+path).forward(request, response);
			return;
		}
		dao.updateQaboardCnt(qaboard);
		qaboard = dao.selectOne(qaboard);
		request.setAttribute("qaboard", qaboard);
		
		request.getRequestDispatcher("qaboard.jsp")
		.forward(request, response);
	}
}

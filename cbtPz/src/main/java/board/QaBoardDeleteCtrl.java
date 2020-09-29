package board;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.QaBoardDAO;
import model.QaBoardVO;

public class QaBoardDeleteCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qaboard_id = request.getParameter("qaboard_id");
		QaBoardVO qaboard  = new QaBoardVO();
		qaboard.setQaboard_id(Integer.parseInt(qaboard_id));
		QaBoardDAO.getInstance().delete(qaboard);
		request.getRequestDispatcher("/board/qaboardDeleteOutput.jsp")
		.forward(request, response);

	}

}

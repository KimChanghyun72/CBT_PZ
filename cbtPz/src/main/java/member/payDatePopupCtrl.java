package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

public class payDatePopupCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//request.getRequestDispatcher("/payDatePopup.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath() + "/member/payDatePopup.jsp");

	}

}

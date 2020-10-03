package common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.BoardVO;
import model.NoticeDAO;

public class MainCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.sendRedirect("main.jsp"); //세션 아이디 정리하면 request로 포워드바꾸기
		
		List<BoardVO> noticelist = new ArrayList<BoardVO>();
		noticelist = NoticeDAO.getInstance().selectMainTOP5();
		
		request.setAttribute("nlist", noticelist);
		request.getRequestDispatcher("main.jsp").forward(request, response);
		
	}

}

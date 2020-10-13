package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.HttpUtil;
import controller.Controller;

public class myRetestStatCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.sendRedirect(request.getContextPath() +"/mypage/myRetestStat.jsp");
		//request.getRequestDispatcher("/mypage/myRetestStat.jsp").forward(request, response);
		HttpUtil.forward(request, response, "/mypage/myRetestStat.jsp");
		

	}

}

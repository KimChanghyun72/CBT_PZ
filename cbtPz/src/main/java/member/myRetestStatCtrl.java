package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.HttpUtil;
import controller.Controller;
import model.MyStatDAO;
import model.MyStatVO;

public class myRetestStatCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.sendRedirect(request.getContextPath() +"/mypage/myRetestStat.jsp");
		//request.getRequestDispatcher("/mypage/myRetestStat.jsp").forward(request, response);
		
		//평균기간
		String memid = (String) request.getSession().getAttribute("loginId");
		
		MyStatVO barday = new MyStatVO();
		barday.setMember_id(memid);
		barday = MyStatDAO.getInstance().selectBarDay(barday); 
		
		MyStatVO pieday = new MyStatVO();
		pieday.setMember_id(memid);
		pieday = MyStatDAO.getInstance().selectPieDay(pieday); 
		
		
		request.setAttribute("barday", barday);
		request.setAttribute("pieday", pieday);

		HttpUtil.forward(request, response, "/mypage/myRetestStat.jsp");
	}

}

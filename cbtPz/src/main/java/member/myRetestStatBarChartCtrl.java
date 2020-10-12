package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MyStatDAO;
import model.MyStatVO;
import net.sf.json.JSONArray;

public class myRetestStatBarChartCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memid = (String) request.getSession().getAttribute("loginId");
		
		MyStatVO myStatVO = new MyStatVO();
		myStatVO.setMember_id(memid);
		
		ArrayList<MyStatVO> list = MyStatDAO.getInstance().subjectBarChart(myStatVO);
		
		String str = JSONArray.fromObject(list).toString();
		response.getWriter().print(str);

	}

}

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

public class myRetestStatLineChartCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memid = (String) request.getSession().getAttribute("loginId");
		//System.out.println(memid);
		
		MyStatVO myStatVO = new MyStatVO();
		myStatVO.setMember_id(memid);
		
		ArrayList<MyStatVO> list = MyStatDAO.getInstance().dayLineChart(myStatVO);
		//System.out.println(list);
		
		String str = JSONArray.fromObject(list).toString();
		response.getWriter().print(str);
		//System.out.println(str);
	}

}

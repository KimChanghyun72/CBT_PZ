package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MyStatVO;
import net.sf.json.JSONArray;

public class HashChartCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MyStatVO> list = MemberDAO.getInstance().selectHash();
		
		String str = JSONArray.fromObject(list).toString();
		response.getWriter().print(str);
		System.out.println("dddddddddd");
	}

}

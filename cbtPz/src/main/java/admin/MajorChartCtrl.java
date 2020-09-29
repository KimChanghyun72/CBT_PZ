package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MemberVo;
import net.sf.json.JSONArray;

public class MajorChartCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<MemberVo> list = MemberDAO.getInstance().selectMajor(null);
		
		String str = JSONArray.fromObject(list).toString();
		response.getWriter().print(str);

	}

}

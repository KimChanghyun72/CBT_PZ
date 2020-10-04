package member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MemberVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class FullCalendarCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<MemberVo> list = MemberDAO.getInstance().selectAllfc();
		System.out.println(list);
		JSONArray st = new JSONArray();
		for(MemberVo des : list) {
			JSONObject dseJson = new JSONObject();
			dseJson.put("title",des.getMember_name());
			dseJson.put("start",des.getPay_enddate());
			//dseJson.put("end",des.get("pay_enddate"));
			st.add(dseJson);
		}
		
		String str = JSONArray.fromObject(st).toString();
		System.out.println(str);
		response.getWriter().print(str);
		
	}

}

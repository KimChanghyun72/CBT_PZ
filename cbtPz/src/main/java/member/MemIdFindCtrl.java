package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MemberVo;
import net.sf.json.JSONObject;

public class MemIdFindCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idfind = request.getParameter("idfind");
		String member_name = request.getParameter("name");
		String email = request.getParameter("em");
		System.out.println(idfind);
		System.out.println(member_name + " , " + email);
		if(Integer.parseInt(idfind) == 0) {
			MemberVo memberVo = new MemberVo();
			memberVo.setMember_name(member_name);
			memberVo.setEmail(email);
			memberVo = MemberDAO.getInstance().selectIdOne(memberVo);
			String memberJVo = JSONObject.fromObject(memberVo).toString();
			
			response.getWriter().print(memberJVo);
		}
		
		if(idfind == "1") {
			
		}

	}

}

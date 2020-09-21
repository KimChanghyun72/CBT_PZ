package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MemberVo;
import net.sf.json.JSONObject;

public class MemIdCheckCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_id = request.getParameter("id");
		MemberVo memberVo = new MemberVo();
		memberVo.setMember_id(member_id);
		memberVo = MemberDAO.getInstance().selectOne(memberVo);
		String memberJVo = JSONObject.fromObject(memberVo).toString();
		
		response.getWriter().print(memberJVo);
	}

}

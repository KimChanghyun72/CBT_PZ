package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MemberVo;

public class MemberDelController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_id = request.getParameter("member_id");
		
		MemberVo membervo = new MemberVo();
		membervo.setMember_id(member_id);
		MemberDAO dao = MemberDAO.getInstance();
		dao.delete(membervo);

	}

}

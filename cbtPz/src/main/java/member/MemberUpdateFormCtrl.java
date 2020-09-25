package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MemberVo;


public class MemberUpdateFormCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/mypage/myInfo.jsp";
		
		MemberDAO dao = new MemberDAO();
			
		String member_id = request.getParameter("member_id");
		

		if(!member_id.isEmpty()) {
			MemberVo member = new MemberVo();
			member.setMember_id(member_id);
						
			member = dao.selectOne(member);
			request.setAttribute("member", member);
		}
				
			request.getRequestDispatcher(path).forward(request, response);
		
	}

}

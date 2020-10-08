package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MemberVo;

public class MemberDelController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVo member = (MemberVo) request.getSession().getAttribute("login");
		String member_id = member.getMember_id();
		
		request.getSession().invalidate(); // 회원탈퇴 시 로그아웃
		
		MemberVo membervo = new MemberVo();
		membervo.setMember_id(member_id);
		
		MemberDAO dao = MemberDAO.getInstance();
		dao.delete(membervo);
		
		// page 이동, 팝업
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();

		out.println("<script>");

		out.println("alert('회원 탈퇴 처리 되었습니다.');");
		
		out.println("location.href='/cbtPz/member/login.jsp';");
		
		out.println("</script>");

	}

}

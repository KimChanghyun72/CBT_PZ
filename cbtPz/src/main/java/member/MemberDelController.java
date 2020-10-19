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
		
		
		MemberVo membervo = new MemberVo();
		membervo.setMember_id(member_id);
		
		int r = MemberDAO.getInstance().delete(membervo);
		
		if (r == 1) {
		
		// page 이동, 팝업
		request.getSession().invalidate(); // 회원탈퇴 시 로그아웃
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('회원 탈퇴 처리 되었습니다.');");
		out.println("location.href='"+request.getContextPath()+"/mainCtrl.do';");
		out.println("</script>");
		
		} else {
			response.getWriter().append("<script>")
			.append("alert('탈퇴에 실패했습니다. 다시 시도해주세요');")
			.append("location.href='myInfo.do';")
			.append("</script>");
		};
	}

}

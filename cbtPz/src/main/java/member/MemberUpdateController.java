package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpUtils;

import common.HttpUtil;
import controller.Controller;
import model.MemberDAO;
import model.MemberVo;

public class MemberUpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Parameter 추출
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		String member_name = request.getParameter("member_name");
		String member_age = request.getParameter("member_age");
		String member_job = request.getParameter("member_job");
		String study_term = request.getParameter("study_term");
		String phone_number = request.getParameter("phone_number");
		String is_major = request.getParameter("is_major");
		String tested_num = request.getParameter("tested_num");
		String email = request.getParameter("email");
		// 유효성 체크
		if (member_id.isEmpty() || member_pw.isEmpty() || member_name.isEmpty() || member_age.isEmpty() || member_job.isEmpty()
				|| study_term.isEmpty() || phone_number.isEmpty() || is_major.isEmpty() || tested_num.isEmpty() || email.isEmpty()) {
			request.setAttribute("error", "모든 항목을 빠짐없이 입력해주시기 바랍니다.");
		//	HttpUtil.forward(request, response, "/myInfo.jsp");
			response.sendRedirect("myInfo.do?member_id="+member_id);
			return;
		}
		// VO 객체에 데이터 바인딩
		MemberVo member = new MemberVo();
		member.setMember_id(member_id);
		member.setMember_pw(member_pw);
		member.setMember_name(member_name);
		member.setMember_age(member_age);
		member.setMember_job(member_job);
		member.setStudy_term(study_term);
		member.setPhone_number(phone_number);
		member.setIs_major(is_major);
		member.setTested_num(tested_num);
		member.setEmail(email);
		// DAO 객체의 메소드 호출
		MemberDAO dao = MemberDAO.getInstance();
		dao.update(member);
		// Output View 페이지 이동
		response.sendRedirect("myInfo.do?member_id="+member_id);
	}

}

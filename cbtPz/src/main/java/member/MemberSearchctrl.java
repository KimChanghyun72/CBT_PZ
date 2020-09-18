package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.HttpUtil;
import controller.Controller;
import model.MemberDAO;
import model.MemberVo;

public class MemberSearchctrl implements Controller {
// /memberSearch.do 요청 처리, 회원정보 검색 기능
// 컨트롤러 이름 형식에 맞게 변경
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Parameter 추출
		String member_id = request.getParameter("ID");
		
		MemberVo membervo = new MemberVo(); //
		membervo.setMember_id(member_id); //
		MemberDAO dao = MemberDAO.getInstance();
		MemberVo member = dao.selectOne(membervo); //
		
		request.setAttribute("member", member); // myInfo.jsp value="${member.member_id }"
		HttpUtil.forward(request, response, "/mypage/myInfo.jsp"); // 이동
	}

}

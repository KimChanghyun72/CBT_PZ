package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.HttpUtil;
import controller.Controller;
import model.LearnDAO;
import model.LearnVO;
import model.MemberVo;

public class MemLectureCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// parameter 추출
		MemberVo member = (MemberVo) request.getSession().getAttribute("login");
		String member_id = member.getMember_id();

		LearnVO learnvo = new LearnVO();
		learnvo.setMember_id(member_id);
		// DAO 객체의 메소드 호출
		LearnDAO dao = LearnDAO.getInstance();
		ArrayList<LearnVO> learn = dao.selectAll(learnvo);
		
		// page 이동
		request.setAttribute("st_lecture_list", learn); //forEach
		HttpUtil.forward(request, response, "/mypage/memMyLecture.jsp");
	}

}

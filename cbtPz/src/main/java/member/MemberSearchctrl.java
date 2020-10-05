package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.HttpUtil;
import controller.Controller;
import model.LectureVO;
import model.MemberDAO;
import model.MemberVo;
import model.TeacherDAO;
import model.TeacherVO;

public class MemberSearchctrl implements Controller {
// /memberSearch.do 요청 처리, 회원정보 검색 기능
// 컨트롤러 이름 형식에 맞게 변경
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String check = (String) request.getSession().getAttribute("check");
		if(check.equals("M")) {
			
			// Parameter 추출
			String member_id = request.getParameter("member_id");
			
			MemberVo membervo = new MemberVo(); //
			membervo.setMember_id(member_id); //
			MemberDAO dao = MemberDAO.getInstance();
			MemberVo member = dao.selectOne(membervo); //
			
			request.setAttribute("member", member); // myInfo.jsp value="${member.member_id }"
		
		}
		
		//teacher 정보
		if(check.equals("T")) {
			TeacherVO teacherVO = (TeacherVO) request.getSession().getAttribute("login");
			String teacher_id = teacherVO.getTeacher_id();
			teacherVO.setTeacher_id(teacher_id);
			TeacherDAO tdao = TeacherDAO.getInstance();
			TeacherVO teacher = tdao.selectOne(teacherVO);
			request.setAttribute("teacher", teacher);
			System.out.println(teacher);
		}
	
		HttpUtil.forward(request, response, "/mypage/myInfo.jsp"); // 이동
	}

}

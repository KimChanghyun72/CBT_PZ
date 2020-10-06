package teacher;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.HttpUtil;
import controller.Controller;
import model.TeacherVO;

public class ProfUpdateCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("강사 정보 수정");
		TeacherVO teacherVO = (TeacherVO) request.getSession().getAttribute("login");
		String teacher_id = teacherVO.getTeacher_id();
		
		String pw = request.getParameter("teacher_password");
		String name = request.getParameter("teacher_name");
		String email = request.getParameter("teacher_email");
		String rec = request.getParameter("teacher_record");
		String certif = request.getParameter("teacher_certificate");
		//그림처리
		String pic = request.getParameter("teacher_picture");
		
		
		
		TeacherVO teacher = new TeacherVO();
		teacher.setTeacher_id(teacher_id);
		teacher.setTeacher_password(pw);
		teacher.setTeacher_name(name);
		teacher.setTeacher_email(email);
		teacher.setTeacher_record(rec);
		teacher.setTeacher_certificate(certif);
		
		
		
		
		HttpUtil.forward(request, response, "/mypage/myInfo.jsp"); // 이동
	}

}

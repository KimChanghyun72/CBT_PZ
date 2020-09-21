package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MemberVo;
import model.TeacherDAO;
import model.TeacherVO;
import net.sf.json.JSONObject;

public class MemEmailCheckCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String teacher_email = request.getParameter("teacher_email");

		//mem회원가입시
		if (email != null) {
			boolean mememJVo = true;
			if (mememJVo) {
				MemberVo memberVo = new MemberVo();
				memberVo.setEmail(email);
				memberVo = MemberDAO.getInstance().selectEmailOne(memberVo);

				if (memberVo == null) {
					mememJVo = false;
				}
			} 
			if(!mememJVo){
				TeacherVO teacherVO = new TeacherVO();
				teacherVO.setTeacher_email(email);
				teacherVO = TeacherDAO.getInstance().selectEmailOne(teacherVO);
				if (teacherVO == null) {
					mememJVo = false;
				}
			}

			if (mememJVo) {
				response.getWriter().print(1);
			} else {
				response.getWriter().print(0);
			}
		};

		//강사 회원가입시
		if (teacher_email != null) {
			boolean mememJVo = true;
			if (mememJVo) {
				TeacherVO teacherVO = new TeacherVO();
				teacherVO.setTeacher_email(teacher_email);
				teacherVO = TeacherDAO.getInstance().selectEmailOne(teacherVO);

				if (teacherVO == null) {
					mememJVo = false;
				}
			} 
			if(!mememJVo){
				MemberVo memberVo = new MemberVo();
				memberVo.setEmail(teacher_email);
				memberVo = MemberDAO.getInstance().selectEmailOne(memberVo);
				if (memberVo == null) {
					mememJVo = false;
				}
			}

			if (mememJVo) {
				response.getWriter().print(1);
			} else {
				response.getWriter().print(0);
			}
		};

	}

}

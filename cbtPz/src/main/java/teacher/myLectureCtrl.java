package teacher;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.HttpUtil;
import controller.Controller;
import model.LectureDAO;
import model.LectureVO;
import model.MemberVo;
import model.TeacherVO;

public class myLectureCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Parameter 추출
		TeacherVO teacher = (TeacherVO) request.getSession().getAttribute("login");
		String teacher_id = teacher.getTeacher_id();
		
		/* teacher_id을 기준으로 조회
		   http://localhost:81/cbtPz/myLecture.do?teacher_id=
		*/

		LectureVO lecturevo = new LectureVO();
		lecturevo.setTeacher_id(teacher_id);
		// DAO 객체의 메소드 호출
		LectureDAO dao = LectureDAO.getInstance();
		ArrayList<LectureVO> lecture = dao.selectAll(lecturevo);
		
		// page 이동
		request.setAttribute("lecture_list", lecture); // lecture_list forEach
		HttpUtil.forward(request, response, "/mypage/myLecture.jsp");

	}

}
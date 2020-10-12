package teacher;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.LectureDAO;
import model.LectureVO;
import model.TeacherVO;
import net.sf.json.JSONArray;

public class teacherLectureDel implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String lecture_id = request.getParameter("lecture_id");
		TeacherVO teacherVO = (TeacherVO) request.getSession().getAttribute("login");
		String teacher_id = teacherVO.getTeacher_id();
		System.out.println("강의번호" + lecture_id);
		System.out.println("강사아디" + teacher_id);

		LectureVO lectureVO = new LectureVO();
		lectureVO.setLecture_id(lecture_id);
		lectureVO.setTeacher_id(teacher_id);

		int resultDel = LectureDAO.getInstance().lectureDelete(lectureVO);
		String result = JSONArray.fromObject(resultDel).toString();
		System.out.println(result);
		response.getWriter().print(result);

	}

}

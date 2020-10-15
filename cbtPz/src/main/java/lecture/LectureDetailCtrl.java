package lecture;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.LectureDAO;
import model.LectureVO;
import model.TeacherDAO;
import model.TeacherVO;

public class LectureDetailCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//정보 불러옴
		String lecture_id = request.getParameter("lecture_id");
		System.out.println("lecture_id : "+lecture_id);
		LectureVO lectureVO = new LectureVO();
		TeacherVO teacherVO = new TeacherVO();
		
		//객체 할당 및 lecture정보 select
		lectureVO.setLecture_id(lecture_id);
		lectureVO = LectureDAO.getInstance().selectOne(lectureVO);
		
		//lectureVO에서 선생님 ID 가져와서 ID 로 해당 선생님의 정보 SELECT
		teacherVO.setTeacher_id(lectureVO.getTeacher_id());
		teacherVO = TeacherDAO.getInstance().selectOne(teacherVO);
		
		//경로 설정
		String path = "/lecture/lectureDetail.jsp";
		
		request.setAttribute("lectureInfo", lectureVO);
		request.setAttribute("teacherInfo", teacherVO);
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

}

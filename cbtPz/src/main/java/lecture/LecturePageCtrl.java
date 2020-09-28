package lecture;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.LectureDAO;
import model.LectureVO;

public class LecturePageCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//강의 전체 리스트
		List<LectureVO> lecturelist = new ArrayList<LectureVO>();
		//String subject_cate = request.getParameter("subject_cate");
		lecturelist = LectureDAO.getInstance().selectLectureAll();
		System.out.println(lecturelist);
		request.setAttribute("lecturelist", lecturelist);
		request.getRequestDispatcher("/lecture/lecture.jsp").forward(request, response);
	}

}

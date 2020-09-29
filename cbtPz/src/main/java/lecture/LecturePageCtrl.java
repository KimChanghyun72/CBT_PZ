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

		lecturelist = LectureDAO.getInstance().selectLectureAll(); //강의전체

		List<String>clist = new ArrayList<String>();
		clist = LectureDAO.getInstance().selectCateDISTINCT(); //강의 카테subject
		
		System.out.println(clist);
		request.setAttribute("lecturelist", lecturelist);
		request.setAttribute("clist", clist);
		request.getRequestDispatcher("/lecture/lecture.jsp").forward(request, response);
	}

}
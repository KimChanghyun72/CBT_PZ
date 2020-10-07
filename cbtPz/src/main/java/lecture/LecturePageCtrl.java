package lecture;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.LearnVO;
import model.LectureDAO;
import model.LectureVO;
import model.MemberVo;

public class LecturePageCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//강의 전체 리스트
		/*
		 * List<LectureVO> lecturelist = new ArrayList<LectureVO>(); String subject =
		 * request.getParameter("subject"); if(subject == null || subject.equals("전체"))
		 * { lecturelist = LectureDAO.getInstance().selectLectureAll(); //강의전체 } else {
		 * LectureVO lectureVO = new LectureVO(); lectureVO.setLecture_subject(subject);
		 * lecturelist = LectureDAO.getInstance().selectCate(lectureVO); //카테별로 강의 전체 }
		 */
		
		
		//강의 전체 리스트
		LearnVO vo = new LearnVO();
		if(request.getSession().getAttribute("login") != null) {
			vo.setMember_id(((MemberVo)request.getSession().getAttribute("login")).getMember_id());
		}
		List<LectureVO> lecturelist = new ArrayList<LectureVO>();
		String subject = request.getParameter("subject");
		if(subject == null || subject.equals("전체")) {			
			lecturelist = LectureDAO.getInstance().selectLectureAll(vo); //강의전체
		} else {
			LectureVO lectureVO = new LectureVO();
			if(request.getSession().getAttribute("login") != null) {
				lectureVO.setMember_id(((MemberVo)request.getSession().getAttribute("login")).getMember_id());
			}
			lectureVO.setLecture_subject(subject);
			lecturelist = LectureDAO.getInstance().selectCate(lectureVO);  //카테별로 강의 전체
		}

		List<String>clist = new ArrayList<String>();
		clist = LectureDAO.getInstance().selectCateDISTINCT(); //강의 카테subject
		
		System.out.println(clist);
		request.setAttribute("lecturelist", lecturelist);
		request.setAttribute("clist", clist);
		request.getRequestDispatcher("/lecture/lecture.jsp").forward(request, response);
	}

}

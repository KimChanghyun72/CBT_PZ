package lecture;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.LearnDAO;
import model.LearnVO;
import model.LectureDAO;
import model.MemberVo;

public class LectureLearnInsert implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션에서 member_id, lectureid 가 lecture_id
		MemberVo memberVo= (MemberVo) request.getSession().getAttribute("login") ;
		String memid = memberVo.getMember_id();
		String lecid = request.getParameter("lectureid");
		
		LearnVO learnVO = new LearnVO();
		learnVO.setMember_id(memid);
		learnVO.setLecture_id(lecid);
		
		learnVO = LearnDAO.getInstance().learnSelectOne(learnVO);
		
		if(learnVO == null) { //수강성공
			LearnVO learnInsertVO = new LearnVO();
			learnInsertVO.setMember_id(memid);
			learnInsertVO.setLecture_id(lecid);
			int r =LearnDAO.getInstance().learnInsert(learnInsertVO);
			System.out.println(learnVO + "널이여야 수강등록OK : " + r);
			response.getWriter().print(1);
		} else {
			response.getWriter().print(0); //이미이력있음
			System.out.println("이력있음 0넘김 ");
		}
		
	}
}

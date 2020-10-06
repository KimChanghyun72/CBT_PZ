package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.LearnDAO;
import model.LearnVO;
import model.MemberVo;
import net.sf.json.JSONArray;

public class MemLectureDeleteCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String lecture_id = request.getParameter("lecture_id");
		MemberVo memberVO = (MemberVo) request.getSession().getAttribute("login");
		String member_id = memberVO.getMember_id();
		System.out.println("강의번호" + lecture_id);
		System.out.println("멤버아디"+member_id);
		
		  LearnVO learnVO = new LearnVO();
		  learnVO.setLecture_id(lecture_id);
		  learnVO.setMember_id(member_id);
		  
		  int resultDel = LearnDAO.getInstance().learnDelete(learnVO); String result =
		  JSONArray.fromObject(resultDel).toString(); System.out.println(result);
		  response.getWriter().print(result);
		 
		
		
	}

}

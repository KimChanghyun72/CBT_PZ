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

public class MemPwFindCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idfind = request.getParameter("idfind");
		String userid = request.getParameter("id");
		String email = request.getParameter("em");
		
		if(Integer.parseInt(idfind) == 0) {
			MemberVo memberVo = new MemberVo();
			memberVo.setMember_id(userid);
			memberVo.setEmail(email);
			memberVo = MemberDAO.getInstance().selectPwOne(memberVo);
			String memberJVo = JSONObject.fromObject(memberVo).toString();
			
			response.getWriter().print(memberJVo);
		}
		
		if(Integer.parseInt(idfind) == 1) {
			TeacherVO teacherVO = new TeacherVO();
			teacherVO.setTeacher_id(userid);
			teacherVO.setTeacher_email(email);
			teacherVO = TeacherDAO.getInstance().selectPwOne(teacherVO);
			String teacherJVO = JSONObject.fromObject(teacherVO).toString();
			response.getWriter().print(teacherJVO);
		}
		

	}

}

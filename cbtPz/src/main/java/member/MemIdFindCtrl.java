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

public class MemIdFindCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idfind = request.getParameter("idfind");
		String name = request.getParameter("name");
		String email = request.getParameter("em");
		
		
		//System.out.println(idfind);
		//System.out.println(name + " , " + email);
		if(Integer.parseInt(idfind) == 0) {
			MemberVo memberVo = new MemberVo();
			memberVo.setMember_name(name);
			memberVo.setEmail(email);
			memberVo = MemberDAO.getInstance().selectIdOne(memberVo);
			String memberJVo = JSONObject.fromObject(memberVo).toString();
			
			response.getWriter().print(memberJVo);
		}
		
		if(Integer.parseInt(idfind) == 1) {
			TeacherVO teacherVO = new TeacherVO();
			teacherVO.setTeacher_name(name);
			teacherVO.setTeacher_email(email);
			teacherVO = TeacherDAO.getInstance().selectIdOne(teacherVO);
			String teacherJVO = JSONObject.fromObject(teacherVO).toString();
			response.getWriter().print(teacherJVO);
			//System.out.println("교사 아이디찾기컨트롤");
		}

	}

}

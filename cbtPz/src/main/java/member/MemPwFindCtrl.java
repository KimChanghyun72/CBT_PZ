package member;

import java.io.IOException;
import java.util.Collections;

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
		String userid = request.getParameter("id"); // jsp name = "userid"
		String email = request.getParameter("em"); // jsp name = "pemail"
		String JVO ="";
		
		if(Integer.parseInt(idfind) == 0) {
			MemberVo memberVo = new MemberVo();
			memberVo.setMember_id(userid);
			memberVo.setEmail(email);
			MemberVo memberVo2 = MemberDAO.getInstance().selectPwOne(memberVo);
			// 패스워드 변경
			/*
			 * String memberJVo = JSONObject.fromObject(memberVo).toString();
			 */
			if (memberVo2 != null) {
				MemberDAO dao = MemberDAO.getInstance(); // UpdatePwOne 불러오기
				dao.UpdatePwOne(memberVo);
				
				String memberJVo = "v3FeG`Yw";//		'"새로 발급받은 비밀번호는 v3FeG`Yw입니다." +			"로그인 후 비밀번호를 변경해주시기 바랍니다.";
				memberVo2.setMember_pw(memberJVo);
			}
			JVO = JSONObject.fromObject(memberVo2).toString();
			response.getWriter().print(JVO);
		}
		
		
		
		if(Integer.parseInt(idfind) == 1) {
			TeacherVO teacherVO = new TeacherVO();
			teacherVO.setTeacher_id(userid);
			teacherVO.setTeacher_email(email);
			TeacherVO teacherVO2 = TeacherDAO.getInstance().selectPwOne(teacherVO);
			
			if (teacherVO2 != null) {
				TeacherDAO dao = TeacherDAO.getInstance();
				dao.UpdatePwOne(teacherVO);
				
				String teacherJVo = "v3FeG`Yw";
				teacherVO2.setTeacher_password(teacherJVo);
			}
			JVO = JSONObject.fromObject(teacherVO2).toString();
			response.getWriter().print(JVO);
			/*
			 * String teacherJVO = JSONObject.fromObject(teacherVO).toString();
			 * response.getWriter().print(teacherJVO);
			 */
		}
		
	}

}

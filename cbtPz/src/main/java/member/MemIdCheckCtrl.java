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

public class MemIdCheckCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		
		//MemberVo memberVo = new MemberVo();
		/*
		 * memberVo.setMember_id(member_id); memberVo =
		 * MemberDAO.getInstance().selectOne(memberVo); String memberJVo =
		 * JSONObject.fromObject(memberVo).toString();
		 * 
		 * response.getWriter().print(memberJVo);
		 */
		
		
		boolean mememJVo = true;
		boolean mememNVo = true;
		
		if (mememJVo) {
	
			MemberVo memberVo = new MemberVo();
			memberVo.setMember_id(id);;
			memberVo = MemberDAO.getInstance().selectOne(memberVo);

			if (memberVo == null) {
				mememJVo = false;
				System.out.println("null임");
			}
		}
		
		if(mememNVo){
			TeacherVO teacherVO = new TeacherVO();
			teacherVO.setTeacher_id(id);;
			teacherVO = TeacherDAO.getInstance().selectOne(teacherVO);
			if (teacherVO == null) {
				System.out.println("이거됨?");
				mememNVo = false;
			}
		}

		if (mememJVo || mememNVo) {
			response.getWriter().print(1);
		} else {
			response.getWriter().print(0);
		}
	}

}

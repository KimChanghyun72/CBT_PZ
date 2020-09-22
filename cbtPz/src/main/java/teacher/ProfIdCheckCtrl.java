package teacher;

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

public class ProfIdCheckCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		/*
		 * TeacherVO teacherVo = new TeacherVO(); teacherVo.setTeacher_id(teacher_id);
		 * teacherVo = TeacherDAO.getInstance().selectOne(teacherVo); String teacherJVo
		 * = JSONObject.fromObject(teacherVo).toString();
		 * 
		 * response.getWriter().print(teacherJVo);
		 */
		
		
		boolean mememJVo = true;
		boolean mememNVo = true;
		
		if (mememJVo) {
			TeacherVO teacherVO = new TeacherVO();
			teacherVO.setTeacher_id(id);;
			teacherVO = TeacherDAO.getInstance().selectOne(teacherVO);
			if (teacherVO == null) {
				mememJVo = false;
				System.out.println("교사널 f");
			}
		}
		
		if(mememNVo){
			MemberVo memberVo = new MemberVo();
			memberVo.setMember_id(id);;
			memberVo = MemberDAO.getInstance().selectOne(memberVo);

			if (memberVo == null) {
				System.out.println("멤버널f");
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

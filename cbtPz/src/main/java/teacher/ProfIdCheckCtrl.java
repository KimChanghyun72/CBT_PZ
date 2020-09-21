package teacher;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.TeacherDAO;
import model.TeacherVO;
import net.sf.json.JSONObject;

public class ProfIdCheckCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String teacher_id = request.getParameter("id");
		TeacherVO teacherVo = new TeacherVO();
		teacherVo.setTeacher_id(teacher_id);
		teacherVo = TeacherDAO.getInstance().selectOne(teacherVo);
		String teacherJVo = JSONObject.fromObject(teacherVo).toString();
		
		response.getWriter().print(teacherJVo);

	}

}

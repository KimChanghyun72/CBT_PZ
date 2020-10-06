package teacher;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.TeacherDAO;
import model.TeacherVO;

public class ProfDeleteCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TeacherVO teacherVO = (TeacherVO) request.getSession().getAttribute("login");
		String teacher_id = teacherVO.getTeacher_id();
		
		TeacherVO teacher = new TeacherVO();
		teacher.setTeacher_id(teacher_id);
		int r = TeacherDAO.getInstance().delete(teacher);
		
		if (r == 1) { //1건 업뎃됨
			
			request.getSession().invalidate();
			response.getWriter().append("<script>")
            					.append("alert('탈퇴되었습니다.');")
            					.append("location.href='"+request.getContextPath()+"/mainCtrl.do';")
            					.append("</script>");
		} else {
			response.getWriter().append("<script>")
								.append("alert('탈퇴에 실패했습니다. 다시 시도해주세요');")
								.append("location.href='myInfo.do';")
								.append("</script>");
		};

	}

}

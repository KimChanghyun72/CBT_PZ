package teacher;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import controller.Controller;
import model.TeacherDAO;
import model.TeacherVO;

public class ProfInsertCtrl implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("교사회원등록");
		
		TeacherVO teacher = new TeacherVO();
		
		try {
			BeanUtils.copyProperties(teacher, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		TeacherDAO.getInstance().insert(teacher);
		
		request.getRequestDispatcher("/member/login.jsp").forward(request, response);
		
	}

}

package study;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.SolveDAO;

public class SolveTimeUpdateCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//채점 후 시간,결과 업데이트
		String time, sid;
			
		time = request.getParameter("testTime");
		sid = request.getParameter("solve_id");
		
		SolveDAO.getInstance().UpdateTime(time, sid);

	}

}

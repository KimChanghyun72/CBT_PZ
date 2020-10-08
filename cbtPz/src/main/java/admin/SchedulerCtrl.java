package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.SchedulerDAO;
import model.SchedulerVO;

public class SchedulerCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String scheduler_id = request.getParameter("scheduler_id");
		String title = request.getParameter("title");
		String start = request.getParameter("start");
		
		SchedulerVO scheduler = new SchedulerVO();
		//scheduler.setScheduler_id(scheduler_id);
		scheduler.setTitle(title);
		scheduler.setStart(start);
			
		SchedulerDAO.getInstance().insert(scheduler);
		
		request.getRequestDispatcher("/admin/excelInsertOutput.jsp").forward(request, response);
		
	}

}

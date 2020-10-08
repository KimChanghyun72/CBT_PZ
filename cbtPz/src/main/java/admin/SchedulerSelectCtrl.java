package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.SchedulerDAO;
import model.SchedulerVO;
import net.sf.json.JSONArray;

public class SchedulerSelectCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * SchedulerVO scdVo = new SchedulerVO();
		 * 
		 * JSONArray js = new JSONArray();
		 * 
		 * ArrayList<SchedulerVO> scd = SchedulerDAO.getInstance().selectAll(scdVo);
		 * 
		 * String str = JSONArray.fromObject(scd).toString();
		 * 
		 * response.getWriter().print(str);
		 */
		SchedulerVO scdVo = new SchedulerVO();
		
		ArrayList<SchedulerVO> list = SchedulerDAO.getInstance().selectAll(scdVo);
		
		String str = JSONArray.fromObject(list).toString();
		
		response.getWriter().print(str);
	}

}

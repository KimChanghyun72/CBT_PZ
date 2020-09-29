package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.MemberDAO;
import model.MemberVo;


public class MemberListCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<MemberVo> list = MemberDAO.getInstance().selectAll(null);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/admin/memberList.jsp").forward(request, response);
	
		
	}

}

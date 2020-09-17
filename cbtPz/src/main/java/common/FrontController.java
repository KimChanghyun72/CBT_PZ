package common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.ProblemInsertController;

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String charset = null;
	HashMap<String, Controller> list = null;

	@Override
	public void init(ServletConfig config) throws ServletException {
		charset = config.getInitParameter("charset");
		list = new HashMap<String, Controller>();
		list.put("/memberInsert.do", new ProblemInsertController());
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(charset);
		response.setContentType("text/html; charset=UTF-8");
		String uri = request.getRequestURI();                 // fronWeb/memberInsert.do
		String contextPath =  request.getContextPath();		  // frontWeb
		String path = uri.substring(contextPath.length());	  // /memberInsert.do
		Controller subController = list.get(path);	
		subController.execute(request, response);
		
	}

}

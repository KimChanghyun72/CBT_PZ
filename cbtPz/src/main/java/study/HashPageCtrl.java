package study;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;

//해쉬검색 페이지로 넘기는 컨트롤러
public class HashPageCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			System.out.println("해쉬검색페이지로이동");
			String path = "hashSelect.jsp";
			
			request.getRequestDispatcher(path).forward(request, response);
			//request.getRequestDispatcher("/study/"+path).forward(request, response);
	}

}

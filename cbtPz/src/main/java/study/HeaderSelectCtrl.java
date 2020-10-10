package study;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.PaperHeadDAO;
import model.PaperheadVO;

public class HeaderSelectCtrl implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("헤더검색");
		String path = "paperhead.jsp";
		
		PaperheadVO type = new PaperheadVO();
		
		//파라미터 변수에 저장
		String paper_type_cd = request.getParameter("paper_type_cd");
		
		//VO에 담기
		type.setPaper_type_cd(paper_type_cd);
		
		//서비스		
		PaperHeadDAO dao = new PaperHeadDAO();
		ArrayList<PaperheadVO> headlist = dao.selectPaper_type(type);
		
		
		//조회결과를 저장후에 결과페이지로 포워드
		request.setAttribute("headlist", headlist);
				
		request.getSession().setAttribute("pageName", paper_type_cd);
		request.getRequestDispatcher(path).forward(request, response);
		/* request.getRequestDispatcher("/study/"+path).forward(request, response); */
		
	}

}



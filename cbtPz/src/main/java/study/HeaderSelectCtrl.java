package study;

import java.io.IOException;
import java.util.ArrayList;

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
		String commoncode_name = request.getParameter("commoncode_name");
		
		//VO에 담기
		type.setPaper_type_cd(paper_type_cd);
		type.setCommoncode_name(commoncode_name);
		
		//서비스		
		PaperHeadDAO dao = new PaperHeadDAO();
		ArrayList<PaperheadVO> headlist = dao.selectPaper_type(type);
		 
		String page_name = null;
		if(paper_type_cd.equals("a1")) {
			page_name = "기출문제";
		} else if(paper_type_cd.equals("a2"))	 {
			page_name = "모의고사";
		}
		System.out.println(paper_type_cd);
		System.out.println(page_name);
		
		//조회결과를 저장후에 결과페이지로 포워드
		request.setAttribute("headlist", headlist);
		request.getSession().setAttribute("pageName", page_name);		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}



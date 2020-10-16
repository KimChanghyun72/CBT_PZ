package study;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.CommoncodeVO;
import model.PaperHeadDAO;

public class SubjectSelectCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("과목검색");
		String path = "subjectList.jsp";
		
		CommoncodeVO commoncodeVO = new CommoncodeVO();
		
		PaperHeadDAO dao = new PaperHeadDAO();
		ArrayList<CommoncodeVO> subjectlist = dao.subjectList(commoncodeVO);
		
		
		//조회결과를 저장후에 결과페이지로 포워드
		request.setAttribute("subjectlist", subjectlist);
		
		request.getSession().setAttribute("pageName", "과목별 학습하기");
		request.getRequestDispatcher(path).forward(request, response);
		/* request.getRequestDispatcher("/study/"+path).forward(request, response); */
	}

}

package study;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.PaperheadDAO;
import model.ProblemVO;

public class SubjectSelectCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("과목검색");
		String path = "subjectList.jsp";
		
		
		//파라미터 변수에 저장
		
		//VO에 담기
		
		//서비스		
		PaperheadDAO dao = new PaperheadDAO();
		ArrayList<ProblemVO> sublist = dao.selectSubjectAll(null);
		
		
		//조회결과를 저장후에 결과페이지로 포워드
		request.setAttribute("sublist", sublist);
		
		request.getRequestDispatcher("/study/"+path).forward(request, response);
	}

}

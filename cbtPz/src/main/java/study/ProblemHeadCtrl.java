package study;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.PaperHeadDAO;
import model.PaperheadVO;

public class ProblemHeadCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "studyPaper.jsp";
		
		PaperheadVO problem = new PaperheadVO();
		
		//파라미터 변수에 저장
		String paperhead_id = request.getParameter("paperhead_id");
		
		//VO에 담기
		problem.setPaperhead_id(paperhead_id);
		
		//서비스		
		PaperHeadDAO dao = new PaperHeadDAO();
		List<Map<String, Object>> headproblem = dao.selectOne(problem);	
		
		
		//조회결과를 저장후에 결과페이지로 포워드
		request.setAttribute("problemList", headproblem);
		
		request.getRequestDispatcher("/study/"+path).forward(request, response);
	}

}

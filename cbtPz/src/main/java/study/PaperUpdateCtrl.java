package study;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.HashtagDAO;
import model.HashtagVO;
import model.PaperDAO;
import model.PaperVO;
import model.ProblemVO;
import net.sf.json.JSONArray;

public class PaperUpdateCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//파라미터 변수에 저장
		String check_num = request.getParameter("check_num");
		String paper_id = request.getParameter("paper_id");
		String problem_id = request.getParameter("problem_id");
		
		
		//VO에 담기
		PaperVO paperVO = new PaperVO();
		ProblemVO problemVO = new ProblemVO();
		
		paperVO.setCheck_num(check_num);
		paperVO.setPaper_id(paper_id);
		paperVO.setProblem_id(problem_id);
		problemVO.setProblem_id(problem_id);
		
		//서비스		
		int r = PaperDAO.getInstance().updateChecknum(paperVO);		
		int a = PaperDAO.getInstance().selectAns(problemVO);
		System.out.println(r);
		System.out.println(a);
		
		//조회결과를 저장후에 결과페이지로 포워드
		String str =  JSONArray.fromObject(r).toString();
		response.getWriter().print(str);
		
	}

}

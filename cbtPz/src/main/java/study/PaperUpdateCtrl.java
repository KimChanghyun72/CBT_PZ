package study;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.PaperDAO;
import model.PaperVO;

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
		
		paperVO.setCheck_num(check_num);
		paperVO.setPaper_id(paper_id);
		paperVO.setProblem_id(problem_id);
		
		//서비스		
		PaperDAO.getInstance().updateChecknum(paperVO);		
		String ans  = PaperDAO.getInstance().selectAns(problem_id);
		String a = "0";
		if(check_num.equals(ans)) {
			a = "1";
			PaperDAO.getInstance().updateCorrect(a,paperVO);
			System.out.println("정답");
		}else {
			a = "0";
			PaperDAO.getInstance().updateCorrect(a,paperVO);
			System.out.println("오답"); 
		}
		
		
	}

}

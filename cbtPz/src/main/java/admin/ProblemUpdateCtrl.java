package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.ProblemDAO;
import model.ProblemVO;
import net.sf.json.JSONObject;

public class ProblemUpdateCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ID 받아와서 selectOne
		ProblemVO resultVO = new ProblemVO();
		resultVO.setProblem_id(request.getParameter("problem_id"));
		
		System.out.println(request.getParameter("problem_id"));
		
		resultVO = ProblemDAO.getInstance().selectOne(resultVO);
		
		
		
		//selectOne한 정보를 업데이트
		resultVO.setSubject(request.getParameter("subject"));
		resultVO.setProblem_text(request.getParameter("problem_text"));
		resultVO.setAns_1(request.getParameter("ans_1"));
		resultVO.setAns_2(request.getParameter("ans_2"));
		resultVO.setAns_3(request.getParameter("ans_3"));
		resultVO.setAns_4(request.getParameter("ans_4"));
		resultVO.setHaeseol(request.getParameter("haeseol"));
		resultVO.setAns_correct(request.getParameter("ans_correct"));
		
		System.out.println("UPDATE : " + resultVO);
		
		ProblemDAO.getInstance().updateProblem(resultVO);
		
		//업데이트한 정보를 다시 받아옴.
		resultVO = ProblemDAO.getInstance().selectOne(resultVO);
		String result = JSONObject.fromObject(resultVO).toString();
		response.getWriter().print(result);
		
	}

}

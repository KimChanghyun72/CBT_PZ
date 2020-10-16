	package study;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.SolveDAO;
import net.sf.json.JSONArray;

//문제페이지에서 제출시 정답/해설 출력, solve 테이블에 시간,채점결과 update
public class ProbScoringCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		
		int i;
		
		// 채점
		List<Map<String, Object>> headproblem = (List<Map<String, Object>>)request.getSession().getAttribute("problemList");
		List<Map<String, String>> ansList = new ArrayList<Map<String, String>>();
		for(i=0 ; i<headproblem.size(); i++) {
			String ansCorrect;
			String problemId;
			String haeseol;
			HashMap<String, String> ans = new HashMap<String, String>();
			problemId = (String)headproblem.get(i).get("problem_id");
			ansCorrect = (String)headproblem.get(i).get("ans_correct");
			haeseol = (String)headproblem.get(i).get("haeseol");
			
			
			ans.put("problem_id", problemId);
			ans.put("ans_correct", ansCorrect);
			ans.put("haeseol", haeseol);
			ansList.add(i, ans);
			}
		//채점 후 시간,결과 업데이트
		String sid, time;
			
		sid = request.getParameter("solve_id");
		time = request.getParameter("testTime");
		
		SolveDAO.getInstance().UpateSolve(sid, time);
		
		String result = JSONArray.fromObject(ansList).toString();
		response.getWriter().print(result);
		
		
		
		

		 
	}

}

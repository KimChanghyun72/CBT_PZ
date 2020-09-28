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
import net.sf.json.JSONArray;

public class ProbScoringCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int i;
		
		List<Map<String, Object>> headproblem = (List<Map<String, Object>>)request.getSession().getAttribute("problemList");
		System.out.println(headproblem);
		List<Map<String, String>> ansList = new ArrayList<Map<String, String>>();
		for(i=0 ; i<headproblem.size(); i++) {
			String ansCorrect;
			String problemId;
			String haeseol;
			HashMap<String, String> ans = new HashMap<String, String>();
			problemId = (String)headproblem.get(i).get("problem_id");
			ansCorrect = (String)headproblem.get(i).get("ans_correct");
			haeseol = (String)headproblem.get(i).get("haeseol");
			
			System.out.println(problemId);
			System.out.println(ansCorrect);
			System.out.println(haeseol);
			
			ans.put("problem_id", problemId);
			ans.put("ans_correct", ansCorrect);
			ans.put("haeseol", haeseol);
			System.out.println(ans);
			ansList.add(i, ans);
			System.out.println(ansList);
			}
		String result = JSONArray.fromObject(ansList).toString();
		response.getWriter().print(result);
		
	}

}

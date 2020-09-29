package lecture;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.LectureDAO;
import model.LectureVO;
import net.sf.json.JSONObject;

public class LectureCategorySelectCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<LectureVO> lecturelist = new ArrayList<LectureVO>();
		String cate = request.getParameter("cate");
		System.out.println(cate);
		LectureVO cateVO = new LectureVO();
		cateVO.setLecture_subject(cate);
		lecturelist = LectureDAO.getInstance().selectCate(cateVO);
		String cateJVO = JSONObject.fromObject(cateVO).toString();
		
		response.getWriter().print(cateJVO);
	}

}

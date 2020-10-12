package retest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.FavoriteDAO;
import model.FavoriteVO;

public class MyFavoriteDeleteCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//파라미터 변수에 저장
		String paper_id = request.getParameter("paper_id");
		
		
		//VO에 담기
		FavoriteVO favoriteVO = new FavoriteVO();
		
		favoriteVO.setPaper_id(paper_id);
		
		//서비스		
		FavoriteDAO.getInstance().deleteFavorite(favoriteVO);

	}

}

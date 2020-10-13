package retest;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;
import controller.Controller;
import model.FavoriteDAO;
import model.FavoriteVO;
import model.MemberVo;

//즐겨찾기 문제 검색
public class MyFavoriteCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "myFavorite.jsp";
		
		String p = request.getParameter("p");
		
		int page = 1;
		if(p != null) {
			page = Integer.parseInt(p);
		}
		
		Paging paging = new Paging();
		paging.setPageUnit(5);
		paging.setPageSize(5);
		paging.setPage(page);
		
		FavoriteVO favoriteVO = new FavoriteVO();	
		FavoriteDAO dao = new FavoriteDAO();
		
		// Parameter 추출
		MemberVo member = (MemberVo) request.getSession().getAttribute("login");
		String member_id = member.getMember_id();
		
		// VO에 담기
		favoriteVO.setMember_id(member_id);
		paging.setTotalRecord(dao.count(favoriteVO));
		favoriteVO.setFirst(paging.getFirst());
		favoriteVO.setLast(paging.getLast());
		
		List<Map<String, Object>> favorite = FavoriteDAO.getInstance().selectAllFavorite(favoriteVO);
		
		// page 이동
		request.setAttribute("paging", paging);
		request.getSession().setAttribute("problemList", favorite);
		request.getRequestDispatcher("/mypage/"+path).forward(request, response);
	}

}

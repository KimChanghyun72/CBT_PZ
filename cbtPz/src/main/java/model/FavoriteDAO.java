package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class FavoriteDAO {
	Connection conn;
	PreparedStatement pstmt;

	static FavoriteDAO instance;

	public static FavoriteDAO getInstance() {
		if (instance == null)
			instance = new FavoriteDAO();
		return instance;
	}
	
	// 즐겨찾기 문제 조회
	public ArrayList<FavoriteVO> selectAllFavorite(SolveVO solveVO) {
		FavoriteVO resultVO = null;
		ResultSet rs = null;

		ArrayList<FavoriteVO> list = new ArrayList<FavoriteVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select * from problem,paper,solve"
					+ " where problem.problem_id = paper.problem_id"
					+ " and solve.solve_id = paper.solve_id"
					+ " and paper.paper_id in (select paper_id from favorite)"
					+ " and member_id = ?";
			// problem, paper 조회
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, solveVO.getMember_id());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVO = new FavoriteVO();
				resultVO.setProblem_id(rs.getString("problem_id"));
				resultVO.setSubject(rs.getString("subject"));
				resultVO.setHaeseol(rs.getString("haeseol"));
				resultVO.setProblem_text(rs.getString("problem_text"));
				resultVO.setAns_1(rs.getString("ans_1"));
				resultVO.setAns_2(rs.getString("ans_2"));
				resultVO.setAns_3(rs.getString("ans_3"));
				resultVO.setAns_4(rs.getString("ans_4"));
				resultVO.setAns_correct(rs.getString("ans_correct"));
				resultVO.setPaperhead_id(rs.getString("paperhead_id"));
				resultVO.setProblem_image(rs.getString("problem_image"));

				resultVO.setPaper_id(rs.getString("paper_id"));
				resultVO.setIs_correct(rs.getString("is_correct"));
				resultVO.setCheck_num(rs.getString("check_num"));
				resultVO.setIs_favorite(rs.getString("is_favorite"));
				resultVO.setAns_order(rs.getString("ans_order"));
				resultVO.setSolve_id(rs.getString("solve_id"));
				// resultVO.setProblem_id(rs.getString("problem_id"));
				list.add(resultVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
}

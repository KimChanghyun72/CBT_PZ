package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 즐겨찾기 등록
	public int insertFavorite(FavoriteVO favoriteVO) {
		int r =0;
		try {
			// 1. DB연결
			conn = ConnectionManager.getConnnect();
			
			// 2. sql 구문 실행
			String sql = "insert into favorite (FAVORITE_ID, PROBLEM_ID, MEMBER_ID) "
					   + " values(favorite_seq.nextval, ?, ?)";
			pstmt = conn.prepareStatement(sql);
					
			pstmt.setString(1, favoriteVO.getProblem_id());		
			pstmt.setString(2, favoriteVO.getMember_id());	
			r = pstmt.executeUpdate();

			// 3. 결과 처리
			if (r == 1) {
				System.out.println(r + "건이 처리(즐겨찾기등록)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 4. 연결 해제 (연결횟수제한으로인해 해제까지 해줘야함)
			ConnectionManager.close(conn);
		}
		return r;
	} 
	
	// 즐겨찾기 해제
	public int deleteFavorite(FavoriteVO favoriteVO) {
		int r =0;
		try {
			// 1. DB연결
			conn = ConnectionManager.getConnnect();
			
			// 2. sql 구문 실행
			String sql = "DELETE FROM FAVORITE "
						+"WHERE PROBLEM_ID = ?"
						+"AND MEMBER_ID = ? ";
			pstmt = conn.prepareStatement(sql);
					
			pstmt.setString(1, favoriteVO.getProblem_id());
			pstmt.setString(2, favoriteVO.getMember_id());
					
			r = pstmt.executeUpdate();

			// 3. 결과 처리
			if (r == 1) {
				System.out.println(r + "건 삭제(즐겨찾기해제)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 4. 연결 해제 (연결횟수제한으로인해 해제까지 해줘야함)
			ConnectionManager.close(conn);
		}
		return r;
	} 
		
	// 즐겨찾기 문제 조회
	public List <Map<String,Object>> selectAllFavorite(FavoriteVO favoriteVO) {
		ResultSet rs = null;

		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql ="SELECT A.* FROM(SELECT B.*, ROWNUM RM FROM ( "
						+ "select p.problem_id, subject, haeseol, problem_text, ans_1, ans_2, ans_3, ans_4, ans_correct, problem_image " 
						+ " from problem p, FAVORITE f " 
						+ " where p.PROBLEM_ID = f.PROBLEM_ID " 
						+ " and member_id = ?"
						+" ORDER BY p.problem_id "
						+" ) B) A WHERE RM BETWEEN ? AND ? "; 
			// problem, paper 조회
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, favoriteVO.getMember_id());
			pstmt.setInt(2, favoriteVO.getFirst());
			pstmt.setInt(3, favoriteVO.getLast());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("problem_id",rs.getString(1));
				map.put("subject",rs.getString(2));
				map.put("haeseol",rs.getString(3));
				map.put("problem_text",rs.getString(4));
				map.put("ans_1", rs.getString(5));
				map.put("ans_2", rs.getString(6));
				map.put("ans_3", rs.getString(7));
				map.put("ans_4", rs.getString(8));
				map.put("ans_correct", rs.getString(9));
				map.put("problem_image", rs.getString(10));
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public int count(FavoriteVO favoriteVO) {
		int cnt = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT count(member_id) " 
						+"FROM favorite "
						+"WHERE MEMBER_ID = ?";
			pstmt = conn.prepareStatement(sql);
			int pos = 1;
			pstmt.setString(pos++, favoriteVO.getMember_id());

			ResultSet rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return cnt;
	}
}

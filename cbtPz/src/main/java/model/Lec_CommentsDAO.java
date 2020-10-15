package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class Lec_CommentsDAO {
	
	Connection conn;
	PreparedStatement pstmt;

	// ###싱글톤###
	static Lec_CommentsDAO instance;

	public static Lec_CommentsDAO getInstance() {

		if (instance == null) {
			instance = new Lec_CommentsDAO();
		}
		return instance;


		}//###싱글톤###

	//###전체조회###
	public ArrayList<Lec_CommentsVO> selectAll(Lec_CommentsVO lec_CommentsVO){
		
		Lec_CommentsVO resultVO = null;
		ResultSet rs = null;
		
		ArrayList<Lec_CommentsVO> list = new ArrayList<Lec_CommentsVO>();
		try {
			
			conn = ConnectionManager.getConnnect();
		
			String sql = "SELECT lec_comments_id, lec_comments_date, lec_comments_contents, lec_comments_poster, lecture_id "
					+ " FROM lec_comments "
					+ " WHERE lecture_id = ?";
					
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, lec_CommentsVO.getLecture_id());
		
		rs = pstmt.executeQuery();
		while (rs.next()) {

			resultVO = new Lec_CommentsVO();
			resultVO.setLec_comments_id(rs.getString("lec_comments_id"));
			resultVO.setLec_comments_date(rs.getString("lec_comments_date"));
			resultVO.setLec_comments_contents(rs.getString("lec_comments_contents"));
			resultVO.setLec_comments_poster(rs.getString("lec_comments_poster"));
			resultVO.setLecture_id(rs.getString("lecture_id"));
			list.add(resultVO);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		ConnectionManager.close(rs, pstmt, conn);
	}
	return list;
}// ###전체조회###

}

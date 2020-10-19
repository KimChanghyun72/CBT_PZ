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
	
	
	//###입력###
	public Lec_CommentsVO insert(Lec_CommentsVO lec_CommentsVO) {
		ResultSet rs = null;
		int r= 0;
		try {
			conn = ConnectionManager.getConnnect();
	
			String sql2 = " SELECT LEC_COMMENTS_SEQ.NEXTVAL FROM DUAL ";
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("rsgetString"+rs.getString("NEXTVAL"));
				lec_CommentsVO.setLec_comments_id(rs.getString("NEXTVAL"));
			}
			
			String sql = "INSERT INTO Lec_Comments (Lec_COMMENTS_ID, LEC_COMMENTS_DATE, LEC_COMMENTS_CONTENTS,LEC_COMMENTS_POSTER, LECTURE_ID)"
						 + " VALUES(?,sysdate,?,?,?)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lec_CommentsVO.getLec_comments_id());
			pstmt.setString(2, lec_CommentsVO.getLec_comments_contents());
			pstmt.setString(3, lec_CommentsVO.getLec_comments_poster());
			pstmt.setString(4, lec_CommentsVO.getLecture_id());
			r = pstmt.executeUpdate();
			
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(null,pstmt,conn);
		}
		return lec_CommentsVO;
	}//###입력###
	

	//###전체조회###
	public ArrayList<Lec_CommentsVO> selectAll(Lec_CommentsVO lec_CommentsVO){
		
		Lec_CommentsVO resultVO = null;
		ResultSet rs = null;
		
		ArrayList<Lec_CommentsVO> list = new ArrayList<Lec_CommentsVO>();
		try {
			
			conn = ConnectionManager.getConnnect();
		
			String sql = "SELECT lec_comments_id, lec_comments_date, lec_comments_contents, lec_comments_poster, lecture_id "
					+ " FROM lec_comments "
					+ " WHERE lecture_id = ?"
					+ "order by to_number(lec_comments_id) asc";
					
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

	
	//###삭제###
	public int delete(Lec_CommentsVO lec_commentsVO) {
		int r=0;
		try {
			System.out.println("del method " + lec_commentsVO);
			conn = ConnectionManager.getConnnect();
			String sql = "DELETE lec_comments WHERE lec_comments_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lec_commentsVO.getLec_comments_id());
			r=pstmt.executeUpdate();
			
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(null,pstmt,conn);
		}
		return r;
	}//###삭제###

}

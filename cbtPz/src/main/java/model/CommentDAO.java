package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import common.ConnectionManager;

	public class CommentDAO {

		
 
		Connection conn;
		PreparedStatement pstmt;

			//###싱글톤###
		static CommentDAO instance;
		public static CommentDAO getInstance() {
		
			if (instance == null) {
				instance = new CommentDAO();
			}
			return instance;

			}//###싱글톤###
		
		
			//###전체조회###
		public ArrayList<CommentVO> selectAll(CommentVO commentVo){
			
			CommentVO resultVO = null;
			ResultSet rs = null;
			
			ArrayList<CommentVO> list = new ArrayList<CommentVO>();
			try {
				
				conn = ConnectionManager.getConnnect();
				String sql = "SELECT COMMENT_ID,BOARD_ID,COMMENT_DATE,COMMENT_CONTENTS,COMMENT_POSTER FROM COMMENTS "
								+ "WHERE BOARD_ID = ? ORDER BY COMMENT_ID";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, commentVo.getBoard_id());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				resultVO = new CommentVO();
				resultVO.setComment_id(rs.getString(1));
				resultVO.setBoard_id(rs.getString(2));
				resultVO.setComment_date(rs.getString(3));
				resultVO.setComment_contents(rs.getString(4));
				resultVO.setComment_poster(rs.getString(5));
				list.add(resultVO);
				
			}		
			}catch(Exception e){		
				e.printStackTrace();			
			}finally{		
				ConnectionManager.close(rs, pstmt, conn); 
			} 		
			return list;
			}//###전체조회###
		
		
			//###단건조회###
			public CommentVO selectOne(CommentVO commentVo) {
				
				CommentVO resultVO = null;
				ResultSet rs = null;
				
				try {
					conn = ConnectionManager.getConnnect();
					String sql = "SELECT COMMENT_ID,BOARD_ID,COMMENT_DATE,COMMENT_CONTENTS,COMMENT_POSTER FROM COMMENTS WHERE COMMENT_ID = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, commentVo.getComment_id());
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						
						resultVO = new CommentVO();
						resultVO.setComment_id(rs.getString("comment_id"));
						resultVO.setBoard_id(rs.getString("board_id"));
						resultVO.setComment_date(rs.getString("comment_date"));
						resultVO.setComment_contents(rs.getString("comment_contents"));
						resultVO.setComment_poster(rs.getString("comment_poster"));
						
					}			
				}catch(Exception e){
					e.printStackTrace();
				}finally {
					ConnectionManager.close(rs,pstmt,conn);
				}
				return resultVO;
			}//###단건조회###
			
			
			//###입력###
			public CommentVO insert(CommentVO commentVo) {
				
				try {
					conn = ConnectionManager.getConnnect();
					String seqSql = "SELECT comment_id_seq.NEXTVAL FROM dual";
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(seqSql);
					rs.next();
					String no = rs.getString(1);
					commentVo.setComment_id(no);
					
					String sql = "INSERT INTO Comments (COMMENT_ID,BOARD_ID,COMMENT_DATE,COMMENT_CONTENTS,COMMENT_POSTER)"
								 + " VALUES(?,?,sysdate,?,?)";
					
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, commentVo.getComment_id());
					pstmt.setString(2, commentVo.getBoard_id());
					pstmt.setString(3, commentVo.getComment_contents());
					pstmt.setString(4, commentVo.getComment_poster());
					pstmt.executeUpdate();
				
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					ConnectionManager.close(null,pstmt,conn);
				}
				return commentVo;
			}//###입력###
					
			
			//###삭제###
			public void delete(CommentVO commentVo) {
				
				try {
				
					conn = ConnectionManager.getConnnect();
					String sql = "DELETE COMMENTS WHERE COMMENT_ID = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, commentVo.getComment_id());
					pstmt.executeUpdate();
				
				
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					ConnectionManager.close(null,pstmt,conn);
				}
			}//###삭제###
			
			
		
			
			
			
		
	}


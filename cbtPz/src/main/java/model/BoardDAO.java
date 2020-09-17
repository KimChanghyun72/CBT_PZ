package model;
	import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

	public class BoardDAO {
		
		Connection conn;
		PreparedStatement pstmt;

		//###싱글톤###
		static BoardDAO instance;
		public static BoardDAO getInstance() {
		
			if (instance == null) {
				instance = new BoardDAO();
			}
			return instance;

		}//###싱글톤###
		
		//###전체조회###
		public ArrayList<BoardVO> selectAll(BoardVO boardVo){
			
			BoardVO resultVO = null;
			ResultSet rs = null;
			
			ArrayList<BoardVO> list = new ArrayList<BoardVO>();
			try {
				
				conn = ConnectionManager.getConnnect();
				String sql = "SELECT BOARD_ID,TITLE,CONTENTS,MEMBER_ID,BOARD_DATE,VIEWS FROM BOARD";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				resultVO = new BoardVO();
				resultVO.setBoard_id(rs.getString(1));
				resultVO.setTitle(rs.getString(2));
				resultVO.setContents(rs.getString(3));
				resultVO.setMember_id(rs.getString(4));
				resultVO.setBoard_date(rs.getString(5));
				resultVO.setViews(rs.getInt(6));
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
		public BoardVO selectOne(BoardVO boardVo) {
			
			BoardVO resultVO = null;
			ResultSet rs = null;
			
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "SELECT BOARD_ID,TITLE,CONTENTS,MEMBER_ID,BOARD_DATE,VIEWS FROM BOARD WHERE BOARD_ID = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, boardVo.getBoard_id());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					resultVO = new BoardVO();
					resultVO.setBoard_id(rs.getString("BOARD_ID"));
					resultVO.setTitle(rs.getString("TITLE"));
					resultVO.setContents(rs.getString("CONTENTS"));
					resultVO.setMember_id(rs.getString("MEMBER_ID"));
					resultVO.setBoard_date(rs.getString("BOARD_DATE"));
					resultVO.setViews(rs.getInt("VIEWS"));
					
			
				}			
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				ConnectionManager.close(rs,pstmt,conn);
			}
			return resultVO;
		}//###단건조회###
		
		
		//###입력###
		public BoardVO insert(BoardVO boardVo) {
			
			try {
				conn = ConnectionManager.getConnnect();
				
				String sql = "INSERT INTO BOARD (BOARD_ID,TITLE,CONTENTS,MEMBER_ID,BOARD_DATE,VIEWS)"
							 + " VALUES(?,?,?,?,sysdate,?)";
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, boardVo.getBoard_id());
				pstmt.setString(2, boardVo.getTitle());
				pstmt.setString(3, boardVo.getContents());
				pstmt.setString(4, boardVo.getMember_id());
				pstmt.setString(5, boardVo.getBoard_date());
				pstmt.setInt(6, boardVo.getViews());
				pstmt.executeUpdate();
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionManager.close(null,pstmt,conn);
			}
			return boardVo;
		}//###입력###
		
		//###삭제###
		public void delete(BoardVO boardVo) {
			
			try {
			
				conn = ConnectionManager.getConnnect();
				String sql = "DELETE MEMBER WHERE BOARD_ID = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, boardVo.getBoard_id());
				pstmt.executeUpdate();
			
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionManager.close(null,pstmt,conn);
			}
		}//###삭제###
		
		
		//###갱신###
		public void update(BoardVO boardVo) {
			
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "UPDATE BOARD SET TITLE = ?,CONTENTS = ?,MEMBER_ID = ?,BOARD_DATE = ?,VIEWS = ? WHERE BOARD_ID=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, boardVo.getTitle());
				pstmt.setString(2, boardVo.getContents());
				pstmt.setString(3, boardVo.getMember_id());
				pstmt.setString(4, boardVo.getBoard_date());
				pstmt.setInt(5, boardVo.getViews());
				pstmt.setString(6, boardVo.getBoard_id());
				pstmt.executeUpdate();
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionManager.close(null, pstmt, conn);
			}
		}//###갱신###
		
	}
	


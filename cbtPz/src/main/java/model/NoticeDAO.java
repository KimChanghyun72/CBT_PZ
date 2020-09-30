package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class NoticeDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	//###싱글톤###
			static NoticeDAO instance;
			public static NoticeDAO getInstance() {
			
				if (instance == null) {
				instance = new NoticeDAO();
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
					String where =" where 1 = 1";
					if(boardVo.getBoard_title() != null) {
						where += " and title like '%' || ? || '%'";
					}
					//String sql = "SELECT BOARD_ID,TITLE,CONTENTS,MEMBER_ID,BOARD_DATE,VIEWS FROM BOARD";
				
					String sql = "select a.* from(select rownum rn,b.* from( "
							+ " SELECT SUBSTR(BOARD_ID,2),BOARD_TITLE,MEMBER_ID,BOARD_DATE"
							+ " FROM BOARD"
							+ where
							+ " AND BOARD_ID LIKE'A%'"
							+ " ORDER BY BOARD_ID DESC"
							+ " )b ) a where rn between ? and ? ";
				pstmt = conn.prepareStatement(sql);
				
				int pos = 1;
				if(boardVo.getBoard_title() != null) {
					pstmt.setString(pos++, boardVo.getBoard_title());
				}
				pstmt.setInt(pos++, boardVo.getFirst());
				pstmt.setInt(pos++, boardVo.getLast());
			
				rs = pstmt.executeQuery();
				while(rs.next()) {
					
					resultVO = new BoardVO();
					resultVO.setBoard_id(rs.getString(2));
					resultVO.setBoard_title(rs.getString(3));
					resultVO.setMember_id(rs.getString(4));
					resultVO.setBoard_date(rs.getString(5));
					list.add(resultVO);
					
				}	
				}catch(Exception e){		
					e.printStackTrace();		
				}finally{		
					ConnectionManager.close(rs, pstmt, conn); 
				} 	
				return list;
				}//###전체조회###		
			
			//###페이징 카운터###
			public int count(BoardVO boardVo) {
				int cnt = 0;
				try {
					conn = ConnectionManager.getConnnect();
					String where =" where 1 = 1";
					if(boardVo.getBoard_title() != null) {
						where += " and TITLE like '%' || ? || '%'";
					}
					String sql = "select count(*) from board" + where;
					pstmt = conn.prepareStatement(sql);
					int pos = 1;
					if(boardVo.getBoard_title() != null) {
						pstmt.setString(pos++, boardVo.getBoard_title());
					}
					
					ResultSet rs = pstmt.executeQuery();
					rs.next();
					cnt = rs.getInt(1);
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					ConnectionManager.close(conn);
				}
				return cnt;
			}
			//###페이징 카운터###
			//###입력###
			public int insert(BoardVO boardVo) {
				int r = 0;
				try {
					conn = ConnectionManager.getConnnect();
					
					String sql = "INSERT INTO BOARD (BOARD_ID,BOARD_TITLE,MEMBER_ID,BOARD_CONTENTS,BOARD_DATE,BOARD_FILE) "
							+ "VALUES('A'||NOTICE_SEQ.NEXTVAL,?,?,?,sysdate,?)";
					 
					PreparedStatement pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, boardVo.getBoard_title());
					pstmt.setString(2, boardVo.getMember_id());
					pstmt.setString(3, boardVo.getBoard_contents());
					pstmt.setString(4, boardVo.getBoard_file());
				
					r = pstmt.executeUpdate();
				
					if(r==1) {
						System.out.println(r + "건이 처리됨");
					}
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					ConnectionManager.close(null,pstmt,conn);
				}
				return r;
			}//###입력###
			
			//###단건조회###
			public BoardVO selectOne(BoardVO boardVo) {			
				BoardVO resultVO = null;
				ResultSet rs = null;
				
				try {
					conn = ConnectionManager.getConnnect();
					String sql = "SELECT BOARD_ID,BOARD_TITLE,BOARD_CONTENTS,MEMBER_ID,BOARD_DATE,BOARD_FILE FROM BOARD WHERE BOARD_ID = 'A'||?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, boardVo.getBoard_id());
					rs = pstmt.executeQuery();
					if(rs.next()) {
						resultVO = new BoardVO();
						resultVO.setBoard_id(rs.getString("BOARD_ID"));
						resultVO.setBoard_title(rs.getString("BOARD_TITLE"));
						resultVO.setBoard_contents(rs.getString("BOARD_CONTENTS"));
						resultVO.setMember_id(rs.getString("MEMBER_ID"));
						resultVO.setBoard_date(rs.getString("BOARD_DATE"));
						resultVO.setBoard_file(rs.getString("BOARD_FILE"));		
					}			
				}catch(Exception e){
					e.printStackTrace();
				}finally {
					ConnectionManager.close(rs,pstmt,conn);
				}
				return resultVO;
			}//###단건조회###
			//###갱신단건조회###
			public BoardVO upselectOne(BoardVO boardVo) {			
				BoardVO resultVO = null;
				ResultSet rs = null;
				
				try {
					conn = ConnectionManager.getConnnect();
					String sql = "SELECT BOARD_ID,BOARD_TITLE,BOARD_CONTENTS,MEMBER_ID,BOARD_DATE,BOARD_FILE FROM BOARD WHERE BOARD_ID = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, boardVo.getBoard_id());
					rs = pstmt.executeQuery();
					if(rs.next()) {
						resultVO = new BoardVO();
						resultVO.setBoard_id(rs.getString("BOARD_ID"));
						resultVO.setBoard_title(rs.getString("BOARD_TITLE"));
						resultVO.setBoard_contents(rs.getString("BOARD_CONTENTS"));
						resultVO.setMember_id(rs.getString("MEMBER_ID"));
						resultVO.setBoard_date(rs.getString("BOARD_DATE"));
						resultVO.setBoard_file(rs.getString("BOARD_FILE"));		
					}			
				}catch(Exception e){
					e.printStackTrace();
				}finally {
					ConnectionManager.close(rs,pstmt,conn);
				}
				return resultVO;
			}//###업데이트단건조회###
			
			// ###삭제###
			public void delete(BoardVO boardVo) {

				try {

					conn = ConnectionManager.getConnnect();
					String sql = "DELETE Board WHERE BOARD_ID = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, boardVo.getBoard_id());
					pstmt.executeUpdate();

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					ConnectionManager.close(null, pstmt, conn);
				}
			}// ###삭제###
			
			
			
			
			// ###갱신###
			public void update(BoardVO boardVo) {

				try {
					conn = ConnectionManager.getConnnect();
					String sql = "UPDATE BOARD SET BOARD_TITLE = ?,BOARD_CONTENTS = ?,BOARD_DATE = sysdate,BOARD_FILE = ? WHERE BOARD_ID = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, boardVo.getBoard_title());
					pstmt.setString(2, boardVo.getBoard_contents());
					pstmt.setString(3, boardVo.getBoard_file());
					pstmt.setString(4, boardVo.getBoard_id());
					pstmt.executeUpdate();

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					ConnectionManager.close(null, pstmt, conn);
				}
			}// ###갱신###
}

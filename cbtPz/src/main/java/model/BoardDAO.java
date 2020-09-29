package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class BoardDAO {

	Connection conn;
	PreparedStatement pstmt;

	// ###싱글톤###
	static BoardDAO instance;

	public static BoardDAO getInstance() {

		if (instance == null) {
			instance = new BoardDAO();
		}
		return instance;

<<<<<<< HEAD
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
						+ " SELECT BOARD_ID,BOARD_TITLE,BOARD_CONTENTS,MEMBER_ID,BOARD_DATE,BOARD_VIEWS,BOARD_FILE"
						+ " FROM BOARD"
						+ where
						+ " AND BOARD_ID NOT LIKE'A%'"
						+ " ORDER BY BOARD_ID DESC"
						+ " )b ) a where rn between ? and ? ";
=======
	}// ###싱글톤###

	// ###전체조회###
	public ArrayList<BoardVO> selectAll(BoardVO boardVo) {

		BoardVO resultVO = null;
		ResultSet rs = null;

		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {

			conn = ConnectionManager.getConnnect();
			String where = " where 1 = 1";
			if (boardVo.getBoard_title() != null) {
				where += " and title like '%' || ? || '%'";
			}
			// String sql = "SELECT BOARD_ID,TITLE,CONTENTS,MEMBER_ID,BOARD_DATE,VIEWS FROM
			// BOARD";

			String sql = "select a.* from(select rownum rn,b.* from( "
					+ " SELECT BOARD_ID,BOARD_TITLE,BOARD_CONTENTS,MEMBER_ID,BOARD_DATE,BOARD_VIEWS,BOARD_FILE"
					+ " FROM BOARD" + where + " ORDER BY BOARD_ID DESC" + " )b ) a where rn between ? and ? ";
>>>>>>> branch 'master' of https://github.com/KimChanghyun72/CBT_PZ.git
			pstmt = conn.prepareStatement(sql);

			int pos = 1;
			if (boardVo.getBoard_title() != null) {
				pstmt.setString(pos++, boardVo.getBoard_title());
			}
			pstmt.setInt(pos++, boardVo.getFirst());
			pstmt.setInt(pos++, boardVo.getLast());

			rs = pstmt.executeQuery();
			while (rs.next()) {

				resultVO = new BoardVO();
				resultVO.setBoard_id(rs.getString(2));
				resultVO.setBoard_title(rs.getString(3));
				resultVO.setBoard_contents(rs.getString(4));
				resultVO.setMember_id(rs.getString(5));
				resultVO.setBoard_date(rs.getString(6));
				resultVO.setBoard_views(rs.getInt(7));
				list.add(resultVO);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}// ###전체조회###

	// ###단건조회###
	public BoardVO selectOne(BoardVO boardVo) {

		BoardVO resultVO = null;
		ResultSet rs = null;

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT BOARD_ID,BOARD_TITLE,BOARD_CONTENTS,MEMBER_ID,BOARD_DATE,BOARD_VIEWS,BOARD_FILE FROM BOARD WHERE BOARD_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardVo.getBoard_id());
			rs = pstmt.executeQuery();

			if (rs.next()) {

				resultVO = new BoardVO();
				resultVO.setBoard_id(rs.getString("BOARD_ID"));
				resultVO.setBoard_title(rs.getString("BOARD_TITLE"));
				resultVO.setBoard_contents(rs.getString("BOARD_CONTENTS"));
				resultVO.setMember_id(rs.getString("MEMBER_ID"));
				resultVO.setBoard_date(rs.getString("BOARD_DATE"));
				resultVO.setBoard_views(rs.getInt("BOARD_VIEWS"));
				resultVO.setBoard_file(rs.getString("BOARD_FILE"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVO;
	}// ###단건조회###

	// ###입력###
	public int insert(BoardVO boardVo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();

			String sql = "INSERT INTO BOARD (BOARD_ID,BOARD_TITLE,MEMBER_ID,BOARD_CONTENTS,BOARD_DATE,BOARD_VIEWS,BOARD_FILE) "
					+ "VALUES(board_id_seq.NEXTVAL,?,?,?,sysdate,0,?)";

			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, boardVo.getBoard_title());
			pstmt.setString(2, boardVo.getMember_id());
			pstmt.setString(3, boardVo.getBoard_contents());
			pstmt.setString(4, boardVo.getBoard_file());

			r = pstmt.executeUpdate();

			if (r == 1) {
				System.out.println(r + "건이 처리됨");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
		return r;
	}// ###입력###

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
			String sql = "UPDATE BOARD SET BOARD_TITLE = ?,BOARD_CONTENTS = ?,MEMBER_ID = ?,BOARD_DATE = sysdate,BOARD_FILE = ? WHERE BOARD_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardVo.getBoard_title());
			pstmt.setString(2, boardVo.getBoard_contents());
			pstmt.setString(3, boardVo.getMember_id());

			pstmt.setString(4, boardVo.getBoard_file());
			pstmt.setString(5, boardVo.getBoard_id());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}// ###갱신###

	// ###페이징 카운터###
	public int count(BoardVO boardVo) {
		int cnt = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String where = " where 1 = 1";
			if (boardVo.getBoard_title() != null) {
				where += " and TITLE like '%' || ? || '%'";
			}
			String sql = "select count(*) from board" + where;
			pstmt = conn.prepareStatement(sql);
			int pos = 1;
			if (boardVo.getBoard_title() != null) {
				pstmt.setString(pos++, boardVo.getBoard_title());
			}

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
	// ###페이징 카운터###

	// ###조회수 카운터###
	public void updateBoardCnt(BoardVO vo) {

		System.out.println("jdbc기능처리");
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE BOARD SET BOARD_VIEWS = BOARD_VIEWS + 1 WHERE BOARD_ID = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getBoard_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}

	}// ###조회수 카운터 ###

	
	// =====================================================================

	
	// 회원 작성글 조회
	public ArrayList<BoardVO> selectMemberAll(BoardVO boardVo) {

		BoardVO resultVO = null;
		ResultSet rs = null;

		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {

			conn = ConnectionManager.getConnnect();
			String where = " where 1 = 1 and member_id = ?";
			if (boardVo.getBoard_title() != null) {
				where += " and title like '%' || ? || '%'";
			}
			// String sql = "SELECT BOARD_ID,TITLE,CONTENTS,MEMBER_ID,BOARD_DATE,VIEWS FROM
			// BOARD";

			String sql = "select a.* from(select rownum rn,b.* from( "
					+ " SELECT BOARD_ID,BOARD_TITLE,BOARD_CONTENTS,MEMBER_ID,BOARD_DATE,BOARD_VIEWS,BOARD_FILE"
					+ " FROM BOARD" + where + " ORDER BY BOARD_ID DESC" + " )b ) a where rn between ? and ? ";

			pstmt = conn.prepareStatement(sql);

			int pos = 1;
			pstmt.setString(pos++, boardVo.getMember_id());
			if (boardVo.getBoard_title() != null) {
				pstmt.setString(pos++, boardVo.getBoard_title());
			}
			pstmt.setInt(pos++, boardVo.getFirst());
			pstmt.setInt(pos++, boardVo.getLast());
			// page 1~10, 11~20 first, last 임의의 변수

			rs = pstmt.executeQuery();
			while (rs.next()) {

				resultVO = new BoardVO();
				resultVO.setBoard_id(rs.getString(2));
				resultVO.setBoard_title(rs.getString(3));
				resultVO.setBoard_contents(rs.getString(4));
				resultVO.setMember_id(rs.getString(5));
				resultVO.setBoard_date(rs.getString(6));
				resultVO.setBoard_views(rs.getInt(7));
				list.add(resultVO);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}// 회원 작성글 조회
	
	
}
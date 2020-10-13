package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class ProblemDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	static ProblemDAO instance;
	public static ProblemDAO getInstance() {
		if(instance==null)
			instance = new ProblemDAO();
			return instance;
	}
	public ProblemVO selectOne(ProblemVO problemVO) {
		ProblemVO resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect(); // sql문 작성시 다음줄 넘어갔을때 공백 넣어야함 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			String sql = "SELECT PROBLEM_ID, SUBJECT, HAESEOL, PROBLEM_TEXT, ANS_1, ANS_2, ANS_3,"
					+ "ANS_4, ANS_CORRECT, PAPERHEAD_ID, PROBLEM_IMAGE" + " FROM PROBLEM"
					+ " WHERE PROBLEM_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, problemVO.getProblem_id());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resultVO = new ProblemVO();
				resultVO.setProblem_id(rs.getString(1));
				resultVO.setSubject(rs.getString(2));
				resultVO.setHaeseol(rs.getString(3));
				resultVO.setProblem_text(rs.getString(4));
				resultVO.setAns_1(rs.getString(5));
				resultVO.setAns_2(rs.getString(6));
				resultVO.setAns_3(rs.getString(7));
				resultVO.setAns_4(rs.getString(8));
				resultVO.setAns_correct(rs.getString(9));
				resultVO.setProblem_id(rs.getString(10));
				resultVO.setProblem_image(rs.getString(11));
			} else {
				System.out.println("No data");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVO;
	}
	
	public ArrayList<ProblemVO> selectAll(ProblemVO problemVO) {
		ArrayList<ProblemVO> list = new ArrayList<>();
		ProblemVO resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT PROBLEM_ID, SUBJECT, HAESEOL, PROBLEM_TEXT, ANS_1, ANS_2, ANS_3,"
						+ " ANS_4, ANS_CORRECT, PAPERHEAD_ID, PROBLEM_IMAGE"
						+ " FROM MEMBER ORDER BY PAPERHEAD_ID";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVO = new ProblemVO();
				resultVO.setProblem_id(rs.getString(1));
				resultVO.setSubject(rs.getString(2));
				resultVO.setHaeseol(rs.getString(3));
				resultVO.setProblem_text(rs.getString(4));
				resultVO.setAns_1(rs.getString(5));
				resultVO.setAns_2(rs.getString(6));
				resultVO.setAns_3(rs.getString(7));
				resultVO.setAns_4(rs.getString(8));
				resultVO.setAns_correct(rs.getString(9));
				resultVO.setProblem_id(rs.getString(10));
				resultVO.setProblem_image(rs.getString(11));
				list.add(resultVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	public void insert(model.ProblemVO problem) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "INSERT INTO PROBLEMS (PROBLEM_ID, SUBJECT, HAESEOL, PROBLEM_TEXT, ANS_1, ANS_2, "
					+ "ANS_3, ANS_4, ANS_CORRECT, PAPERHEAD_ID, PROBLEM_IMAGE) "
					+ "VALUES (PROBLEM_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, problem.getSubject());
			pstmt.setString(2, problem.getHaeseol());
			pstmt.setString(3, problem.getProblem_text());
			pstmt.setString(4, problem.getAns_1());
			pstmt.setString(5, problem.getAns_2());
			pstmt.setString(6, problem.getAns_3());
			pstmt.setString(7, problem.getAns_4());
			pstmt.setString(8, problem.getAns_correct());
			pstmt.setString(9, problem.getPaperhead_id());
			pstmt.setString(10, problem.getProblem_image());
		
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 입력됨");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
	}
	
	public void update(ProblemVO problemVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE PAPERHEAD SET SUBJECT = ? WHERE PROBLEM_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, problemVO.getSubject());
			pstmt.setString(2, problemVO.getProblem_id());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 수정됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}
	
	public void delete(ProblemVO problemVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "DELETE PROBLEM WHERE PROBLEM_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, problemVO.getProblem_id());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 삭제됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}
	
	
	
	// 오답노트 응시결과 불러오기
	public ArrayList<SolveVO> selectAllRetest(SolveVO solveVO) {
		SolveVO resultVO = null;
		ResultSet rs = null;
		
		ArrayList<SolveVO> list = new ArrayList<SolveVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT A.* FROM(SELECT B.*, ROWNUM RM FROM ( "
						+ "SELECT member_id, SOLVE_ID, SOLVE_DATE, SOLVE_TIME, SOLVE_TYPE_CD, SOLVE_SCORE, SOLVE_CNT "  
						+" FROM SOLVE "  
						+" WHERE MEMBER_ID = ? "
						+" ORDER BY SOLVE_DATE DESC "
						+" ) B) A WHERE RM BETWEEN ? AND ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, solveVO.getMember_id()); // member_id를 기준으로  문제 출력
			pstmt.setInt(2, solveVO.getFirst());
			pstmt.setInt(3, solveVO.getLast());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				resultVO = new SolveVO();
				resultVO.setMember_id(rs.getString("member_id"));
				resultVO.setSolve_id(rs.getString("solve_id"));
				resultVO.setSolve_date(rs.getString("solve_date"));
				resultVO.setSolve_time(rs.getString("solve_time"));
				resultVO.setSolve_type_cd(rs.getString("solve_type_cd"));
				resultVO.setSolve_score(rs.getString("solve_score"));
				resultVO.setSolve_cnt(rs.getString("solve_cnt"));
				list.add(resultVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	// 페이징 카운터
	public int count(SolveVO solveVO) {
		int cnt = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT count(member_id) " 
						+"FROM SOLVE "
						+"WHERE MEMBER_ID = ?";
			pstmt = conn.prepareStatement(sql);
			int pos = 1;
			pstmt.setString(pos++, solveVO.getMember_id());

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

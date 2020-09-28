package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.ConnectionManager;
import paper.PaperVO;

public class SolveDAO {
	ResultSet rs;
	Connection conn;
	PreparedStatement pstmt;
	
	static SolveDAO instance;
	public static SolveDAO getInstance() {
		if(instance==null)
			instance=new SolveDAO();
			return instance;
	}
	
	public void insertSolve(SolveVO solveVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "insert into solve (SOLVE_ID, SOLVE_SCORE, MEMBER_ID, SOLVE_DATE, SOLVE_TIME, SOLVE_TYPE_CD, SOLVE_CNT) " 
					   + "values(solve_seq.nextval,?,?,sysdate,?,?,?)"; 
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, solveVO.getSolve_id());
			pstmt.setString(2, solveVO.getSolve_score());
			pstmt.setString(3, solveVO.getMember_id());
			pstmt.setString(4, solveVO.getSolve_date());
			pstmt.setString(5, solveVO.getSolve_time());
			pstmt.setString(6, solveVO.getSolve_type_cd());
			pstmt.setString(7, solveVO.getSolve_cnt());
			
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 입력됨");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
	}
}

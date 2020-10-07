package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.ConnectionManager;

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
	
	public void UpateSolve(SolveVO solveVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " UPDATE SOLVE " 
					     + " SET SOLVE_SCORE = (SELECT p.IS_CORRECT from PAPER p ), " 
					     + " SOLVE_SCORE = ,"
					     + " SOLVE_TIME = ?, "
					     + " SOLVE_CNT = ? "
					     + " WHERE SOLVE_ID = ? ";
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, solveVO.getSolve_score());
			pstmt.setString(2, solveVO.getSolve_time());
			pstmt.setString(3, solveVO.getSolve_cnt());
			pstmt.setString(4, solveVO.getSolve_id());
			
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 입력됨");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
	}
}

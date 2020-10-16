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
	
	public void UpateSolve(String sid,String time) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE SOLVE " 
						+" 		SET SOLVE_SCORE = " 
						+"			( SELECT sum(NVL(IS_CORRECT,0)) " 
						+"			  from PAPER " 
						+"			  where solve_id = ? ), " 
						+" 			SOLVE_TIME = ?, " 
						+"          SOLVE_SUBMIT='Y'"
						+" 			WHERE SOLVE_ID = ?";
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sid);
			pstmt.setString(2, time);
			pstmt.setString(3, sid);
			
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 입력됨");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
	}
	
	public void UpdateTime(String time,String sid) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE SOLVE " 
						+" 		SET SOLVE_TIME = ? " 						 
						+" 			WHERE SOLVE_ID = ?";
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, time);
			pstmt.setString(2, sid);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
	}
}

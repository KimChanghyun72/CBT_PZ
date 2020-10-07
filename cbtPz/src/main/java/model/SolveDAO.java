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
	
	public void UpateSolve(String a,String b) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE SOLVE " 
						+" 		SET SOLVE_SCORE = " 
						+"			( SELECT sum(NVL(IS_CORRECT,0)) " 
						+"			  from PAPER " 
						+"			  where solve_id = ? ), " 
						+" 			SOLVE_TIME = ? " 						 
						+" 			WHERE SOLVE_ID = ?";
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			pstmt.setString(2, b);
			pstmt.setString(3, a);
			
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 입력됨");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
	}
}

package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.ConnectionManager;

public class PaperDAO {
	ResultSet rs;
	Connection conn;
	PreparedStatement pstmt;
	
	static PaperDAO instance;
	public static PaperDAO getInstance() {
		if(instance==null)
			instance = new PaperDAO();
			return instance;
	}
	
	public int updateChecknum(PaperVO paperVO) {
		int r=0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE PAPER " 
					     +" SET CHECK_NUM = ? "  
						 +" WHERE PAPER_ID = ? "  
					     +" AND PROBLEM_ID = ? "; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paperVO.getCheck_num());
			pstmt.setString(2, paperVO.getPaper_id());
			pstmt.setString(3, paperVO.getProblem_id());
			r = pstmt.executeUpdate();
			System.out.println(r + "건 수정됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
		return r;
	}
	
	public void updateCorrect(String a,PaperVO paperVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE PAPER " 
					     +" SET IS_CORRECT = ? "  
						 +" WHERE PAPER_ID = ? "  
					     +" AND PROBLEM_ID = ? "; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			pstmt.setString(2, paperVO.getPaper_id());
			pstmt.setString(3, paperVO.getProblem_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}
	
	public String selectAns(String a) {
		String b = null;
		try {
			conn = ConnectionManager.getConnnect(); 
			String sql = "SELECT ANS_CORRECT "  
					+" FROM PROBLEM "  
					+" WHERE PROBLEM_ID = ?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				b = rs.getString("ANS_CORRECT");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return b;
	}
	
}

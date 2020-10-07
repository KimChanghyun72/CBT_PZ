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
	
	public int updateCorrect(PaperVO paperVO) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE PAPER " 
					     +" SET IS_CORRECT = ? "  
						 +" WHERE PAPER_ID = ? "  
					     +" AND PROBLEM_ID = ? "; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paperVO.getIs_correct());
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
	
	public int selectAns(ProblemVO problemVO) {
		int r = 0;
		ProblemVO resultVO = null;
		try {
			conn = ConnectionManager.getConnnect(); 
			String sql = "SELECT ANS_CORRECT "  
					+" FROM PROBLEM "  
					+" WHERE PROBLEM_ID = ?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, problemVO.getProblem_id());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resultVO = new ProblemVO();
				resultVO.setAns_correct(rs.getString(1));
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return r;
	}
	
}

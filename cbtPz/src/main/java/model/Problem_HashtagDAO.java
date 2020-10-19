package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.ConnectionManager;

public class Problem_HashtagDAO {
	
	ResultSet rs;
	Connection conn;
	PreparedStatement pstmt;
	
	static Problem_HashtagDAO instance;
	public static Problem_HashtagDAO getInstance() {
		if(instance==null)
			instance = new Problem_HashtagDAO();
			return instance;
	}
	
	public int insert(Problem_HashtagVO problem_HashtagVO) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			
			String sql = " INSERT INTO PROBLEM_HASHTAG  "
					+ " VALUES(?, ?)";
			 
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, problem_HashtagVO.getHashtag_id());
			pstmt.setString(2, problem_HashtagVO.getProblem_id());
		
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
	}
	
}

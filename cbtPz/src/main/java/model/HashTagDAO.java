package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.ConnectionManager;

public class HashTagDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	//싱글톤
	static HashTagDAO instance;
	public static HashTagDAO getInstance() {
		if(instance==null)
			instance=new HashTagDAO();
			return instance;
	}
	
	public int insert(HashTagVO HashTagVo) {
		int r =0;
		try {
			// 1. DB연결
			conn = ConnectionManager.getConnnect();
			
			// 2. sql 구문 실행
			String sql = "INSERT INTO HASHTAG(HASHTAG_ID, CLASSIFY_CODE_CD)"
					 	+ "VALUES (?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, HashTagVo.getHashtag_id());	
			r = pstmt.executeUpdate();

			// 3. 결과 처리
			if (r == 1) {
				System.out.println(r + "건이 처리됨");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 4. 연결 해제 (연결횟수제한으로인해 해제까지 해줘야함)
			ConnectionManager.close(conn);
		}
		return r;
	} //인서트
}

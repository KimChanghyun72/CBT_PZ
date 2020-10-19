package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class HashtagDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//싱글톤
	static HashtagDAO instance;
	public static HashtagDAO getInstance() {
		if(instance==null)
			instance=new HashtagDAO();
			return instance;
	}
	
	public int insert(HashtagVO HashtagVo) {
		int r =0;
		try {
			// 1. DB연결
			conn = ConnectionManager.getConnnect();
			
			// 2. sql 구문 실행
			String sql = "INSERT INTO HASHTAG(HASHTAG_ID, CLASSIFY_CODE_CD, HASHTAG_NAME)"
					 	+ "VALUES (HASH_SEQ.nextval,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, HashtagVo.getClassify_code_cd());
			pstmt.setString(2, HashtagVo.getHashtag_name());
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
	
	public ArrayList<HashtagVO> selectHashtag(HashtagVO hashtagVO) {
		ArrayList<HashtagVO> list = new ArrayList<HashtagVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT HASHTAG_ID, CLASSIFY_CODE_CD, HASHTAG_NAME "
						+" FROM HASHTAG "
						+" WHERE HASHTAG_NAME LIKE '%' || ? || '%' ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hashtagVO.getHashtag_name());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HashtagVO resultVO = new HashtagVO();
				resultVO = new HashtagVO();
				resultVO.setHashtag_id(rs.getString(1));
				resultVO.setClassify_code_cd(rs.getString(2));
				resultVO.setHashtag_name(rs.getString(3));
				list.add(resultVO);
			} 
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
}

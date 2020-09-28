package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class LearnDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	// 싱글톤
	static LearnDAO instance;
	
	public static LearnDAO getInstance() {
		if (instance == null)
			instance = new LearnDAO();
		return instance;
	}
	
	public ArrayList<LearnVO> selectAll(LearnVO learnVO) {
		
		LearnVO resultVO = null;
		ResultSet rs = null;
		
		ArrayList<LearnVO> list = new ArrayList<LearnVO>();
		try {
			conn = ConnectionManager.getConnnect();
		//	String sql = "SELECT LEARN_ID, MEMBER_ID, LECTURE_NUM"
		//			+ " FROM LEARN WHERE MEMBER_ID = ?"; // sql문 + 앞에 " " 공백
			
			String sql = "SELECT" + 
					" m.member_id," + 
					"l.lecture_id, l.lecture_name, l.lecture_info, l.lecture_level, l.lecture_subject, l.lecture_image, l.lecture_link," + 
					"n.learn_id" + 
					" from learn n" + 
					" INNER JOIN member m" + 
					" ON n.member_id = m.member_id" + 
					" INNER JOIN lecture l" + 
					" ON n.lecture_id = l.lecture_id"
					+ " WHERE m.member_id = ?";
			// 띄어쓰기 X -> 붙여쓰기가 됨.
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, learnVO.getMember_id());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) { //list니까 while문 사용
				resultVO = new LearnVO();
				resultVO.setMember_id(rs.getString("member_id"));
				resultVO.setLecture_id(rs.getString("lecture_id"));
				resultVO.setLecture_name(rs.getString("lecture_name"));
				resultVO.setLecture_info(rs.getString("lecture_info"));
				resultVO.setLecture_level(rs.getString("lecture_level"));
				resultVO.setLecture_subject(rs.getString("lecture_subject"));
				resultVO.setLecture_image(rs.getString("lecture_image"));
				resultVO.setLecture_link(rs.getString("lecture_link"));
				resultVO.setLearn_id(rs.getString("learn_id"));
				list.add(resultVO); //resultVo를 list에 담음
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;  //담은 list를 리턴.
	} //selectAll
}

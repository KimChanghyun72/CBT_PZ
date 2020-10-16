package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

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
	
	
	public int learnDelete(LearnVO learnVO) {
		int r =0;
		try {
			conn = ConnectionManager.getConnnect();
			
			String sql = "delete from learn " + 
					" where member_id = ? "+ 
					"and lecture_id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, learnVO.getMember_id());
			pstmt.setString(2, learnVO.getLecture_id());		
					
			r = pstmt.executeUpdate();

			// 3. 결과 처리
			if (r == 1) {
				System.out.println(r + "건이 처리됨");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	} // learn테이블 수강강의 인서트
	
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
					"n.learn_id, nvl(lec_cnt.cnts2,0) as cnts" + 
					" from learn n" + 
					" INNER JOIN member m" + 
					" ON n.member_id = m.member_id" + 
					" INNER JOIN lecture l" + 
					" ON n.lecture_id = l.lecture_id" +
					" LEFT OUTER JOIN (select  lecture_id, count(learn_id)  as cnts2 from learn group by lecture_id) lec_cnt" +
					" ON lec_cnt.lecture_id = l.lecture_id"
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
				resultVO.setCnts(rs.getString("cnts"));
				list.add(resultVO); //resultVo를 list에 담음
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;  //담은 list를 리턴.
	} //selectAll
	
	
	
	//learn테이블 수강강의 인서트
	public int learnInsert(LearnVO learnVO) {
		int r =0;
		try {
			conn = ConnectionManager.getConnnect();
			
			String sql = "insert into learn(learn_id, member_id, lecture_id)"
					 	+ "values (learn_seq.nextval, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, learnVO.getMember_id());
			pstmt.setString(2, learnVO.getLecture_id());		
					
			r = pstmt.executeUpdate();

			// 3. 결과 처리
			if (r == 1) {
				System.out.println(r + "건이 처리됨");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	} // learn테이블 수강강의 인서트
	
	
	
	//수강이력 체크 (단건조회)
	public LearnVO learnSelectOne(LearnVO learnVO) {
		LearnVO resultVo = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT LEARN_ID "
						+ "FROM LEARN "
						+ "WHERE MEMBER_ID=? AND LECTURE_ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, learnVO.getMember_id());
			pstmt.setString(2, learnVO.getLecture_id());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultVo = new LearnVO();
				resultVo.setLearn_id(rs.getString("learn_id"));
			} else {
				System.out.println("no data");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVo;
	}//수강이력 체크 (단건조회)
	
	
	
}

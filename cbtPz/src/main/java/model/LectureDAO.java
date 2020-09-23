package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.ConnectionManager;

public class LectureDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	// 싱글톤
	static LectureDAO instance;
	
	public static LectureDAO getInstance() {
		if (instance == null)
			instance = new LectureDAO();
		return instance;
	}
	
	public int insert(LectureVO lectureVO) {
		int r = 0;
		try {
			// 1.DB 연결
			conn = ConnectionManager.getConnnect();

			// 2.sql 구문 실행
			String sql = "insert into lecture (lecture_id, lecture_name, lecture_info, lecture_link, lecture_image, teacher_num)"
					+ "values (lecture_seq.nextval, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lectureVO.getLecture_name());
			pstmt.setString(2, lectureVO.getLecture_info());
			pstmt.setString(3, lectureVO.getLecture_link());
			pstmt.setString(4, lectureVO.getLecture_image());
			pstmt.setString(5, lectureVO.getTeacher_num());
			// create sequence lecture_seq;


			r = pstmt.executeUpdate();

			// 3.결과 처리
			if (r == 1) {
				System.out.println(r + "건이 처리됨");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 4. 연결 해제
			ConnectionManager.close(conn);
		}
		return r;
	} 
}

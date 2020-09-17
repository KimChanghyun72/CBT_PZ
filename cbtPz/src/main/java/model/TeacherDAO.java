package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.ConnectionManager;

public class TeacherDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	
	//싱글톤
	static TeacherDAO instance;
	public static TeacherDAO getInstance() {
		if(instance==null)
			instance=new TeacherDAO();
			return instance;
	}
	
	
	//교사회원가입
	public int insert(TeacherVO teacherVO) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			
			String sql = "insert into TEACHER_MEMBER (TEACHER_ID, TEACHER_PASSWORD, TEACHER_RECORD, TEACHER_PICTURE, TEACHER_NAME, TEACHER_CERTIFICATE )"
				 	+ "values (?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, teacherVO.getTeacher_id());		
			pstmt.setString(2, teacherVO.getTeacher_password());		
			pstmt.setString(3, teacherVO.getTeacher_record());		
			pstmt.setString(4, teacherVO.getTeacher_picture());		
			pstmt.setString(5, teacherVO.getTeacher_name());		
			pstmt.setString(6, teacherVO.getTeacher_certificate());		

				
			r = pstmt.executeUpdate();

			if (r == 1) {
				System.out.println(r + "건이 처리됨");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;

	}//교사인서트
	
	
	
	
}

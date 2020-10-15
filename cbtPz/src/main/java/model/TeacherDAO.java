package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
			
			String sql = "insert into TEACHER_MEMBER(TEACHER_ID, TEACHER_PASSWORD, TEACHER_RECORD, TEACHER_PICTURE, TEACHER_NAME, TEACHER_CERTIFICATE, teacher_email) "
				 	+ " values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, teacherVO.getTeacher_id());		
			pstmt.setString(2, teacherVO.getTeacher_password());		
			pstmt.setString(3, teacherVO.getTeacher_record());		
			pstmt.setString(4, teacherVO.getTeacher_picture());		
			pstmt.setString(5, teacherVO.getTeacher_name());		
			pstmt.setString(6, teacherVO.getTeacher_certificate());		
			pstmt.setString(7, teacherVO.getTeacher_email());		

				
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


	
	//교사 로그인 selectOne
	public TeacherVO selectOne(TeacherVO teacherVO) {
		TeacherVO resultVo = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT TEACHER_ID, TEACHER_PASSWORD, TEACHER_RECORD, TEACHER_PICTURE, TEACHER_NAME, TEACHER_CERTIFICATE, teacher_email"
						+ " FROM TEACHER_MEMBER "
						+ "WHERE TEACHER_ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, teacherVO.getTeacher_id());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultVo = new TeacherVO();
				resultVo.setTeacher_id(rs.getString("teacher_id"));
				resultVo.setTeacher_password(rs.getString("teacher_password"));
				resultVo.setTeacher_record(rs.getString("teacher_record"));
				resultVo.setTeacher_picture(rs.getString("teacher_picture"));
				resultVo.setTeacher_name(rs.getString("teacher_name"));
				resultVo.setTeacher_certificate(rs.getString("teacher_certificate"));
				resultVo.setTeacher_email(rs.getString("teacher_email"));
			} else {
				System.out.println("no data");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVo;
	}//교사 로그인selectOne
	
	
	
	
	//교사Id찾기
		public TeacherVO selectIdOne(TeacherVO teacherVO) {
			TeacherVO resultVo = null;
			ResultSet rs = null;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "SELECT TEACHER_ID"
							+ " FROM TEACHER_MEMBER"
							+ " WHERE TEACHER_NAME = ? AND TEACHER_EMAIL = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, teacherVO.getTeacher_name());
				pstmt.setString(2, teacherVO.getTeacher_email());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					resultVo = new TeacherVO();
					resultVo.setTeacher_id((rs.getString("teacher_id")));
				} else {
					System.out.println("Teacher ID no data");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return resultVo; // 리턴값 필요!
		} //selectIdOne   교사Id찾기
	
	
	
		//교사Pw찾기
		public TeacherVO selectPwOne(TeacherVO teacherVO) {
			TeacherVO resultVo = null;
			ResultSet rs = null;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "SELECT TEACHER_PASSWORD"
							+ " FROM TEACHER_MEMBER"
							+ " WHERE TEACHER_ID = ? AND TEACHER_EMAIL = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, teacherVO.getTeacher_id());
				pstmt.setString(2, teacherVO.getTeacher_email());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					resultVo = new TeacherVO();
					resultVo.setTeacher_password((rs.getString("teacher_password")));
				} else {
					System.out.println("Teacher PW no data");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return resultVo; // 리턴값 필요!
		} //selectPwOne   교사PW찾기
		
		
		
		
	
	
	//회원가입시 email중복체크
		public TeacherVO selectEmailOne(TeacherVO teacherVO) {
			TeacherVO resultVo = null;
			ResultSet rs = null;
			
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "SELECT TEACHER_ID, TEACHER_PASSWORD, TEACHER_RECORD, TEACHER_PICTURE, TEACHER_NAME, TEACHER_CERTIFICATE, teacher_email"
							+ " FROM TEACHER_MEMBER "
							+ "WHERE TEACHER_EMAIL=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, teacherVO.getTeacher_email());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					resultVo = new TeacherVO();
					resultVo.setTeacher_id(rs.getString("teacher_id"));
					resultVo.setTeacher_password(rs.getString("teacher_password"));
					resultVo.setTeacher_record(rs.getString("teacher_record"));
					resultVo.setTeacher_picture(rs.getString("teacher_picture"));
					resultVo.setTeacher_name(rs.getString("teacher_name"));
					resultVo.setTeacher_certificate(rs.getString("teacher_certificate"));
					resultVo.setTeacher_email(rs.getString("teacher_email"));
				} else {
					System.out.println("no data");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return resultVo;
		}//회원가입시 email중복체크
		
		
		
	//교사 개인정보 수정
		public int update(TeacherVO teacherVO) {
			int r=0;
			CallableStatement cstmt = null;
			conn = ConnectionManager.getConnnect();
			try {
				cstmt = conn.prepareCall("{call prof_update(?,?,?,?,?,?)}");
				cstmt.setString(1, teacherVO.getTeacher_id());
				cstmt.setString(2, teacherVO.getTeacher_password());
				cstmt.setString(3, teacherVO.getTeacher_record());
				cstmt.setString(4, teacherVO.getTeacher_picture());
				cstmt.setString(5, teacherVO.getTeacher_certificate());
				cstmt.setString(6, teacherVO.getTeacher_email());
				r = cstmt.executeUpdate();
				System.out.println(r + "건이 수정됨");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(null, pstmt, conn);
			}
			return r;
		} //교사 개인정보 수정
		
	
	//교사 탈퇴
			public int delete(TeacherVO teacherVO) {
				int r=0;
				CallableStatement cstmt = null;
				conn = ConnectionManager.getConnnect();
				try {
					cstmt = conn.prepareCall("{call prof_delete(?)}");
					cstmt.setString(1, teacherVO.getTeacher_id());
					r = cstmt.executeUpdate();
					System.out.println(r + "건이 삭제됨");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					ConnectionManager.close(null, pstmt, conn);
				}
				return r;
			} //교사 탈퇴
		
		
			
			
			// 비밀번호 재설정
			public int UpdatePwOne(TeacherVO teacherVO) {
				int r=0;
				TeacherVO resultVo = null;
				ResultSet rs = null;
				try {
					conn = ConnectionManager.getConnnect();
					String sql = "UPDATE TEACHER_MEMBER SET TEACHER_PASSWORD = 'v3FeG`Yw' "
								+ " WHERE TEACHER_ID = ?";
					pstmt = conn.prepareStatement(sql);
				/*	pstmt.setString(1, teacherVO.getTeacher_password());*/
					pstmt.setString(1, teacherVO.getTeacher_id());
					r = pstmt.executeUpdate(); // 이때는 executeUpdate()에 sql안들어감.
					System.out.println(r + "건이 수정됨");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					ConnectionManager.close(conn);
				}
				return r;
			}
			
			
}

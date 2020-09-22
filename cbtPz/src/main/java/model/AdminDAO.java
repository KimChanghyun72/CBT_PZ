package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.ConnectionManager;

public class AdminDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	static AdminDAO instance;
	public static AdminDAO getInstance() {
		if(instance==null)
			instance=new AdminDAO();
		return instance;
	}
	
	//로그인시 관리자 체크 아이디 비번 단건조회
	public AdminVO selectAdminOne(AdminVO adminVO) {
		AdminVO resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select ADMIN_ID, DEPARTMENT_CD, ADMIN_PASSWORD, ADMIN_NAME " 
					+ "from admin"
					+ " where ADMIN_ID = ? and ADMIN_PASSWORD=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminVO.getAdmin_id());
			pstmt.setString(2, adminVO.getAdmin_password());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resultVO = new AdminVO();
				resultVO.setAdmin_id((rs.getString("admin_id")));
				resultVO.setDepartment_cd((rs.getString("department_cd")));
				resultVO.setAdmin_password((rs.getString("admin_password")));
				resultVO.setAdmin_name((rs.getString("admin_name")));
			} else {
				System.out.println("no data");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVO;
	}//관리자 아이디비번 체크 단건조회
	
	
}

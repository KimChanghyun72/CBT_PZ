package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class SchedulerDAO {

	PreparedStatement pstmt;

	static SchedulerDAO instance;

	public static SchedulerDAO getInstance() {

		/*
		 * if (instance == null) { instance = new SchedulerDAO(); }
		 */
		return new SchedulerDAO();
	}

	public int insert(SchedulerVO schedulerVO) {
		int r = 0;
		Connection conn = null;
		try { 
			conn = ConnectionManager.getConnnect();

			String sql = "INSERT INTO SCHEDULER1 (TITLE, START_DATE) "
					+ "VALUES(?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, schedulerVO.getTitle());
			pstmt.setString(2, schedulerVO.getStart());
			r = pstmt.executeUpdate();

			if (r == 1) {
				System.out.println(r + "건이 처리됨");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
		return r;
	}
	
	public ArrayList<SchedulerVO> selectAll(SchedulerVO schedulerVO) {
		SchedulerVO resultVo = null;
		ResultSet rs = null;
		Connection conn = null;
		ArrayList<SchedulerVO> list = new ArrayList<SchedulerVO>();
		try {												
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT TITLE, TO_CHAR(START_DATE,'YYYY-MM-DD') || 'T00:00:00'"
						+" FROM SCHEDULER1 ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) { 
				resultVo = new SchedulerVO();
				resultVo.setTitle(rs.getString(1));
				resultVo.setStart(rs.getString(2));
				list.add(resultVo); 
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; 
	} 

}

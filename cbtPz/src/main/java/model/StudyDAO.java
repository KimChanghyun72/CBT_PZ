package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;



public class StudyDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//싱글톤
	static StudyDAO instance;
	public static StudyDAO getInstance() {
		if(instance==null)
		   instance=new StudyDAO();
		return instance;
	}
	
	public ArrayList<StudyVO> selectAll(StudyVO studyVO) {
		StudyVO resultVO = null;
		ArrayList<StudyVO> list = new ArrayList<StudyVO>(); 
		
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT PROBLEM_ID, SUBJECT, HAESEOL, PROBLEM_TEXT, ANS_1, ANS_2, ANS_3, ANS_4,"
						+ " ANS_CORRECT, PAPERHEAD_ID, PROBLEM_IMAGE"
						+ " FROM PROBLEM "
						+ " ORDER BY PROBLEM_ID ";
			
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				resultVO = new StudyVO();
				resultVO.setProblem_id(rs.getString(1));
				resultVO.setSubject(rs.getString(2));
				resultVO.setHaeseol(rs.getString(3));
				resultVO.setProblem_text(rs.getString(4));
				resultVO.setAns_1(rs.getString(5));
				resultVO.setAns_2(rs.getString(6));
				resultVO.setAns_3(rs.getString(7));
				resultVO.setAns_4(rs.getString(8));
				resultVO.setAns_correct(rs.getString(9));
				resultVO.setPaperhead_id(rs.getString(10));
				resultVO.setProblem_image(rs.getString(11));
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

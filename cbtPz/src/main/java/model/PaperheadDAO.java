package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.ConnectionManager;
import model.PaperheadVO;


public class PaperheadDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//싱글톤
	static PaperheadDAO instance;
	public static PaperheadDAO getInstance() {
		if(instance==null)
			instance=new PaperheadDAO();
			return instance;
	}
	// 모의/기출 검색
	public ArrayList<PaperheadVO> selectPaper_type(PaperheadVO paperheadVO) {
		ArrayList<PaperheadVO> list = new ArrayList<PaperheadVO>();
		
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT PAPERHEAD_ID, PAPER_TYPE_CD, PAPER_ROUND "
						+ " FROM CBT.PAPERHEAD "
						+ " WHERE PAPER_TYPE_CD = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paperheadVO.getPaper_type_cd());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PaperheadVO resultVO = new PaperheadVO();
				resultVO.setPaperhead_id(rs.getString("paperhead_id"));
				resultVO.setPaper_type_cd(rs.getString("paper_type_cd"));
				resultVO.setPaper_round(rs.getString("paper_round"));
				list.add(resultVO);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}		
		return list;
	}
	
	//유형별 문제 검색
	public List<Map<String,Object>> selectOne(PaperheadVO paperheadVO) {
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select h.PAPER_TYPE_CD, h.PAPER_ROUND, p.PROBLEM_ID, p.SUBJECT, HAESEOL, p.PROBLEM_TEXT, " 
						+" p.ANS_1, p.ANS_2, p.ANS_3, p.ANS_4, p.ANS_CORRECT, p.PROBLEM_IMAGE " 
						+" from cbt.PROBLEM p, cbt.PAPERHEAD h" 
						+" where p.PAPERHEAD_ID = h.PAPERHEAD_ID " 						
						+" and h.PAPERHEAD_ID = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,paperheadVO.getPaperhead_id());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("paper_type_cd",rs.getString(1));
				map.put("paper_round",rs.getString(2));
				map.put("problem_id",rs.getString(3));
				map.put("subject",rs.getString(4));
				map.put("haeseol",rs.getString(5));
				map.put("problem_text",rs.getString(6));
				map.put("ans_1",rs.getString(7));
				map.put("ans_2",rs.getString(8));
				map.put("ans_3",rs.getString(9));
				map.put("ans_4",rs.getString(10));
				map.put("ans_correct",rs.getString(11));
				map.put("problem_image",rs.getString(12));
				list.add(map);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	/*
	public List<Map<String,Object>> selectDeptSal(){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try {
			conn = ConnectionManager.getConnnect();	
			String sql = "select a.department_id, department_name,"
					+ " sum(salary) sal, count(*) cnt, avg(salary) avgsal " + 
					" from departments a, employees b" + 
					" where a.department_id = b.department_id" + 
					" group by a.department_id, department_name";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("department_id", rs.getString("department_id"));
				map.put("department_name", rs.getString("department_name"));
				map.put("salary", rs.getString("sal"));
				map.put("cnt", rs.getString("cnt"));
				map.put("avgsal", rs.getString("avgsal"));
				list.add(map);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			common.ConnectionManager.close(conn);
		}	
		return list;
	}
	*/


}

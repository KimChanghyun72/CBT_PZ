package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.ConnectionManager;


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
	// 과목 검색
		public ArrayList<ProblemVO> selectSubjectAll(ProblemVO problemVO) {
			ProblemVO resultVO = null;
			ArrayList<ProblemVO> list = new ArrayList<ProblemVO>();
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "SELECT SUBJECT FROM PROBLEM";
				
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					resultVO = new ProblemVO();
					resultVO.setSubject(rs.getString(1));
					list.add(resultVO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return list;
		}
		
		//과목별 문제검색
		public ArrayList<ProblemVO> selectSubjectType(ProblemVO problemVO) {
			ArrayList<ProblemVO> list = new ArrayList<ProblemVO>();
			
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "SELECT PROBLEM_ID, SUBJECT, HAESEOL, PROBLEM_TEXT, ANS_1, ANS_2, ANS_3,"
						+ " ANS_4, ANS_CORRECT, PAPERHEAD_ID, PROBLEM_IMAGE "
						+ " FROM problem "
						+ " where subject = ? "; 
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,problemVO.getSubject());
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ProblemVO resultVO = new ProblemVO();
					resultVO = new ProblemVO();
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
		
	// 모의/기출 검색
	public ArrayList<PaperheadVO> selectPaper_type(PaperheadVO paperheadVO) {
		ArrayList<PaperheadVO> list = new ArrayList<PaperheadVO>();
		
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT PAPERHEAD_ID, PAPER_TYPE_CD, PAPER_ROUND "
						+ " FROM PAPERHEAD "
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
						+" from PROBLEM p, PAPERHEAD h" 
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

}

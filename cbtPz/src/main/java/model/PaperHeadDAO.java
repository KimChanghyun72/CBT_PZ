package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.ConnectionManager;

public class PaperHeadDAO {
	ResultSet rs;
	Connection conn;
	PreparedStatement pstmt;
	
	static PaperHeadDAO instance;
	public static PaperHeadDAO getInstance() {
		if(instance==null)
			instance = new PaperHeadDAO();
			return instance;
	}
	
	//과목별 문제검색
	public List<Map<String,Object>> selectSubjectType(ProblemVO problemVO) {
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
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
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("problem_id", rs.getString(1));
				map.put("subject", rs.getString(2));
				map.put("haeseol", rs.getString(3));
				map.put("problem_text", rs.getString(4));
				map.put("ans_1", rs.getString(5));
				map.put("ans_2", rs.getString(6));
				map.put("ans_3", rs.getString(7));
				map.put("ans_4", rs.getString(8));
				map.put("ans_correct", rs.getString(9));
				map.put("paperhead_id", rs.getString(10));
				map.put("problem_image", rs.getString(11));
				list.add(map);
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
		
		//유형별(모의/기출) 문제 검색
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
		
		
		//해쉬태그 문제 검색
		public List<Map<String,Object>> selectHash(HashtagVO hashtagVO) {
			List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "SELECT P.PROBLEM_ID, P.SUBJECT, P.HAESEOL, P.PROBLEM_TEXT, P.ANS_1, P.ANS_2, P.ANS_3, P.ANS_4, P.ANS_CORRECT, " 
							+" P.PROBLEM_IMAGE, H.HASHTAG_ID, H.CLASSIFY_CODE_CD, H.HASHTAG_NAME " 
							+" FROM PROBLEM P , HASHTAG H , PROBLEM_HASHTAG A "
							+" WHERE H.HASHTAG_ID = A.HASHTAG_ID " 
							+" AND P.PROBLEM_ID = A.PROBLEM_ID " 
							+" AND HASHTAG_NAME = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,hashtagVO.getHashtag_name());
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("problem_id",rs.getString(1));
					map.put("subject",rs.getString(2));
					map.put("haeseol",rs.getString(3));
					map.put("problem_text",rs.getString(4));
					map.put("ans_1",rs.getString(5));
					map.put("ans_2",rs.getString(6));
					map.put("ans_3",rs.getString(7));
					map.put("ans_4",rs.getString(8));
					map.put("ans_correct",rs.getString(9));
					map.put("problem_image",rs.getString(10));
					map.put("hashtag_id",rs.getString(11));
					map.put("classify_code_cd",rs.getString(12));
					map.put("hashtag_name",rs.getString(13));
					list.add(map);
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return list;
		}
	
	
	public ArrayList<PaperheadVO> selectAll(PaperheadVO paperHeadVO) {
		ArrayList<PaperheadVO> list = new ArrayList<>();
		PaperheadVO resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT PAPERHEAD_ID, PAPER_TYPE_CD, PAPER_ROUND" + " FROM MEMBER ORDER BY PAPERHEAD_ID";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVO = new PaperheadVO();
				resultVO.setPaperhead_id(rs.getString(1));
				resultVO.setPaper_type_cd(rs.getString(2));
				resultVO.setPaper_round(rs.getString(3));
				list.add(resultVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	public void insert(PaperheadVO paperHeadVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "INSERT INTO PAPERHEAD (PAPERHEAD_ID, PAPER_TYPE_CD, PAPER_ROUND, EXCEL_FILE) "
					+ "VALUES (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paperHeadVO.getPaperhead_id());
			pstmt.setString(2, paperHeadVO.getPaper_type_cd());
			pstmt.setString(3, paperHeadVO.getPaper_round());
			pstmt.setString(4, paperHeadVO.getExcel_file());
			
			int r = pstmt.executeUpdate();
			System.out.println(r + "건이 입력됨");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
	}
	
	public void update(PaperheadVO paperHeadVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE PAPERHEAD SET PAPER_TYPE_CD = ? WHERE PAPERHEAD_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paperHeadVO.getPaper_type_cd());
			pstmt.setString(2, paperHeadVO.getPaperhead_id());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 수정됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}
	
	public void delete(PaperheadVO paperHeadVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "DELETE PAPERHEAD WHERE PAPERHEAD_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paperHeadVO.getPaperhead_id());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 삭제됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
	}
}
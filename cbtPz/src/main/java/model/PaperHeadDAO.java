package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	//엑셀 입력용 PAPERHEAD ID 검색
	public PaperheadVO selectNewOne() {
		PaperheadVO resultVO = new PaperheadVO();
		
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT PAPERHEAD_ID "
					+ "FROM (select * from paperhead ORDER BY TO_NUMBER(PAPERHEAD_ID) DESC) "
					+ "WHERE ROWNUM = 1"; 
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultVO.setPaperhead_id(rs.getString(1));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		
		
		return resultVO;
	}
	
	//모든 문제검색
	public List<Map<String,Object>> selectAllType(SearchVO searchVO) {
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT p.paper_id, NVL(p.is_correct,0) as is_correct, NVL(p.check_num,0) as check_num, p.PROBLEM_ID, s.solve_type_cd, SUBJECT, HAESEOL, PROBLEM_TEXT, ANS_1, ANS_2, ANS_3, " 
						+ " ANS_4, ANS_CORRECT, PAPERHEAD_ID, PROBLEM_IMAGE, p.solve_id, p.paper_id, s.solve_score, s.solve_cnt, s.solve_time, "
						+ " SOLVE_TYPE_CHANGE(SOLVE_TYPE_CD) as SOLVE_TYPE_NAME,subject_name(subject),"
						+ " NVL((select 1 from favorite where member_id = s.member_id and problem_id = b.problem_id),0) as fav "  
					    + " FROM paper p, PROBLEM b, SOLVE s " 
					    + " where p.problem_id = b.problem_id "  
					    + " and p.solve_id = s.solve_id "
					    + " and p.solve_id = ?"
					    + " ORDER BY TO_NUMBER(P.PROBLEM_ID)"; 
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,searchVO.getSolve_id());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("paper_id", rs.getString(1));
				map.put("is_correct", rs.getString(2));
				map.put("check_num", rs.getString(3));
				map.put("problem_id", rs.getString(4));
				map.put("solve_type_cd", rs.getString(5));
				map.put("subject", rs.getString(6));
				map.put("haeseol", rs.getString(7));
				map.put("problem_text", rs.getString(8));
				map.put("ans_1", rs.getString(9));
				map.put("ans_2", rs.getString(10));
				map.put("ans_3", rs.getString(11));
				map.put("ans_4", rs.getString(12));
				map.put("ans_correct", rs.getString(13));
				map.put("paperhead_id", rs.getString(14));
				map.put("problem_image", rs.getString(15));
				map.put("solve_id", rs.getString(16));
				map.put("paper_id", rs.getString(17));
				map.put("solve_score", rs.getString(18));
				map.put("solve_cnt", rs.getString(19));
				map.put("solve_time", rs.getString(20));
				map.put("solve_type_name", rs.getString(21));
				map.put("subject_name", rs.getString(22));
				map.put("fav", rs.getInt(23));
				list.add(map);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	//프로시져로 solve, paper 문제 등록
	public int insert_Proc(SearchVO searchVO) {			
		int next = 0;
		CallableStatement cstmt = null;
		try {
			conn = ConnectionManager.getConnnect();
			conn.setAutoCommit(false);
			
			cstmt = conn.prepareCall("{call INS_SOLVE_PAPER(?,?,?,?,?)}");
			cstmt.setString(1,searchVO.getPaperhead_id());
			cstmt.setString(2,searchVO.getSubject());
			cstmt.setString(3,searchVO.getHashtag_name());
			cstmt.setString(4,searchVO.getMember_id());		
			cstmt.registerOutParameter(5, java.sql.Types.NUMERIC);
			cstmt.executeUpdate();
			conn.commit();
			next = cstmt.getInt(5);
			
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return next;
	}
	
	//프로시져로 solve_id로 오답노트 재응시
		public int retest_Proc(SearchVO searchVO) {			
			int next = 0;
			CallableStatement cstmt = null;
			try {
				conn = ConnectionManager.getConnnect();
				conn.setAutoCommit(false);
				
				cstmt = conn.prepareCall("{call RETEST_SOLVE_PAPER(?,?,?)}");
				cstmt.setString(1,searchVO.getSolve_id());
				cstmt.setString(2,searchVO.getMember_id());		
				cstmt.registerOutParameter(3, java.sql.Types.NUMERIC);
				cstmt.executeUpdate();
				conn.commit();
				next = cstmt.getInt(3);
				
			} catch(Exception e) {
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return next;
		}
	
			
	// 모의/기출 검색
	public ArrayList<PaperheadVO> selectPaper_type(PaperheadVO paperheadVO) {
		ArrayList<PaperheadVO> list = new ArrayList<PaperheadVO>();
		
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT PAPERHEAD_ID, PAPER_TYPE_CD, PAPER_ROUND, COMMONCODE_NAME "
						+ " FROM PAPERHEAD p, commoncode c"
						+ " WHERE p.PAPER_TYPE_CD = c.COMMONCODE_ID "
						+ " and PAPER_TYPE_CD = ? "
						+ " ORDER BY PAPER_ROUND";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paperheadVO.getPaper_type_cd());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PaperheadVO resultVO = new PaperheadVO();
				resultVO.setPaperhead_id(rs.getString("paperhead_id"));
				resultVO.setPaper_type_cd(rs.getString("paper_type_cd"));
				resultVO.setPaper_round(rs.getString("paper_round"));
				resultVO.setCommoncode_name(rs.getString("commoncode_name"));
				list.add(resultVO);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}		
		return list;
	}
		
	
	// 모의/기출 검색
	public ArrayList<PaperheadVO> selectAll(PaperheadVO paperheadVO) {
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
		
		
		
	// 과목리스트 검색	
	public ArrayList<CommoncodeVO> subjectList(CommoncodeVO commoncodeVO) {
		ArrayList<CommoncodeVO> list = new ArrayList<>();
		CommoncodeVO resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select commoncode_id, COMMONCODE_name " 
					   +" from COMMONCODE " 
					   +" where COMMONCODE_ID like 's%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVO = new CommoncodeVO();
				resultVO.setCommoncode_id(rs.getString(1));
				resultVO.setCommoncode_name(rs.getString(2));
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
			String sql = "INSERT INTO PAPERHEAD (PAPERHEAD_ID, PAPER_TYPE_CD, PAPER_ROUND) "
					+ "VALUES (PAPERHEAD_SEQ.NEXTVAL,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paperHeadVO.getPaper_type_cd());
			pstmt.setString(2, paperHeadVO.getPaper_round());
			
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
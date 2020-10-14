package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class MyStatDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	static MyStatDAO instance;
	public static MyStatDAO getInstance() {
		if(instance==null)
			instance=new MyStatDAO();
			return instance;
	}
	
	
	//일별 모의고사, 기출고사 평균 라인차트
	public ArrayList<MyStatVO> dayLineChart(MyStatVO myStateVo) {
		MyStatVO resultVo = null;
		ResultSet rs = null;
		ArrayList<MyStatVO> list = new ArrayList<MyStatVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select  day, sum(case when PAPER_TYPE_CD='기출' then nvl(round((score/cnt)*100,0), 0) else 0 end) as avg1, "
						+ "sum(case when PAPER_TYPE_CD='모의' then nvl(round((score/cnt)*100,0), 0) else 0 end) as avg2 "
						+ "from( "
						+ "		select PAPERHEAD.PAPER_TYPE_CD PAPER_TYPE_CD, " 
						+ "				to_char(SOLVE_DATE, 'yyyy-mm-dd') as day, " 
						+ "				sum(solve.solve_score) as score, "
						+ "				sum(solve.solve_cnt) as cnt " 
						+ "		from solve , PAPERHEAD " 
						+ "		where PAPERHEAD.PAPERHEAD_ID = solve.SOLVE_TYPE_CD " 
						+ "		and member_id = ? and PAPER_TYPE_CD in ('기출','모의') "
						+ "		AND solve.solve_date >= trunc(sysdate)-7 "
						+ "		group by  PAPERHEAD.PAPER_TYPE_CD, to_char(SOLVE_DATE, 'yyyy-mm-dd') "
						+ "		order by PAPERHEAD.PAPER_TYPE_CD, day) "
						+ "group by day "
						+ "order by day ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myStateVo.getMember_id());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVo = new MyStatVO();
				resultVo.setDay(rs.getString("day"));
				resultVo.setAvg1(rs.getString("avg1"));
				resultVo.setAvg2(rs.getString("avg2"));
				list.add(resultVo);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	
	
	
	//과목별 평균 바차트 (이거보류)
	public ArrayList<MyStatVO> subjectBarChart1(MyStatVO myStateVo) {
		MyStatVO resultVo = null;
		ResultSet rs = null;
		ArrayList<MyStatVO> list = new ArrayList<MyStatVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select sum(case when solve_type_cd = '1과목' then round((score/cnt)*100,0) else 0 end) as subject1, "
						+ "		sum(case when solve_type_cd = '2과목' then round((score/cnt)*100,0) else 0 end) as subject2, "
						+ "		sum(case when solve_type_cd = '3과목' then round((score/cnt)*100,0) else 0 end) as subject3, "
						+ "		sum(case when solve_type_cd = '4과목' then round((score/cnt)*100,0) else 0 end) as subject4, " 
						+ "		sum(case when solve_type_cd = '5과목' then round((score/cnt)*100,0) else 0 end) as subject5 " 
						+ "from ( " 
						+ "		select solve_type_cd, sum(solve_score) as score, sum(solve_cnt) as cnt " 
						+ "		from solve " 
						+ "		where member_id=? and solve_type_cd in ( '1과목', '2과목', '3과목', '4과목', '5과목') "
						+ "		group by SOLVE_TYPE_CD)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myStateVo.getMember_id());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVo = new MyStatVO();
				resultVo.setSubject1(rs.getString("subject1"));
				resultVo.setSubject2("subject2");
				resultVo.setSubject3("subject3");
				resultVo.setSubject4("subject4");
				resultVo.setSubject5("subject5");
				list.add(resultVo);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	
	
	//과목별 평균 바차트
	public ArrayList<MyStatVO> subjectBarChart(MyStatVO myStateVo) {
		MyStatVO resultVo = null;
		ResultSet rs = null;
		ArrayList<MyStatVO> list = new ArrayList<MyStatVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select solve_type_cd, round((score/cnt)*100,0) as avg "
						+ "from (select solve_type_cd, sum(solve_score) as score, sum(solve_cnt) as cnt "
						+ "		from solve "
						+ "		where member_id=? and solve_type_cd in ( '1과목', '2과목', '3과목', '4과목', '5과목') " 
						+ "		group by SOLVE_TYPE_CD " 
						+ "		order by SOLVE_TYPE_CD)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myStateVo.getMember_id());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVo = new MyStatVO();
				resultVo.setAvg(rs.getString("avg"));
				resultVo.setSolve_type_cd(rs.getString("solve_type_cd"));
				list.add(resultVo);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	
	//해시태그 통계 파이 차트 htagPieChart
	public ArrayList<MyStatVO> htagPieChart(MyStatVO myStateVo) {
		MyStatVO resultVo = null;
		ResultSet rs = null;
		ArrayList<MyStatVO> list = new ArrayList<MyStatVO>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select rownum, cnt , hashtag_name "
						+ "from ( "
						+ "		select count(paper.paper_id) cnt, hashtag.HASHTAG_name hashtag_name "
						+ "		from solve, paper, problem, problem_hashtag, hashtag "
						+ "		where solve.solve_id = paper.solve_id "
						+ "		and solve.member_id = ? "
						+ " 	and solve.solve_type_cd like '%#%' "
						+ "		and paper.problem_id = problem.problem_id "
						+ "		and problem.problem_id = problem_hashtag.PROBLEM_ID "
						+ "		and problem_hashtag.HASHTAG_ID = hashtag.hashtag_id "
						+ "		group by hashtag.hashtag_name " 
						+ "		order by cnt DESC "
						+ " 	) " 
						+ "where rownum<=5 ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myStateVo.getMember_id());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVo = new MyStatVO();
				resultVo.setRownum(rs.getString("rownum"));
				resultVo.setCnt(rs.getString("cnt"));
				resultVo.setHashtag_name(rs.getString("hashtag_name"));
				list.add(resultVo);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	
	
	
	//바차트 평균 날짜
		public MyStatVO selectBarDay(MyStatVO myStateVo) {
			MyStatVO resultVo = null;
			ResultSet rs = null;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select to_char(min(solve_date),'yyyy-mm-dd') minday, to_char(max(solve_date),'yyyy-mm-dd') maxday "
							+ "from solve where member_id=? and solve_type_cd in ( '1과목', '2과목', '3과목', '4과목', '5과목')";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, myStateVo.getMember_id());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					resultVo = new MyStatVO();
					resultVo.setMinday(rs.getString("minday"));
					resultVo.setMaxday(rs.getString("maxday"));
				} else {
					//System.out.println("Teacher ID no data");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return resultVo;
		} //selectBarDay
	
	
	//파이차트 평균 날짜
		public MyStatVO selectPieDay(MyStatVO myStateVo) {
			MyStatVO resultVo = null;
			ResultSet rs = null;
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select to_char(min(solve_date),'yyyy-mm-dd') minday, to_char(max(solve_date),'yyyy-mm-dd') maxday "
							+ "from solve where member_id=? and solve_type_cd like '%#%'";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, myStateVo.getMember_id());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					resultVo = new MyStatVO();
					resultVo.setMinday(rs.getString("minday"));
					resultVo.setMaxday(rs.getString("maxday"));
				} else {
					//System.out.println("Teacher ID no data");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return resultVo;
		} //selectPieDay	
		
		
	
}

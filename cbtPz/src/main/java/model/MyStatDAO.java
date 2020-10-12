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
			String sql = "select PAPERHEAD.PAPER_TYPE_CD , to_char(SOLVE_DATE, 'yyyy-mm-dd') as day, "
						+ "round(avg(nvl( case when paper_type_cd = '기출' then  solve_score else null end ,0)),0) as avg1, "
						+ "round(avg(nvl( case when paper_type_cd = '모의' then  solve_score else null end ,0)),0) as avg2 "
						+ "from solve , PAPERHEAD " 
						+ "where PAPERHEAD.PAPERHEAD_ID = solve.SOLVE_TYPE_CD " 
						+ "AND solve_date >= trunc(sysdate)-7 " 
						+ "AND solve.MEMBER_ID= ? " 
						+ "group by PAPERHEAD.PAPER_TYPE_CD, to_char(SOLVE_DATE, 'yyyy-mm-dd') " 
						+ "order by PAPERHEAD.PAPER_TYPE_CD, day";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myStateVo.getMember_id());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVo = new MyStatVO();
				resultVo.setPaper_type_cd(rs.getString("paper_type_cd"));
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
				resultVo.setSubject1("subject1");
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
						+ "		where member_id='hi' and solve_type_cd in ( '1과목', '2과목', '3과목', '4과목', '5과목') " 
						+ "		group by SOLVE_TYPE_CD " 
						+ "		order by SOLVE_TYPE_CD)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myStateVo.getMember_id());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				resultVo = new MyStatVO();
				resultVo.setAvg("avg");
				resultVo.setSolve_type_cd("solve_type_cd");
				list.add(resultVo);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	
	
}

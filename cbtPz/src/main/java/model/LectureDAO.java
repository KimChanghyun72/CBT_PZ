package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import common.ConnectionManager;

public class LectureDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	// 싱글톤
	static LectureDAO instance;
	
	public static LectureDAO getInstance() {
		if (instance == null)
			instance = new LectureDAO();
		return instance;
	}
	
	//
	public LectureVO selectOne(LectureVO lectureVO) {
		LectureVO resultVO = new LectureVO();
		ResultSet rs = null;
		
		try {
			conn = ConnectionManager.getConnnect();

			String sql = "SELECT LECTURE_ID, teacher_id, LECTURE_NAME, LECTURE_INFO, LECTURE_LINK, LECTURE_IMAGE, "
						+ " LECTURE_LEVEL, subject_name(lecture_subject) LECTURE_SUBJECT"
					+ " FROM LECTURE WHERE lecture_id = ?"; // sql문 + 앞에 " " 공백

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, lectureVO.getLecture_id());
			rs = pstmt.executeQuery();
			
			if(rs.next()) { //list니까 while문 사용
				resultVO.setLecture_id(rs.getString("lecture_id"));
				resultVO.setTeacher_id(rs.getString("teacher_id"));
				resultVO.setLecture_name(rs.getString("lecture_name"));
				resultVO.setLecture_info(rs.getString("lecture_info"));
				resultVO.setLecture_link(rs.getString("lecture_link"));
				resultVO.setLecture_image(rs.getString("lecture_image"));
				resultVO.setLecture_level(rs.getString("lecture_level"));
				resultVO.setLecture_subject(rs.getString("lecture_subject"));
				
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVO;  //담은 list를 리턴.
	}
	
	public int insert(LectureVO lectureVO) {
		int r = 0;
		try {
			// 1.DB 연결
			conn = ConnectionManager.getConnnect();

			// 2.sql 구문 실행
			String sql = "insert into lecture (lecture_id, lecture_name, lecture_info, lecture_link, lecture_image, teacher_id, lecture_subject)"
					+ "values (lecture_seq.nextval, ?, ?, ?, ?, ?, ?)";
			// 			String sql = "insert into lecture (lecture_id, lecture_name, lecture_info, lecture_link, lecture_image, teacher_id)"
			// + "values (lecture_seq.nextval, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lectureVO.getLecture_name());
			pstmt.setString(2, lectureVO.getLecture_info());
			pstmt.setString(3, lectureVO.getLecture_link());
			pstmt.setString(4, lectureVO.getLecture_image());
			pstmt.setString(5, lectureVO.getTeacher_id());
			pstmt.setString(6, lectureVO.getLecture_subject());
			// create sequence lecture_seq;
			// 


			r = pstmt.executeUpdate();

			// 3.결과 처리
			if (r == 1) {
				System.out.println(r + "건이 처리됨");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 4. 연결 해제
			ConnectionManager.close(conn);
		}
		return r;
	} 
	
	//전체조회
		public ArrayList<LectureVO> selectAll(LectureVO lectureVO) {
			
			LectureVO resultVO = null;
			ResultSet rs = null;
			
			ArrayList<LectureVO> list = new ArrayList<LectureVO>();
			try {
				conn = ConnectionManager.getConnnect();


				String sql = "SELECT lecture_on, lecture.LECTURE_ID, teacher_id, LECTURE_NAME, LECTURE_INFO, LECTURE_LINK, LECTURE_IMAGE,"
						+ " LECTURE_LEVEL, LECTURE_SUBJECT, nvl(lec_cnt.cnts2,0) as cnts"
					+ " FROM LECTURE, (select  lecture_id, count(learn_id)  as cnts2 from learn group by lecture_id) lec_cnt"
					+ " WHERE lecture_on = 'Y'"
					+ " and lecture.lecture_id = lec_cnt.lecture_id(+)"
					+ " and teacher_id = ?"
					+ " order by lecture.lecture_name"; // sql문 + 앞에 " " 공백
				

	
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, lectureVO.getTeacher_id());
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) { //list니까 while문 사용
					resultVO = new LectureVO();
					resultVO.setLecture_id(rs.getString("lecture_id"));
					resultVO.setTeacher_id(rs.getString("teacher_id"));
					resultVO.setLecture_name(rs.getString("lecture_name"));
					resultVO.setLecture_info(rs.getString("lecture_info"));
					resultVO.setLecture_link(rs.getString("lecture_link"));
					resultVO.setLecture_image(rs.getString("lecture_image"));
					resultVO.setLecture_level(rs.getString("lecture_level"));
					resultVO.setLecture_subject(rs.getString("lecture_subject"));
					resultVO.setCnts(rs.getString("cnts"));

					resultVO.setLecture_on(rs.getString("lecture_on"));

					list.add(resultVO); //resultVo를 list에 담음
				} 
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return list;  //담은 list를 리턴.
		} //selectAll
	
	//단건조회
/*	public LectureVO selectOne(LectureVO lectureVO) {
		LectureVO resultVO = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT LECTURE_ID, TEACHER_NUM, LECTURE_NAME, LECTURE_INFO, LECTURE_LINK, LECTURE_IMAGE,"
					+ "LECTURE_LEVEL, LECTURE_SUBJECT"
					+ "WHERE TEACHER_NUM FROM LECTURE";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lectureVO.getTeacher_num());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultVO = new LectureVO();
				resultVO.setLecture_id(rs.getString("lecture_id"));
				resultVO.setTeacher_num(rs.getString("teacher_num"));
				resultVO.setLecture_name(rs.getString("lecture_name"));
				resultVO.setLecture_info(rs.getString("lecture_info"));
				resultVO.setLecture_link(rs.getString("lecture_link"));
				resultVO.setLecture_image(rs.getString("lecture_image"));
				resultVO.setLecture_level(rs.getString("lecture_level"));
				resultVO.setLecture_subject(rs.getString("lecture_subject"));
			} else {
				System.out.println("no data");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVO;
	}
*/
		
		public int lectureDeleteB(LectureVO lectureVO) {
			int r =0;
			try {
				conn = ConnectionManager.getConnnect();
				
				String sql = "update lecture set lecture_link = null, lecture_on = 'N', lecture_n_date = sysdate where TEACHER_ID = ? and LECTURE_ID = ?"; 
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, lectureVO.getTeacher_id());
				pstmt.setString(2, lectureVO.getLecture_id());		
						
				r = pstmt.executeUpdate();

				// 3. 결과 처리
				if (r == 1) {
					System.out.println(r + "건이 처리됨");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(conn);
			}
			return r;
		} // 강사 강의 삭제전처리 (완전삭제는 스케줄)
		
		
		
		
		
		
		
		
		
		//민영
		//강의페이지 subject 카테 추출
		public ArrayList<String> selectCateDISTINCT(){
			ResultSet rs = null;
			ArrayList<String> list = new ArrayList<String>();
			try {
				conn = ConnectionManager.getConnnect();
				String sql = "select DISTINCT subject_name(lecture_subject) lecture_subject from lecture order by 1";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) { //list니까 while문 사용
					list.add(rs.getString("lecture_subject"));
				} 
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return list;
		}
		
		
		
		//강의페이지 강의전체리스트
		/*
		 * // public ArrayList<LectureVO> selectLectureAll(){ // LectureVO resultVO =
		 * null; // ResultSet rs = null; // ArrayList<LectureVO> list = new
		 * ArrayList<LectureVO>(); // try { // conn = ConnectionManager.getConnnect();
		 * // String sql =
		 * "SELECT LECTURE_ID, LECTURE_NAME, LECTURE_INFO, LECTURE_LINK, LECTURE_IMAGE,"
		 * // + " LECTURE_LEVEL, LECTURE_SUBJECT, teacher_name" // +
		 * " FROM LECTURE, teacher_member" // +
		 * " WHERE lecture.teacher_id = teacher_member.teacher_id" // +
		 * " ORDER BY LECTURE_ID"; // pstmt = conn.prepareStatement(sql); // rs =
		 * pstmt.executeQuery(); // while(rs.next()) { //list니까 while문 사용 // resultVO =
		 * new LectureVO(); // resultVO.setLecture_id(rs.getString("lecture_id")); //
		 * resultVO.setTeacher_name(rs.getString("teacher_name")); //
		 * resultVO.setLecture_name(rs.getString("lecture_name")); //
		 * resultVO.setLecture_info(rs.getString("lecture_info")); //
		 * resultVO.setLecture_link(rs.getString("lecture_link")); //
		 * resultVO.setLecture_image(rs.getString("lecture_image")); //
		 * resultVO.setLecture_level(rs.getString("lecture_level")); //
		 * resultVO.setLecture_subject(rs.getString("lecture_subject")); //
		 * list.add(resultVO); //resultVo를 list에 담음 // } // } catch (Exception e) { //
		 * e.printStackTrace(); // } finally { // ConnectionManager.close(rs, pstmt,
		 * conn); // } // return list; //담은 list를 리턴. // }//selectAll
		 */		
		
		//강의페이지 강의전체리스트
			public ArrayList<LectureVO> selectLectureAll(LearnVO learnVO){
				LectureVO resultVO = null;
				ResultSet rs = null;
				ArrayList<LectureVO> list = new ArrayList<LectureVO>();
				try {
					conn = ConnectionManager.getConnnect();
					String where ="";
					if(learnVO.getMember_id() != null) {
						where += ", nvl((SELECT 1 from learn where lecture_id = LECTURE.lecture_id  AND member_id = ? ),0) lecture_yn";		
					} else {
						where += ", 0 lecture_yn ";
					}
					String sql = "SELECT LECTURE_ON, LECTURE.LECTURE_ID, LECTURE_NAME, LECTURE_INFO, LECTURE_LINK, LECTURE_IMAGE,"
								+ " LECTURE_LEVEL, subject_name(lecture_subject) LECTURE_SUBJECT, teacher_name, nvl(lec_cnt.cnts2,0) as cnts "
								+ where
								+ " FROM LECTURE, teacher_member, (select  lecture_id, count(learn_id) as cnts2 from learn group by lecture_id) lec_cnt"
								+ " WHERE lecture.teacher_id = teacher_member.teacher_id"
								+ " AND LECTURE.LECTURE_ID = LEC_CNT.LECTURE_ID(+)"
								+ " ORDER BY LECTURE_NAME"
								+ "";
					pstmt = conn.prepareStatement(sql);
					if(learnVO.getMember_id() != null) {
						pstmt.setString(1, learnVO.getMember_id());
					}
					rs = pstmt.executeQuery();
					while(rs.next()) { //list니까 while문 사용
						resultVO = new LectureVO();
						resultVO.setLecture_id(rs.getString("lecture_id"));
						resultVO.setTeacher_name(rs.getString("teacher_name"));
						resultVO.setLecture_name(rs.getString("lecture_name"));
						resultVO.setLecture_info(rs.getString("lecture_info"));
						resultVO.setLecture_link(rs.getString("lecture_link"));
						resultVO.setLecture_image(rs.getString("lecture_image"));
						resultVO.setLecture_level(rs.getString("lecture_level"));
						resultVO.setLecture_subject(rs.getString("lecture_subject"));
						resultVO.setLecture_yn(rs.getString("lecture_yn"));
						resultVO.setLecture_on(rs.getString("lecture_on"));
						resultVO.setCnts(rs.getString("cnts"));
						list.add(resultVO); //resultVo를 list에 담음
					} 
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					ConnectionManager.close(rs, pstmt, conn);
				}
				return list;  //담은 list를 리턴.
			}//selectAl
		
		
		
		
		
		
		//강의 카테별 조회
			public ArrayList<LectureVO> selectCate(LectureVO lectureVO){
				LectureVO resultVO = null;
				ResultSet rs = null;
				ArrayList<LectureVO> list = new ArrayList<LectureVO>();
				try {
					conn = ConnectionManager.getConnnect();
					String where ="";
					if(lectureVO.getMember_id() != null) {
						where += ", nvl((SELECT 1 from learn where lecture_id = LECTURE.lecture_id  AND member_id = ? ),0) lecture_yn";		
					} else {
						where += ", 0 lecture_yn ";
					}
					String sql = "SELECT LECTURE_ON, LECTURE.LECTURE_ID, LECTURE_NAME, LECTURE_INFO, LECTURE_LINK, LECTURE_IMAGE,"
								+ " LECTURE_LEVEL, subject_name(lecture_subject) LECTURE_SUBJECT, teacher_name, nvl(lec_cnt.cnts2,0) as cnts"
								+ where
								+ " FROM LECTURE, teacher_member, (select lecture_id, count(learn_id) as cnts2 from learn group by lecture_id) lec_cnt"
								+ " WHERE lecture.teacher_id = teacher_member.teacher_id"
								+ " AND lecture.lecture_id = lec_cnt.lecture_id(+)"
								+ " AND LECTURE.LECTURE_SUBJECT = ?"
								+ " ORDER BY LECTURE_NAME"; 
					pstmt = conn.prepareStatement(sql);
					if(lectureVO.getMember_id() != null) {
						pstmt.setString(1, lectureVO.getMember_id());
						pstmt.setString(2, lectureVO.getLecture_subject());
					}else {
						pstmt.setString(1, lectureVO.getLecture_subject());
					}
					rs = pstmt.executeQuery();
					while(rs.next()) { //list니까 while문 사용
						resultVO = new LectureVO();
						resultVO.setLecture_id(rs.getString("lecture_id"));
						resultVO.setTeacher_name(rs.getString("teacher_name"));
						resultVO.setLecture_name(rs.getString("lecture_name"));
						resultVO.setLecture_info(rs.getString("lecture_info"));
						resultVO.setLecture_link(rs.getString("lecture_link"));
						resultVO.setLecture_image(rs.getString("lecture_image"));
						resultVO.setLecture_level(rs.getString("lecture_level"));
						resultVO.setLecture_subject(rs.getString("lecture_subject"));
						resultVO.setLecture_yn(rs.getString("lecture_yn"));
						resultVO.setCnts(rs.getString("cnts"));
						list.add(resultVO);
					} 
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					ConnectionManager.close(rs, pstmt, conn);
				}
				return list;  //담은 list를 리턴.
			}//selectCate
		
		
		//강의 조회
			public ArrayList<LectureVO> selectLecSearch(LectureVO lectureVO){
				LectureVO resultVO = null;
				ResultSet rs = null;
				ArrayList<LectureVO> list = new ArrayList<LectureVO>();
				try {
					conn = ConnectionManager.getConnnect();
					String where ="";
					if(lectureVO.getMember_id() != null) {
						where += ", nvl((SELECT 1 from learn where lecture_id = LECTURE.lecture_id  AND member_id = ? ),0) lecture_yn";		
					} else {
						where += ", 0 lecture_yn ";
					}
					String sql = "SELECT lecture_on, lecture.LECTURE_ID, LECTURE_NAME, LECTURE_INFO, LECTURE_LINK, LECTURE_IMAGE,"
								+ " LECTURE_LEVEL, substr(subject_name(lecture_subject), 0,1 ) lecture_subject, teacher_name, nvl(lec_cnt.cnts2,0) as cnts"
								+ where
								+ " FROM LECTURE, teacher_member, (select lecture_id, count(learn_id) as cnts2 from learn group by lecture_id) lec_cnt"
								+ " WHERE lecture.teacher_id = teacher_member.teacher_id"
								+ " AND lecture.lecture_id = lec_cnt.lecture_id(+)"
								+ " AND LECTURE.LECTURE_NAME LIKE '%'||?||'%'"
								+ " ORDER BY LECTURE_NAME"; 
					//System.out.println(sql);
					pstmt = conn.prepareStatement(sql);
					if(lectureVO.getMember_id() != null) {
						pstmt.setString(1, lectureVO.getMember_id());
						pstmt.setString(2, lectureVO.getLecture_name());
					}else {
						pstmt.setString(1, lectureVO.getLecture_name());
					}
					rs = pstmt.executeQuery();
					while(rs.next()) { //list니까 while문 사용
						resultVO = new LectureVO();
						resultVO.setLecture_id(rs.getString("lecture_id"));
						resultVO.setTeacher_name(rs.getString("teacher_name"));
						resultVO.setLecture_name(rs.getString("lecture_name"));
						resultVO.setLecture_info(rs.getString("lecture_info"));
						resultVO.setLecture_link(rs.getString("lecture_link"));
						resultVO.setLecture_image(rs.getString("lecture_image"));
						resultVO.setLecture_level(rs.getString("lecture_level"));
						resultVO.setLecture_on(rs.getString("lecture_on"));
						resultVO.setLecture_subject(rs.getString("lecture_subject"));
						resultVO.setLecture_yn(rs.getString("lecture_yn"));
						resultVO.setCnts(rs.getString("cnts"));
						list.add(resultVO);
					} 
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					ConnectionManager.close(rs, pstmt, conn);
				}
				return list;  //담은 list를 리턴.
			}//selectLecSearch	
			
		
}

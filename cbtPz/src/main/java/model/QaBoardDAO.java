package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.ConnectionManager;

public class QaBoardDAO {

	Connection conn;
	PreparedStatement pstmt;

	//###인스턴스###
	static QaBoardDAO instance;
	public static QaBoardDAO getInstance() {
	
		if (instance == null) {
			instance = new QaBoardDAO();
		}
		return instance;

	}//###인스턴스###
	
	
	
		//###전체 조회###
		public ArrayList<QaBoardVO> selectAll(QaBoardVO qaboardVo){
			
			QaBoardVO resultVO = null;
			ResultSet rs = null;
			
			ArrayList<QaBoardVO> list = new ArrayList<QaBoardVO>();
			try {
				
				conn = ConnectionManager.getConnnect();
				String where =" where 1 = 1";
				
				if(qaboardVo.getQaboard_title() != null) {
					where += " and title like '%' || ? || '%'";
				}
				String sql = "select a.* from(select rownum rn,b.* from( "
						+ " SELECT QABOARD.QABOARD_ID,QABOARD.QABOARD_TITLE,QABOARD.QABOARD_CONTENTS,QABOARD.QABOARD_DATE,QABOARD.QABOARD_ANS,QABOARD.QABOARD_VIEWS,QABOARD.QABOARD_TYPE_CD,QABOARD.MEMBER_ID,"
						+ " (case when sysdate - qaboard_date<0.007 then 1 else 0 end) isNew,cnts.cnt"
						+ " FROM QABOARD ,(select qaboard_id id,Count(QABOARD_ANS) cnt from qaboard"
						+ " GROUP BY QABOARD_ID)cnts"
						+ where
						+ " AND QABOARD.QABOARD_ID = cnts.id(+)"
						+ " ORDER BY TO_NUMBER(QABOARD.QABOARD_ID) DESC"
						+ " )b ) a where rn between ? and ?";		
			pstmt = conn.prepareStatement(sql);
			int pos = 1;
			if(qaboardVo.getQaboard_title() != null) {
				pstmt.setString(pos++, qaboardVo.getQaboard_title());
			}
			pstmt.setInt(pos++, qaboardVo.getFirst());
			pstmt.setInt(pos++, qaboardVo.getLast());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				resultVO = new QaBoardVO();
				resultVO.setQaboard_id(rs.getInt(2));
				resultVO.setQaboard_title(rs.getString(3));
				resultVO.setQaboard_contents(rs.getString(4));
				resultVO.setQaboard_date(rs.getString(5));
				resultVO.setQaboard_ans(rs.getString(6));
				resultVO.setQaboard_views(rs.getInt(7));
				resultVO.setQaboard_type_cd(rs.getString(8));
				resultVO.setMember_id(rs.getString(9));
				resultVO.setIsNew(rs.getString(10));
				resultVO.setCnt(rs.getInt(11));
				list.add(resultVO);
				
			}
			}catch(Exception e){	
				e.printStackTrace();	
			}finally{	
				ConnectionManager.close(rs, pstmt, conn); 
			} 
			
			return list;
	 
		}//###전체 조회###
		
		
		//###단건 조회###
		public QaBoardVO selectOne(QaBoardVO qaboardVo) {
			
			QaBoardVO resultVO = null;
			ResultSet rs = null;
			
			try {
				
				conn = ConnectionManager.getConnnect();
				String sql = "SELECT QABOARD_ID,QABOARD_TITLE,QABOARD_CONTENTS,QABOARD_DATE,QABOARD_ANS,QABOARD_VIEWS,QABOARD_TYPE_CD,MEMBER_ID FROM QABOARD WHERE QABOARD_ID = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, qaboardVo.getQaboard_id());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					resultVO = new QaBoardVO();
					resultVO.setQaboard_id(rs.getInt("qaboard_id"));
					resultVO.setQaboard_title(rs.getString("qaboard_title"));
					resultVO.setQaboard_contents(rs.getString("qaboard_contents"));
					resultVO.setQaboard_date(rs.getString("qaboard_date"));
					resultVO.setQaboard_ans(rs.getString("qaboard_ans"));
					resultVO.setQaboard_views(rs.getInt("qaboard_views"));
					resultVO.setQaboard_type_cd(rs.getString("qaboard_type_cd"));
					resultVO.setMember_id(rs.getString("member_id"));
					
				}	
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				ConnectionManager.close(rs,pstmt,conn);
			}
			return resultVO;
		}//###단건 조회###
		
		
		//###입력###
		public QaBoardVO insert(QaBoardVO qaboardVo) {
			CallableStatement cstmt = null;
			try {
				conn = ConnectionManager.getConnnect();
				
				cstmt = conn.prepareCall("{call qaboard_ins(?,?,?,?)}");			
				cstmt.setString(1, qaboardVo.getQaboard_title());
				cstmt.setString(2, qaboardVo.getQaboard_contents());
				cstmt.setString(3, qaboardVo.getQaboard_type_cd());
				cstmt.setString(4, qaboardVo.getMember_id());
				cstmt.executeUpdate();
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionManager.close(null,pstmt,conn);
			}
			return qaboardVo;
		}//###입력###
		
		
		//###삭제###
		public void delete(QaBoardVO qaboardVo) {
			CallableStatement cstmt = null;
			conn = ConnectionManager.getConnnect();
			try {
			
				cstmt = conn.prepareCall("{call qaboard_del(?)}");
				cstmt.setInt(1, qaboardVo.getQaboard_id());
				cstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionManager.close(null,pstmt,conn);
			}
		}//###삭제###
		
		
		//###수정###
		public void update(QaBoardVO qaboardVo) {
				CallableStatement cstmt = null;
				conn = ConnectionManager.getConnnect();
			try {
				cstmt = conn.prepareCall("{call qaboard_upd(?,?,?,?)}");
				cstmt.setInt(1, qaboardVo.getQaboard_id());
				cstmt.setString(2, qaboardVo.getQaboard_title());
				cstmt.setString(3, qaboardVo.getQaboard_contents());
				cstmt.setString(4, qaboardVo.getMember_id());
				cstmt.executeUpdate();
				

			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionManager.close(null, pstmt, conn);
			}
		}//###수정###
		//###페이징 카운터###
				public int count(QaBoardVO qaboardVO) {
					int cnt = 0;
					try {
						conn = ConnectionManager.getConnnect();
						String where =" where 1 = 1";
						if(qaboardVO.getQaboard_title() != null) {
							where += " and TITLE like '%' || ? || '%'";
						}
						String sql = "select count(*) from qaboard" + where;
						pstmt = conn.prepareStatement(sql);
						int pos = 1;
						if(qaboardVO.getQaboard_title() != null) {
							pstmt.setString(pos++, qaboardVO.getQaboard_title());
						}
						
						ResultSet rs = pstmt.executeQuery();
						rs.next();
						cnt = rs.getInt(1);
					}catch(Exception e) {
						e.printStackTrace();
					}finally {
						ConnectionManager.close(conn);
					}
					return cnt;
				}
				//###페이징 카운터###
				//###조회수 카운터###
				public void updateQaboardCnt(QaBoardVO vo) {
					
					System.out.println("jdbc기능처리");
					try {
						conn = ConnectionManager.getConnnect();
						String sql ="UPDATE QABOARD SET QABOARD_VIEWS = QABOARD_VIEWS + 1 WHERE QABOARD_ID = ? ";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, vo.getQaboard_id());
						pstmt.executeUpdate();
					}catch(Exception e){
						e.printStackTrace();
					}finally {
						ConnectionManager.close(conn);
				}
				
			}//###조회수 카운터 ###
				
				//###답글 달기 ###
				public void replyawser(QaBoardVO qaboardVo) {
					
					try {
						conn = ConnectionManager.getConnnect();
						String sql = "UPDATE QABOARD SET QABOARD_ANS= ? WHERE QABOARD_ID=?";
						pstmt = conn.prepareStatement(sql);
						
						
						pstmt.setString(1, qaboardVo.getQaboard_ans());
						pstmt.setInt(2, qaboardVo.getQaboard_id());
						pstmt.executeUpdate();
						
						
						
					}catch(Exception e) {
						e.printStackTrace();
					}finally {
						ConnectionManager.close(null, pstmt, conn);
					}
				}//###답글 달기 ###
				
				//###답글 조회 ###
				public ArrayList<QaBoardVO> replyselectAll(QaBoardVO qaboardVO){
					
					QaBoardVO resultVO = null;
					ResultSet rs = null;
					
					ArrayList<QaBoardVO> list = new ArrayList<QaBoardVO>();
					try {
						
						conn = ConnectionManager.getConnnect();
						String sql = "SELECT QABOARD_ANS FROM QABOARD "
										+ "WHERE QABOARD_ID = ?";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, qaboardVO.getQaboard_id());
					rs = pstmt.executeQuery();
					while(rs.next()) {
						
						resultVO = new QaBoardVO();
						resultVO.setQaboard_ans(rs.getString(1));
						
						list.add(resultVO);
						
					}		
					}catch(Exception e){		
						e.printStackTrace();			
					}finally{		
						ConnectionManager.close(rs, pstmt, conn); 
					} 		
					return list;
					}//###답글 조회 ###
				
				
				
}


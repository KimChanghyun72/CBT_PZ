package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.ConnectionManager;

public class PayDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	
	static PayDAO instance;
	public static PayDAO getInstance() {
	
		if (instance == null) {
			instance = new PayDAO();
		}
		return instance;

	}//###인스턴스###
	
	//###입력###
			public int insert(PayVO payVo) {
				int r = 0;
				try {
					conn = ConnectionManager.getConnnect();
					
					String sql = "INSERT INTO PAY (PAY_ID, PAY_TYPE, PAY_DATE, PAY_PRICE, MEMBER_ID)"
							+ " VALUES(pay_seq.nextval,?, sysdate ,?,?)";
					
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, payVo.getPay_type());
					pstmt.setInt(2, payVo.getPay_price());
					pstmt.setString(3, payVo.getMember_id());
					r = pstmt.executeUpdate();
					System.out.println("결제 1건이 결제되었습니다.");
				
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					ConnectionManager.close(null,pstmt,conn);
				}
				
				return r;
			}//###입력###
			

}

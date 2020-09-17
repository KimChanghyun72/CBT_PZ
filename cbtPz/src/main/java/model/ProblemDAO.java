package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class ProblemDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//싱글톤
	static ProblemDAO instance;
	public static ProblemDAO getInstance() {
		if(instance==null)
		   instance=new ProblemDAO();
		return instance;
	}
	
	
	
	
	
}

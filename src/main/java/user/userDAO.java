package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String root = "c0lva891yr5paott84jb";
	private String password = System.getenv("DB_PASSWORD");
	private String url = "jdbc:mysql://aws.connect.psdb.cloud/anything?sslMode=VERIFY_IDENTITY";
	private String driver = "com.mysql.cj.jdbc.Driver";
	
	public userDAO() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	public void conn() {
		try {
			con = DriverManager.getConnection(url, root, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int insertUS(userBean ub) {
		conn();
		
		int dup = 0;
		try {
			conn();
			String dupname = "select * from user where name = ? ";
			String dupid = "select * from user where id = ? ";
			pstmt = con.prepareStatement(dupid);
			
			pstmt.setString(1, ub.getId());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dup = 1;
			}
			pstmt = con.prepareStatement(dupname);
			
			pstmt.setString(1, ub.getName());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dup = 2;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}	
		if (dup == 0) {
			try {
				conn();
				
				String sql = "insert into user (name,gender,id,password,email,logtime) values (?,?,?,?,?,DATE_ADD(NOW(), INTERVAL 9 HOUR))";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, ub.getName());
				pstmt.setString(2, ub.getGender());
				pstmt.setString(3, ub.getId());
				pstmt.setString(4, ub.getPass());
				pstmt.setString(5, ub.getEmail());
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null) pstmt.close();
					if (con != null) con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		return dup;
	}
	public userBean loginUS(String id) {
		conn();
		
		userBean ub = new userBean();
		
		String sql = "select name,gender,id,password,email from user where id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ub.setName(rs.getString(1));
				ub.setGender(rs.getString(2));
				ub.setId(rs.getString(3));
				ub.setPass(rs.getString(4));
				ub.setEmail(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ub;
	}
}

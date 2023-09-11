package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class projectDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String root = "w7vhrm4xafn7o6696ll0";
	private String password = "pscale_pw_PLhM3Xkaa5QE5Od50NQjXdnaL5f3Z47v77yhcUTICdP";
	private String url = "jdbc:mysql://aws.connect.psdb.cloud/anything?sslMode=VERIFY_IDENTITY";
	private String driver = "com.mysql.cj.jdbc.Driver";
	
	public projectDAO() {
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
	public void insertPR(projectBean pb) {
		String sql = "insert into project (writer,url,thumb,title,content,logtime,count)"+
		"values (?,?,?,?,?,DATE_ADD(NOW(), INTERVAL 9 HOUR),0)";
		
		try {
			conn();
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,pb.getWriter());
			pstmt.setString(2,pb.getUrl());
			pstmt.setString(3,pb.getThumb());
			pstmt.setString(4,pb.getTitle());
			pstmt.setString(5,pb.getContent());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	public ArrayList<projectBean> selectPR() {
		ArrayList<projectBean> arpb = new ArrayList<projectBean>();
		
		String sql = "select num,thumb,title,writer,content from project order by num desc";
		
		try {
			conn();
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				projectBean pb = new projectBean();
				pb.setNum(rs.getInt(1));
				pb.setThumb(rs.getString(2));
				pb.setTitle(rs.getString(3));
				pb.setWriter(rs.getString(4));
				pb.setContent(rs.getString(5));
				
				arpb.add(pb);
			}
		} catch (Exception e) {
			
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return arpb;
	}
	public projectBean readPR(String num,int n) {
		projectBean pb = new projectBean();
		
		String count = "update project set count = count+1 where num = ?";
		
		String sql = "select * from project where num = ?";
		
		try {
			conn();
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				pb.setNum(rs.getInt(1));
				pb.setWriter(rs.getString(2));
				pb.setUrl(rs.getString(3));
				pb.setThumb(rs.getString(4));
				pb.setTitle(rs.getString(5));
				pb.setContent(rs.getString(6));
				pb.setLogtime(rs.getString(7));
				pb.setCount(rs.getInt(8));
			}
			if (n == 1) {
			pstmt = con.prepareStatement(count);
			
			pstmt.setString(1,num);
			
			pstmt.executeUpdate();
			}
		} catch (Exception e) {
			
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return pb;
	}
	public int modifyPR(projectBean pb) {
		int check = 0;
		try {
			conn();
			String checksql = "select writer from project where num = ? ";
			pstmt = con.prepareStatement(checksql);
			
			pstmt.setInt(1, pb.getNum());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString(1).equals(pb.getWriter()) || pb.getWriter().equals("admin")) {
					check = 1;
				}
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
		
		if (check == 1) {
			String sql = "update project set title = ? ,content = ?, url = ?, thumb = ? where num = ?";
			
			try {
				conn();
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, pb.getTitle());
				pstmt.setString(2, pb.getContent());
				pstmt.setString(3, pb.getUrl());
				pstmt.setString(4, pb.getThumb());
				pstmt.setInt(5, pb.getNum());
				
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
		return check;
	}
	public int dropPR(String num,String name) {
		int check = 0;
		try {
			conn();
			String checksql = "select writer from project where num = ? ";
			pstmt = con.prepareStatement(checksql);
			
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString(1).equals(name) || name.equals("admin")) {
					check = 1;
				}
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
		if (check == 1) {
			try {
				conn();
				
				String sql = "delete from project where num = ? ";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, num);
				
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
		return check;
	}
}

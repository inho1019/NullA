package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class boardDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String root = "c0lva891yr5paott84jb";
	private String password = System.getenv("DB_PASSWORD");
	private String url = "jdbc:mysql://aws.connect.psdb.cloud/anything?sslMode=VERIFY_IDENTITY";
	private String driver = "com.mysql.cj.jdbc.Driver";
	
	public boardDAO() {
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
	public void insertBD(boardBean bb) {
		String sql = "insert into board (writer,title,content,logtime) "+
				" values (?,?,?,DATE_ADD(NOW(), INTERVAL 9 HOUR))";
		
		try {
			conn();
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bb.getWriter());
			pstmt.setString(2, bb.getTitle());
			pstmt.setString(3, bb.getContent());
			
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
	public ArrayList<boardBean> selectBD() {
		ArrayList<boardBean> arbb = new ArrayList<boardBean>();
		
		String sql = "select * from board order by logtime desc";
		
		try {
			conn();
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				boardBean bb = new boardBean();
				bb.setNum(rs.getInt(1));
				bb.setWriter(rs.getString(2));
				bb.setTitle(rs.getString(3));
				bb.setContent(rs.getString(4));
				bb.setLogtime(rs.getString(5));
				arbb.add(bb);
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
		return arbb;
	}
	public int updateBD(boardBean bb) {
		int check = 0;
		try {
			conn();
			String checksql = "select writer from board where num = ? ";
			pstmt = con.prepareStatement(checksql);
			
			pstmt.setInt(1, bb.getNum());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString(1).equals(bb.getWriter()) || bb.getWriter().equals("admin")) {
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
			String sql = "update board set title = ? ,content = ? where num = ?";
			
			try {
				conn();
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, bb.getTitle());
				pstmt.setString(2, bb.getContent());
				pstmt.setInt(3, bb.getNum());
				
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
	public int deleteBD(String num,String name) {
		int check = 0;
		try {
			conn();
			String checksql = "select writer from board where num = ? ";
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
				
				String sql = "delete from board where num = ? ";
				
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

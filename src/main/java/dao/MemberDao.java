package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.Member;


public class MemberDao {
	private static MemberDao dao = new MemberDao();
	private MemberDao() {};
	private static Connection conn;
	
	public static MemberDao getInstance() {
		MemberDao.getConnection();
		return dao;
	}
	
	public static void getConnection() {
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection
			("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Member selectForLogin(String id, String email) {
		String sql = "SELECT * FROM member WHERE id=? and email=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new Member(rs.getInt("memberno"),
						rs.getString("id"), rs.getString("email"),
						rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public ArrayList<Member> selectAll(){
		ArrayList<Member> list = new ArrayList<>();
		String sql = "SELECT * FROM member";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member member = new Member(rs.getInt("memberno"),
						rs.getString("id"), rs.getString("email"),
						rs.getString("name"));
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Member selectOne(int memberno) {
		Member member = null;
		String sql = "SELECT * FROM member WHERE memberno=?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql))
		{
			pstmt.setInt(1, memberno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new Member(rs.getInt("memberno"),
						rs.getString("id"), rs.getString("email"),
						rs.getString("name"));						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public Member insert(String id, String email, String name) {
		Member member = null;
		String sql = "INSERT INTO member(MEMBERNO, ID, EMAIL, NAME) "
				+ "VALUES(SEQ_member.nextval,?,?,?)";
		try (PreparedStatement pstmt = conn.prepareStatement(sql))
		{
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, name);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public int update(String id, String email, String name, int memberno) {
		String sql = "UPDATE member SET id=?, email=?, name=? WHERE memberno=?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, name);
			pstmt.setInt(4, memberno);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int delete(int memberno) {
		String sql = "DELETE FROM member WHERE memberno=?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, memberno);			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}

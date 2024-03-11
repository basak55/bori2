package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.Board;
import dto.Member;

public class BoardDao {
	private static BoardDao dao = new BoardDao();
	private BoardDao() {};
	private static Connection conn;
	
	public static BoardDao getInstance() {
		BoardDao.getConnection();
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
	
	public ArrayList<Board> selectAll(){
		ArrayList<Board> list = new ArrayList<>();
		String sql = "SELECT * FROM member m, board b WHERE m.memberno = b.memberno";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board(rs.getInt("num"), 
										rs.getString("title"),
										rs.getString("content"),
										rs.getString("regtime"),
										rs.getInt("hits"),
										rs.getInt("memberno"),
										rs.getString("id"));
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Board selectOne(int num) {
		Board board = null;
		String sql1 = "SELECT * FROM board b, member m WHERE m.memberno = b.memberno AND b.num=?";
		String sql2 = "UPDATE board SET hits = hits + 1 WHERE num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board(rs.getInt("num"),
									rs.getString("title"),
									rs.getString("content"),
									rs.getString("regtime"),
									rs.getInt("hits"),
									rs.getInt("memberno"),
									rs.getString("id"));
			}
			
			//히트수 늘리기
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, num);
			pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return board;
	}
	
	public ArrayList<Board> selectById(String id) {
		ArrayList<Board> list = new ArrayList<Board>();
		String sql = "SELECT *"+
				  "FROM board b JOIN member m USING (memberno)"+
				  "WHERE m.id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board(rs.getInt("num"), 
										rs.getString("title"),
										rs.getString("content"),
										rs.getString("regtime"),
										rs.getInt("hits"),
										rs.getInt("memberno"),
										rs.getString("id"));
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insert(String title, String content, String id) {
		String sql = "INSERT INTO board(NUM, TITLE, CONTENT, REGTIME, HITS, MEMBERNO)"+ 
				"VALUES(SEQ_board.nextval,?,?,sysdate,0,"+
				"(SELECT MEMBERNO FROM member WHERE id=?))";
		try (PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, id);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int delete(int num) {
		String sql = "DELETE FROM board WHERE num=?";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, num);			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public Board updateSelect(int num) {
		Board board = null;
		String sql1 = "SELECT * FROM board b, member m WHERE m.memberno = b.memberno AND b.num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board(rs.getInt("num"),
									rs.getString("title"),
									rs.getString("content"),
									rs.getString("regtime"),
									rs.getInt("hits"),
									rs.getInt("memberno"),
									rs.getString("id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return board;
	}
	
	public int update(int num, String title, String content) {
		String sql = "UPDATE board SET title=?, content=? WHERE num=?";
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql))
		{		
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, num);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public ArrayList<Board> selectForSearch(String title){
		ArrayList<Board> list = new ArrayList<>();
		String sql = "SELECT * FROM board b JOIN member m USING (memberno)"
					+ "WHERE title LIKE %?%";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board(rs.getInt("num"), 
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("regtime"),
						rs.getInt("hits"),
						rs.getInt("memberno"),
						rs.getString("id"));
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int selectCount() { //board 테이블의 총 건수를 리턴함
		String sql = "select count(*) from board";
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}

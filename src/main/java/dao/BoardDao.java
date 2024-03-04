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
	
	public ArrayList<Board> selectAll(){ //ID불러오기 질문
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
		String sql = "SELECT * FROM board b, member m WHERE m.memberno = b.memberno AND b.num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
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
	
	public int insert(String title, String content, String id) {
		String sql = "INSERT INTO board(NUM, TITLE, CONTENT, REGTIME, HITS, MEMBERNO)"+ 
				"VALUES(SEQ_board.nextval,?,?,sysdate,0,"+
				"(SELECT MEMBERNO FROM member WHERE id=?))";
		try (PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
}
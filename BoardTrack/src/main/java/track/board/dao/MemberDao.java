package track.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {
//	이메일 중복체크
	public boolean loginCheck(String id , int pw) {
		Connection conn = DBConnection.getConnection();
		int cnt = 0;
		String sql  = " select count(*) from simple_member where id = ? and pw = ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, pw);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return cnt == 1;
	}
	public void register(String id , int pw , String name) {
		Connection conn= DBConnection.getConnection();
		String sql = "insert into simple_member values(? , ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareCall(sql);
			pstmt.setString(1,id);
			pstmt.setInt(2, pw);
			pstmt.setString(3, name);
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}

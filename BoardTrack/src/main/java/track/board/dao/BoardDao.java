package track.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import track.board.dto.BoardDto;
import track.board.dto.BoardRDto;
import track.board.dto.ReplyDto;

public class BoardDao { //
	//메서드의 리턴타입 : BoardDto타입의 ArrayList
	public ArrayList<BoardRDto> getBoardListStartEnd(int startBno, int endBno) throws Exception{
		Connection conn = DBConnection.getConnection();
		ArrayList<BoardRDto> listBoard = new ArrayList<BoardRDto>();
		String sql = "select * "
				+ " from (select rownum rnum, b1.*  "
				+ " from (select b.*,(select count(*) from simple_reply r where b.bno = r.bno) reply_num from simple_board b order by b.bno desc) b1 ) b2"
				+ " where rnum>= ? and rnum<= ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startBno);
		pstmt.setInt(2, endBno);
		ResultSet rs = pstmt.executeQuery(); //select -- > executeQuery() , i , u , p  -- > executeUpdate()
		
		
		while(rs.next()) { //값이 있으면 true 
			int bno = rs.getInt("bno");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String writer = rs.getString("writer");
			String writedate = rs.getString("writedate");
			int replyNum = rs.getInt("reply_num");
			int hitcount = rs.getInt("hitcount");
			BoardRDto Rdto = new BoardRDto(bno,title,content,writer,writedate,replyNum,hitcount); //dto 안에 다 담겨있음
			listBoard.add(Rdto); //한 배열에 dto 객체안에 있는 것들 저장
		}
	
		return listBoard;
	}
	public BoardDto getBoardByBno(int pbno) {
		Connection conn= DBConnection.getConnection();
		
		String sql = "SELECT * FROM SIMPLE_BOARD WHERE BNO = ?";
		BoardDto dto = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pbno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int bno = rs.getInt("bno");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				String writedate = rs.getString("writedate");
				int hitcount = rs.getInt("hitcount");
				dto = new BoardDto(bno,title,content,writer,writedate, hitcount);
			}
		}
			catch(Exception e) {
				e.printStackTrace();
			}
		return dto;
	}
	
	public int getLastpageNumber () throws SQLException {
		Connection conn = DBConnection.getConnection();
		String sql = "select count(*) total from simple_board";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		int totalNum = rs.getInt("total");
		return totalNum / 10 + ( totalNum % 10 != 0 ? 1 : 0); //이해하기. 총 페이지 수 리턴
		//게시글이 113개 일 때 12페이지가 나와야함  
		//11 + 1 이라는 값이 나옴
	}
	
	public void insertBoard(String title , String writer, String content)throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "INSERT INTO simple_board(bno,title,content,writer,writedate) VALUES(seq_bno.nextval,?,?,?,sysdate)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,title);
		pstmt.setString(2,content);
		pstmt.setString(3,writer);
		pstmt.executeUpdate();
	}
	
	public ArrayList<ReplyDto> getReplyListByBno(int pBno)  {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT * FROM SIMPLE_REPLY WHERE BNO = ? ORDER BY RNO DESC";
		ArrayList<ReplyDto> listRet = new ArrayList<ReplyDto>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pBno);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int rno = rs.getInt("rno");
				int bno = rs.getInt("bno");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				String writedate = rs.getString("writedate");
				ReplyDto dto = new ReplyDto(rno,bno,writer,content,writedate);
				listRet.add(dto);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return listRet;
	}
	public void insertReply(int bno , String writer , String content) {
		Connection conn = DBConnection.getConnection();
		String sql = "insert into simple_reply " 
				+ "values(seq_reply.nextval , ? , ? , ? ,sysdate)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, writer);
			pstmt.setString(3,content);
			pstmt.executeQuery();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void increaseHitcount(int bno) {
		Connection conn = DBConnection.getConnection();
		
		String sql = " UPDATE simple_board SET hitcount = hitcount + 1 where bno = ? " ;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
			pstmt.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteReply(int rno) {
		Connection conn = DBConnection.getConnection();
		String sql = "delete from simple_reply where rno = ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			pstmt.executeUpdate();
			pstmt.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		 
		
	}
}


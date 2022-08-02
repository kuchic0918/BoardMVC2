package track.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;

//
//체크 : 인스턴스 변수 , 클래스변수, 그림 위치 기억안나면 문자로 
//모든 JDBC 기능의 실행 할 때 Connection 객체로부터 시작함 .
//클래스메서드에서 인스턴스 변수에 접근 못함 !
//아래키워드에서 static 키워드 두 개 등장 이유.
public class DBConnection {
	private static Connection conn = null;
	//메서드 안에서 지역변수가 클래스변수 , 인스턴스변수보다 우선.
	public static Connection getConnection() { //필드
		//static 을 붙인이유 
		//별도의 객체생성 없이 DBConnection.getConnection()으로 쓰기위해
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "board_Track";
		String dbPw = "1234";
			
			
				 
			//Connection 접속 정보 객체
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url,dbId,dbPw);
			}catch (Exception e) {
				e.printStackTrace();
			}
			return conn;
	}
}

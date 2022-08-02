<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbId = "board_Track";
	String dbPw = "1234";
		
		Connection conn = null;
		
			
		//Connection 접속 정보 객체
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbId,dbPw);
			out.println("접속");
		}catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>
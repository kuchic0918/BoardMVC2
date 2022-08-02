<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "track.board.dao.*" %>
<!DOCTYPE html>
	<%
		BoardDao boarddao = new BoardDao();
				
	%>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성 중 . . .</title>
</head>
<body>
	<%
		//파라미터 받기전에 선언해야한다.
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		boarddao.insertBoard(title, writer, content);
		
		//파라미터로 받은 제목 내용 글쓴이를 가지고 
		//BoardDao 클래스에 있는 insertBoard 메소드에 파라미터를 넘겨
		//데이터 삽입
	%>
</body>
</html>
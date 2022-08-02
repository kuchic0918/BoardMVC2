<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "track.board.dao.*" %>
<%
	String id = request.getParameter("id");
	String pwStr = request.getParameter("pw");
	int pw = Integer.parseInt(pwStr);
	
	MemberDao mDao = new MemberDao();
	boolean result = mDao.loginCheck(id, pw);
	
	if(result) {
		session.setAttribute("loginId", id); //키 , 밸류 값으로 들억마
%>
		<script>	
			alert("로그인성공");
			location.href = "Module3_BoardListV3.jsp";
		</script>
<% 		
		
	}else {
		
%>
		<script>
			alert("로그인 실패 !");
			location.href = "Module3_Login.jsp";
		</script>
<% 		
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
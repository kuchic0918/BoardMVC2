<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		$("#btn_register").click(function(){
			location.href = "Module3_Register.jsp";
		});
	});
</script>
</head>
<body>
	<form action = "Module3_LoginAction.jsp" method = "post">
		ID : <input type = "text" name = "id"/><br/>
		PW : <input type = "password" name = "pw"/><br/>
		<input type = "submit" value = "로그인"/>
		<button type = "button" id = "btn_register">회원가입</button>
	</form>
</body>
</html>
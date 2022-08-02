<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "track.board.dao.*" %>
<%
	//Dao에서 회원가입 처리 
	//alert 가입 되었는지 확인 후 다시 로그인 창으로 location.href 이동
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	int pw = Integer.parseInt(request.getParameter("pw"));
	String name = request.getParameter("name");
	
	MemberDao mDao = new MemberDao();
	mDao.register(id,pw,name);
%>
<script>
	alert("로그인 ㄱㄱ");
	location.href = "Module3_Login.jsp";
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "track.board.dao.*" %>

<%
	if(session.getAttribute("loginId")==null) {
		response.sendRedirect("Module3_Login.jsp");
	}
	request.setCharacterEncoding("UTF-8");
	int bno = Integer.parseInt(request.getParameter("bno")); 
	String writer =(String)session.getAttribute("loginId");
	System.out.println(writer);
	String content  = request.getParameter("content");
	
	BoardDao bDao = new BoardDao();
	bDao.insertReply(bno,writer,content);
	
%>
<script>
	alert("댓글 등록 완료");
	location.href = "Module3_BoardDetail.jsp?bno=<%=bno%>";
</script>
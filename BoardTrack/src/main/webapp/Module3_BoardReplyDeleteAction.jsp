<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "track.board.dao.*" %>
    
<%
	if(session.getAttribute("loginId")==null) { //로그인 여부 확인 
		response.sendRedirect("Module3_Login.jsp");
	}  
	if(request.getParameter("rno")==null || request.getParameter("bno")==null) {
		
%>
		<script>
			alert("잘못된 접근입니다.");
			location.href = "Module3_Board ListV3.jsp";
		</script>
<% 
	}
	int rno = Integer.parseInt(request.getParameter("rno"));
	int bno = Integer.parseInt(request.getParameter("bno"));
	BoardDao bDao = new BoardDao();
	bDao.deleteReply(rno);
%>
<script>
	alert("삭제되었습니다.");
	location.href = "Module3_BoardDetail.jsp?bno=<%=bno%>";
</script>
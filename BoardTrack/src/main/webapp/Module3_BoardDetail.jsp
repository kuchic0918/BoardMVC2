<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "track.board.dto.*" %>
<%@ page import = "track.board.dao.*" %>
<%@ page import = "java.util.*" %>

<%
	if(session.getAttribute("loginId")==null) { //로그인 여부 확인 
		response.sendRedirect("Module3_Login.jsp");
	}
	if(request.getParameter("bno")==null) {
%>
		<script>
			alert("잘못된 접근입니다. ");
			location.href = "Module3_BoardListV3.jsp";
		</script>
<% 
	}
	int bno = Integer.parseInt(request.getParameter("bno"));
	BoardDao bDao = new BoardDao();	
	BoardDto dto = bDao.getBoardByBno(bno);
	
	bDao.increaseHitcount(bno);
	ArrayList<ReplyDto> listReply = bDao.getReplyListByBno(bno);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 상세보기</title>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function(){
			$('.span_delete').click(function(){
				var rno = $(this).parent().attr("rno");
				location.href = "Module3_BoardReplyDeleteAction.jsp?bno=<%=bno%>&rno="+rno;
			});
		});
	</script>	
	<style>	
		table {
			boreder-collapse : collapse;
		}
		th,td {
			padding : 5px;
			border : 1px solid grey;
		}
		td {
			cursor: pointer;
		}
		.span_delete {
			color:red;
			font-weight : 900;
			cursor: pointer;
		}
		.span_delete:hover {
			cursor: pointer;
		} 
	</style>
	<script>
		$(function(){
			$('#id').click(){
				location.href = "Module3_BoardReplyDeleteAction.jsp";
			};
		});
	</script>
</head>
<body>
		<table>
			<tr>
				<th>글번호</th>
				<td><%=dto.getBno()%></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter()%></td>
			</tr>
			<tr>
				<th>작성일시</th>
				<td><%=dto.getWritedate()%></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getHitcount()%></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getTitle()%></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=dto.getContent()%></td>
			</tr>
		</table>
		<!-- 댓글 작성 부분  -->
		<div>
			<form action = "Module3_BoardReplyAction.jsp" method = "post">
				<textarea name = "content"></textarea>
				<input type = "hidden" name = "bno" value= "<%=bno %>"/>
				<input type = "submit" value = "작성완료" />
			</form>
		</div>
		<div>
			<%
			for ( ReplyDto rDto : listReply) {
				%>
				<div rno = <%=rDto.getRno()%>>
					<%=rDto.getWriter() %>/<%=rDto.getContent() %> / <%=rDto.getWritedate() %>
					<span class = "span_delete">X</span>
				</div>
			<% 
			}
			%>
		</div>
		<a href  = "Module3_BoardListV3.jsp">목록보기</a>
</body>
</html>
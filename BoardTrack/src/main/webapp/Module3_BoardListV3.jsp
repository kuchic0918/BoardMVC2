<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "track.board.dto.*" %>
<%@ page import = "track.board.dao.*" %>
<%@ page import = "java.util.*" %>
<%
	if(session.getAttribute("loginId")==null) {
		response.sendRedirect("Module3_Login.jsp");
%>
<% 
		}
	//처음 보여지는 페이지는 1페이지임.
	int pageNum = 1;
		
	try {
		pageNum = Integer.parseInt(request.getParameter("page"));
		//페이지 이동할 때마다 pageNum을 변경해주기 위해 
	    //page가 없으면 null로 받아옴
	}
	catch(NumberFormatException e) {
		e.printStackTrace();
	}
	//시작 bno와 끝 bno를 계산 한페이지에 15개씩 출력 가정
	int startBno = pageNum * 10 - 9; //이해 후 암기
	int endBno = pageNum * 10; // 이해 후 암기
	BoardDao bDao = new BoardDao();
	ArrayList<BoardRDto> listBoard = bDao.getBoardListStartEnd(startBno, endBno);
	
	//startbno , endbno 를 보내서 sql 문 실행 후 ArrayList<BoardDto> 에 넣는다.
	%>
<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>게시글 전체보기v2</title>
<script>
	var pageNum = <%=pageNum%>;   //
	var lastPageNum = <%=bDao.getLastpageNumber()%>; //자바 변수의 값을 script 변수안에 넣는다.
//jQuery는 <body>가 다 그려지고 나면서 자동으로 실행된다. 
	$(function(){
		$('#btn_write').click(function(){ //click 이벤트 핸들러를 #btn_write에 붙힌다.
			location.href = "Module3_BoardWrite.jsp"; //글쓰기 페이지로 이동한다.
		});
		$("#btn_prevpage").click(function(){
			if(pageNum == 1) {
				alert("첫페이지 !");
				return;
			}
			else
				location.href = "Module3_BoardListV2.jsp?page="+(pageNum-1);
			//1일 때만 기능을 상실 시키고 나머지는 데이터가 있기 때문에 이전버튼을 누르면 pageNum-1 을 함.
		});		
			
		$("#btn_nextpage").click(function(){
			if(pageNum == lastPageNum) //더이상 이후에 페이지가 없을 때 기능을 상실시킴.
				return; //함수의 실행을 종료한다.
			location.href = "Module3_BoardListV2.jsp?page="+(pageNum+1);
		});
		$("#btn_Logout").click(function(){
			location.href = "Module3_LogoutAction.jsp";
		});
		$("table tr").click(function(){
			var bno = $(this).find(".bno").text();
			location.href = "Module3_BoardDetail.jsp?bno="+bno;
		})
	});
</script>
<style>
	table {
		border-collapse: collapse;
	}
	th,td {
		padding : 5px;
		border : 1px solid grey;
	}
	tr:hover {
		cursor:pointer;
	}
	fl{float:left;}
	fr{float:right;}
</style>
</head>
<body>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>글쓴이</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<%
			//
			for(BoardRDto dto : listBoard) { //listBoard 는 boardDto 요소(객체)를 관리하는 ArrayList
		%>
				<tr>
					<td class= "bno"><%=dto.getBno()%></td>
					<td><%=dto.getTitle()%> [<%=dto.getReplyNum()%>]</td>
					<td><%=dto.getContent()%></td>
					<td><%=dto.getWriter()%></td>
					<td><%=dto.getWritedate()%></td>
					<td><%=dto.getHitcount()%></td>
				</tr>  			
		
		<%
			}
		%>
		
	</table>
	<div>
 		<button id = "btn_prevpage">이전페이지</button>
		<%
		int lastPageNum = bDao.getLastpageNumber();
// 		pagination
		for (int i = pageNum-4; i <= pageNum + 4 ; i++ ) { //이해하기
			if(i < 1)
				continue;
			if(i > lastPageNum)
				break;
			if(i!=pageNum) {  //자기 제외하고는 링크로 달기위해
		%>
			<a href = "Module3_BoardListV2.jsp?page=<%=i%>"><%=i%></a>
		<%
			}
			else {
		%>
				<span><%=i%></span>
		<%
				}
		}
		%>
		<button id = "btn_nextpage">다음페이지</button>
	</div>
	<div class = "pagination-container">
		<button id = "btn_write" class = "fr">글쓰기</button>
		<button id = "btn_Logout">로그아웃</button>
	</div>
	
</body>
</html>
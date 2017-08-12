<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String pageVal = request.getParameter("page");
	// 데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;

	// 데이터베이스 연결관련정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost:3306/jspdb";
	String user = "root";
	String password = "1234";

	try {
		// JDBC 드라이버 로드
		Class.forName(jdbc_driver);
		// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
		conn = DriverManager.getConnection(jdbc_url, user, password);

	} catch (Exception e) 
	{
		System.out.println(e);
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/boardListCSS.css?ver=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>

<%
	String id = (String)session.getAttribute("loginID");
%>

function init()
{
	var click_table = document.getElementsByClassName("click_table");
	var board_table_table = document.getElementById("board_table_table");
	
	for(var i=0;i<click_table.length; i++)
	{
		click_table[i].addEventListener("click", function(e)
		{
			var parent = e.target.parentNode.rowIndex;
			var clicked_number = board_table_table.rows[parent].cells[0].innerHTML;
			location.replace("boardUser.jsp?number=" + clicked_number + "&page=" + <%=pageVal%>);			
		});
	}
}

function checkLogin()
{
<%
		if(id == null)
		{
			%>
				alert("로그인을 먼저 해주세요.");
			<%
		}
		else
		{
			%>
				location.replace('board.jsp');
			<%
		}
%>
}

</script>
</head>
<body onload="init()">

<%@ include file="/header.jsp"%>
	<%
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int pageNumVal = 0;
		
		try
		{
			// select 문장을 문자열 형태로 구성한다.
			String sql = "select * from board_table where page=" + pageVal + " limit 15";
			pstmt = conn.prepareStatement(sql);

			// select 를 수행하면 데이터정보가 ResultSet 클래스의 인스턴스로 리턴됨.
			ResultSet rs = pstmt.executeQuery();

	%>
		<div class="container">
		<h2>고객지원 게시판</h2>
		<p>원하시는 게시물을 클릭해주세요.</p>
		<table class="table table-hover" id="board_table_table">
			<thead>
				<tr>
					<th>글 번호</th>
					<th>이름</th>
					<th>제목</th>
					<th>날짜</th>
					<th>조회수</th>										
				</tr>
			</thead>
			<tbody>

	<%
			// 마지막 데이터까지 반복함.
			while (rs.next())
			{
				String numberVal = rs.getString(1);
				String nameVal = rs.getString(2);
				String titleVal = rs.getString(3);
				String dateVal = rs.getString(5);
				String countVal = rs.getString(6);
			%>
				<tr class="click_table">
					<td><%=numberVal %></td>
					<td><%=nameVal %></td>
					<td><%=titleVal %></td>
					<td><%=dateVal %></td>
					<td><%=countVal %></td>
				</tr>
			<%
				
			}
	
			pstmt.clearParameters();
			
			//밑에 자동 페이지 넘기기 위해 만듬
			String sql2 = "select * from board_table";
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			rs.last();
			int columnCount = rs.getRow();
			Integer pageNum = (columnCount/15) + 1;
			pageNumVal = pageNum;
			
			// 사용한 자원의 반납.
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}

	%>
			</tbody>		
		</table>
	</div>
	<div id="board_btn">
		<input type="button" value="게시글 작성" onclick="checkLogin()">
	</div>
	<br/>
	<center>

	<ul class="pagination">
		<% 
			int count = 0;
			System.out.println(count);
			for(int i=1; i<=pageNumVal; i++)
			{
				if(i+5 == pageNumVal && count == 0)	//5페이지씩 보임
					i += Integer.parseInt(request.getParameter("page"));
		%>
		<li><a href="boardList.jsp?page=<%=i %>"><%=i %></a></li>
		<%
				count++;
			}
		%>
	</ul>
</body>
</html>
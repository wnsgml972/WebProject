<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	// 데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;

	// 데이터베이스 연결관련정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost:3306/jspdb";
	String user = "root";
	String password = "1234";
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date date = new Date();

	try {
		// JDBC 드라이버 로드
		Class.forName(jdbc_driver);
		// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
		conn = DriverManager.getConnection(jdbc_url, user, password);

	} catch (Exception e) 
	{
		System.out.println(e);
	}
	
	String pageVal = request.getParameter("page");
	String loginID = (String)session.getAttribute("loginID");
	String number = request.getParameter("number");		//board_table의 기본키를 가져옴!

	String titleVal = "";
	String contentVal ="";
	String idVal = "";
		
	try 
	{		
		String uSql = "update board_table set count=count+1 where number=" + number;
		pstmt = conn.prepareStatement(uSql);
		pstmt.executeUpdate();
		pstmt.clearParameters();
		
		
		// select 문장을 문자열 형태로 구성한다.
		String sql = "select * from board_table where number=" + number;
		pstmt = conn.prepareStatement(sql);		
		// select 를 수행하면 데이터정보가 ResultSet 클래스의 인스턴스로 리턴됨.
		ResultSet rs = pstmt.executeQuery();
		
		// 마지막 데이터까지 반복함.
		while (rs.next())
		{
			idVal = rs.getString(2);
			titleVal = rs.getString(3);
			contentVal = rs.getString(4);
		}
			// 사용한 자원의 반납.
		rs.close();
		pstmt.close();
		conn.close();
		
	} catch (Exception e) 
	{
		System.out.println(e);
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 게시판</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/boardListCSS.css?ver=2">
<script>
	function modify() 
	{
		//number, loginID
		<%
		// 데이터베이스 연결관련 변수 선언
		conn = null;
		pstmt = null;
		// 데이터베이스 연결관련정보를 문자열로 선언
		try 
		{
			// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
			conn = DriverManager.getConnection(jdbc_url, user, password);
			System.out.println(loginID);
			String uSql = String.format("select id from board_table where id='%s' and number='%s'", loginID, number);
			pstmt = conn.prepareStatement(uSql);
			ResultSet rs = pstmt.executeQuery();
			String dicision = null;
			
			while (rs.next())
			{
				dicision = "있음!";
			}
			
			if(dicision == null)	// 자기 게시물이 아니라면
			{
				%>
					alert("자신의 게시물이 아닙니다.");
				<%
			}
			else	//자기 게시물이라면
			{
				%>
					if (confirm("정말 수정하시겠습니까??"))
						location.replace("boardModify.jsp?number=<%=number%>&page=<%=pageVal%>");
				<%
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e)
		{
			System.out.println(e);
		}

		%>
	}
</script>
</head>
<body>
<%@ include file="/header.jsp"%>
	<div class="container">
		<h2><img src="images/board.png" width="300px"></h2>
		<div class="well well-sm"><strong>제목&nbsp&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp<%=titleVal %></strong></div>
		<div class="well well-sm"><strong>글쓴이&nbsp&nbsp|&nbsp&nbsp <%=idVal%></strong></div>
		<div class="well well-lg"><strong><%=contentVal %></strong></div>
		<div class="well"><strong><span style="color:red;">CKY Cinema를 이용해주셔서 감사합니다.</span></strong></div>
	</div>
		<input type="button" value="수정" 
	style="width:75px; display:inline-block; margin-left:76%;" onclick="modify()">
	<input type="button" value="이전" 
	style="width:75px;" onclick="location.replace('boardList.jsp?page=<%=pageVal%>')">
</body>
</html>


<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/headerCSS.css?ver=2">
<title>Insert title here</title>
</head>
<body>

	<%
		String content = request.getParameter("content");
		String pageVal = request.getParameter("page");
		String number = request.getParameter("number");
		
		if(content.equals(""))
		{
			%>
			<script>
				alert("다시입력해주세요!");
				history.back();
			</script>
			<%
		}
		else
		{
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
				
				String sql = String.format("update board_table set content='%s' where number='%s'",content, number);
				System.out.println("제발");
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				
				pstmt.close();
				conn.close();
			} catch (Exception e)
			{
				System.out.println(e);
			}

		%>
			<script>location.replace("boardList.jsp?page=<%=pageVal%>");</script>
		<%
		}
	%>

</body>
</html>
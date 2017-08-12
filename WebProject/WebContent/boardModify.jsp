<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/boardCSS.css?ver=1">
<script src="ckeditor/ckeditor.js"></script>

</head>
<body>	
	<%@ include file="/header.jsp"%>
	<%
		String loginID = (String) session.getAttribute("loginID");
		String number = request.getParameter("number");	
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

		} catch (Exception e) {
			System.out.println(e);
		}

		String titleVal = "";
		String contentVal = "";

		try {
			System.out.println(number);
			// select 문장을 문자열 형태로 구성한다.			
			String sql = String.format("select title, content from board_table where number='%s'", number);
			pstmt = conn.prepareStatement(sql);
			
			// select 를 수행하면 데이터정보가 ResultSet 클래스의 인스턴스로 리턴됨.
			ResultSet rs = pstmt.executeQuery();
			// 마지막 데이터까지 반복함.
			while (rs.next()) 
			{
				titleVal = rs.getString(1);	//title 받아 옴
				contentVal = rs.getString(2);
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

	<div id="board_wrap" style="margin-top:5%;">
		<div class="common_set">
			<form action="checkModify.jsp?number=<%=number%>&page=<%=pageVal%>" method="post">
				아이디&nbsp&nbsp&nbsp<strong><%=loginID %></strong><br/><br/>
				제목&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<strong><%=titleVal %></strong><br/><br/>
				<p style="font-size: 5px;">
					※ 준희 짱 성원이 짱 용석 짱 웹 서버 프로그래밍 짱 이석기 교수님 짱 
					<br>※ 저작권에 위배되는 게시물 작성시 운영 원칙 및 관련 법령에 따라 처벌 될 수 있습니다.
					<br>※유료 이미지를 무단으로 사용 할 경우 법적인 처벌을 받을 수 있습니다.이용안내
				</p>
				<br><br>
				<textarea id="editor1" name="content" rows="15"><%=contentVal %></textarea>
				<input type="submit" name="a" value="작성">
			</form>
			<script>
				CKEDITOR.replace("editor1", {
					customConfig : '/inc/ckeditor/hyh_basic.js'
				});
			</script>
		</div>
	</div>
</body>
</html>
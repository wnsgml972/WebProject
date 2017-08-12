<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb";
	String db_id = "root";
	String db_pw = "1234";
	Class.forName(jdbc_driver);

	conn = DriverManager.getConnection(jdbc_url, db_id, db_pw);
	String sql = "insert into book(id, movie, time, theaterName, theaterSeat) values(?, ?, ?, ?, ?)";

	pstmt = conn.prepareStatement(sql);

	// select 를 수행하면 데이터정보가 ResultSet 클래스의 인스턴스로 리턴됨.
	String user_ID = request.getParameter("user_Id");
	String theaterName = request.getParameter("theaterName");
	String movieName = request.getParameter("movieName");
	String time = request.getParameter("time");
	String seat = request.getParameter("seat");
	System.out.println(user_ID + " " + theaterName + " " + movieName + " " + time + " " + seat);
	seat = seat.trim();
	String bookSeat[] = seat.split(", ");
	String finalBookSeat="";
	for(int i=0; i<bookSeat.length; i++){
		if(bookSeat[i] != null){
			bookSeat[i] = bookSeat[i].trim();
			finalBookSeat+=bookSeat[i] + "&";
		}
	}	
	finalBookSeat = finalBookSeat.trim();
	pstmt.setString(1, user_ID);
	pstmt.setString(2, movieName);
	pstmt.setString(3, time);
	pstmt.setString(4, theaterName);
	pstmt.setString(5, finalBookSeat);
	System.out.println(theaterName + " " + movieName + " " + finalBookSeat);
	pstmt.executeUpdate();
	System.out.println("저장성공!");
	out.println("2");	
	pstmt.close();
	conn.close();
%>
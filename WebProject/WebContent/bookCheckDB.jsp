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
	String sql = "select distinct theaterSeat from book where theaterName=? and movie=? and time=?";

	pstmt = conn.prepareStatement(sql);

	// select 를 수행하면 데이터정보가 ResultSet 클래스의 인스턴스로 리턴됨.
	String theaterName = request.getParameter("theaterName");
	String movieName = request.getParameter("movieName");
	String movieTime = request.getParameter("time");
	
	pstmt.setString(1, theaterName);
	pstmt.setString(2, movieName);
	pstmt.setString(3, movieTime);
	System.out.println(theaterName + " " + movieName + " " + theaterName);
	ResultSet rs = pstmt.executeQuery();	
	if(rs.next()){
		String getTheaterSeat = rs.getString("theaterSeat");		
		if(getTheaterSeat == null){			
			out.println("2");			
		}		
		else{
			
			System.out.print(getTheaterSeat);			
			out.print(getTheaterSeat);				
			while(rs.next()){
				getTheaterSeat = rs.getString("theaterSeat");				
				out.print("&" + getTheaterSeat);
				System.out.println(getTheaterSeat);
			}
		}
	}
	else{		
		out.println("2");		
	}	
	rs.close();
	pstmt.close();
	conn.close();
%>
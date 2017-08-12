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
	String sql = "select * from user where userID=? and userPW=?";

	pstmt = conn.prepareStatement(sql);

	// select 를 수행하면 데이터정보가 ResultSet 클래스의 인스턴스로 리턴됨.
	String userID = request.getParameter("input_id");
	String userPW = request.getParameter("input_pw");
	System.out.println(userID + " " + userPW);
	pstmt.setString(1, userID);
	pstmt.setString(2, userPW);
	ResultSet rs = pstmt.executeQuery();	
	if(rs.next()){
		String getID = rs.getString("userID");
		String getPW = rs.getString("userPW");
		if(getID == null){
			System.out.println("로그인실패");
			out.println("2");			
		}
		else if(getID.equals(userID)){
			System.out.println("로그인성공");
			out.println("1");/*  로그인성공  */
			request.getSession().removeAttribute("loginID");
			request.getSession().setAttribute("loginID",userID);			
		}
		else{
			System.out.println("로그인실패");
			out.println("2");			
		}
	}
	else{
		System.out.println("로그인실패");
		out.println("2");		
	}	
	System.out.println("2");
	rs.close();
	pstmt.close();
	conn.close();
%>
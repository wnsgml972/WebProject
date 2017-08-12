<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>

<%
   request.setCharacterEncoding("utf-8");

   // 데이터베이스 연결관련 변수 선언
   Connection conn = null;
   PreparedStatement pstmt = null;

   // 데이터베이스 연결관련정보를 문자열로 선언
   String jdbc_driver = "com.mysql.jdbc.Driver";
   String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb";
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
   
   String userID = (String)request.getSession().getAttribute("loginID");   

      
   try 
   {      
      String uSql = "select * from book where id=?";
      pstmt = conn.prepareStatement(uSql);
      pstmt.setString(1, userID);
      ResultSet rs = pstmt.executeQuery();
      
      // 마지막 데이터까지 반복함.
        
      
      if(userID != null){
      while (rs.next())
      {
         int bookcode = (int)rs.getInt("bookcode");
         String id = (String)rs.getString("id");
         String movie = (String)rs.getString("movie");
         String time = (String)rs.getString("time");
         String theaterName = (String)rs.getString("theaterName");
         String theaterSeat = (String)rs.getString("theaterSeat");
         int number = (int)rs.getInt("bookcode");
         theaterSeat = theaterSeat.replace("&", " ");
         out.print("<tr><td>"+id + "</td><td>" + theaterName + "</td><td>" + movie + "</td><td>" + time + "</td><td>"+ theaterSeat + "</td><td>" +number + "</td></tr>");

      }
      }
      else{
         out.println("2");
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
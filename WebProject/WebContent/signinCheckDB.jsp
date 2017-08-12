<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
      String sql = "select userID from user where userID=?"; 
      pstmt = conn.prepareStatement(sql);

      // select 를 수행하면 데이터정보가 ResultSet 클래스의 인스턴스로 리턴됨.
      String userID = request.getParameter("input_id");      
      System.out.println(userID);
      if(userID == null){
         out.println("오류");      
      }
      pstmt.setString(1, userID);
      ResultSet rs = pstmt.executeQuery();
      if(rs.next() == false){
         System.out.println("사용o");
         out.println("1");         
         request.getSession().removeAttribute("ID");
         request.getSession().setAttribute("ID",userID);
      }
      else{         
         out.println("2");
         System.out.println("사용x");
      }
      System.out.println(rs.toString());
      // 마지막 데이터까지 반복함.      
      while(rs.next()) {
         String s = rs.getString("userID");
         System.out.println(s);
         if(rs.getString("userID").equals(userID)){
            session.setAttribute("ID",userID);
            out.println("2");         
         }
         else{
            System.out.println("사용o");
            out.println("1");         
               
         }
      }   
      rs.close();
      pstmt.close();
      conn.close();
   %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/bookPageCSS.css?ver=1">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<%
			String theater = request.getParameter("cell1");
			String movie = request.getParameter("cell2");
			String mtime = request.getParameter("cell3");	
			String islogin = (String) session.getAttribute("loginID");
		%>
<script>
	$(function() {
		$(document).ready(function() {
			var data_param = "theaterName=" + "<%=theater%>" + "&" + "movieName=" + "<%=movie%>" + "&" + "time=" + "<%=mtime%>";
			$.ajax({
				type : "post",
				url : "bookCheckDB.jsp",
				data : data_param,
				success : function(result) {
					var t = result.trim();					
					if (t == 1) {//좌석 비어있음

					} else {//좌석있음
						seat = t.split('&');
						for(var i=0; i<seat.length; i++){
							seat[i] = seat[i].trim();
							if(seat[i] != ""){
							var location = "seatID"+seat[i];
							seatloaction = location.trim();							
							document.getElementById(seatloaction).disabled="true";
							}
						}			
					}
				}
			});
		});
	});
	$(function() {
		$("#bookData").click(function() {		
			var data_param = "user_Id=" + "<%=islogin%>" + "&" + "theaterName=" + "<%=theater%>" + "&" + "movieName=" + "<%=movie%>" + "&" + "time=" + "<%=mtime%>"
	 + "&" + "seat=" + $("#resultval").text();
					$.ajax({
						type : "post",
						url : "bookSaveDB.jsp",
						data : data_param,
						success : function(result) {
							var t = result.trim();
							if (t == 1) {//좌석 비어있음

							} else if (t == 2) {//성공
								location.replace("index.jsp");
							}
						}
					});
				});
	});
</script>
</head>
<body>
	<%
		if (islogin == null) {
	%>
	<script>
		alert("로그인이 필요합니다!!");
		location.href = "login.jsp"
	</script>
	<%
		}
	%>
	<div id="header">
		<%@ include file="header.jsp"%>

	</div>
	<center>
		<div class="well" style="font-size: 20px;">
			극장 :
			<%=theater%>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp; 영화 :
			<%=movie%>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp; 시간 :<%=mtime%>
		</div>
		<script>
			var list = [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J' ];
			document.write("<table>");
			for (var i = 0; i < list.length; i++) {
				document.write("<tr>");
				document.write("<td class='first'>" + list[i] + "</td>");
				for (var j = 0; j < 5; j++) {
					document
							.write("<td><input type='checkbox' class='mcheckbox' id='seatID" + list[i] + j + "'><label for='seatID" + list[i] + j + "'>"
									+ list[i] + j + "</label></td>");
				}
				document.write("<td>&nbsp&nbsp&nbsp&nbsp</td>");
				for (var j = 5; j < 15; j++) {
					document
							.write("<td><input type='checkbox' class='mcheckbox' id='seatID" + list[i] + j + "'><label for='seatID" + list[i] + j + "'>"
									+ list[i] + j + "</label></td>");
				}
				document.write("<td>&nbsp&nbsp&nbsp&nbsp</td>");
				for (var j = 15; j < 20; j++) {
					document
							.write("<td><input type='checkbox' class='mcheckbox' id='seatID" + list[i] + j + "'><label for='seatID" + list[i] + j + "'>"
									+ list[i] + j + "</label></td>");
				}
				document.write("</tr>");
			}
			document.write("</table>");
			$(".mcheckbox")
					.change(
							function() {
								var checked = document
										.getElementsByClassName("mcheckbox");
								var result = null;
								for (var i = 0; i < checked.length; i++) {
									if (checked[i].checked) {
										var t = 0;
										for (var j = 0; j < seat.length; j++) {
											var value = checked[i].nextSibling.innerHTML;
											if (value == seat[j]) {
												t++;
												break;
											}
										}
										if (t == 0) {
											if (result == null) {
												result = checked[i].nextSibling.innerHTML;
											} else {
												result += ", "
														+ checked[i].nextSibling.innerHTML;
											}
										}
									}
								}

								var v = document.getElementById("resultval");
								v.innerHTML = result;
							});
		</script>
		<div>
			<div class="alert alert-success" id="resultval"></div>
			<button type="button" class="btn btn-default"
				onclick="location.href='index.jsp'">취소</button>
			<input type="button" class="btn btn-primary" id="bookData" value="예매">
		</div>
</body>
</html>
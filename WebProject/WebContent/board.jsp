<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/boardCSS.css?ver=1">
<script src="ckeditor/ckeditor.js"></script>

</head>
<body>	
	<%@ include file="/header.jsp"%>
	<%
		String loginID = (String)session.getAttribute("loginID");
	%>	

	<div id="board_wrap" style="margin-top:5%;">
		<div class="common_set">
			<form action="check.jsp" method="post">
				아이디&nbsp&nbsp&nbsp<strong><%=loginID %></strong><br/><br/>
				제목&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="title" type="text" name="title" size="80">
				<p style="font-size: 5px;">
					※ 준희 짱 성원이 짱 용석 짱 웹 서버 프로그래밍 짱 이석기 교수님 짱 
					<br>※ 저작권에 위배되는 게시물 작성시 운영 원칙 및 관련 법령에 따라 처벌 될 수 있습니다.
					<br>※유료 이미지를 무단으로 사용 할 경우 법적인 처벌을 받을 수 있습니다.이용안내
				</p>
				<br><br>
				<textarea id="editor1" name="content" rows="15"></textarea>
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
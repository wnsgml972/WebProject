<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CKY Cinema에 오신것을 환영합니다.</title>
<link rel="shortcut icon" href="images/pabicon.ico" type="image/x-icon" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/headerCSS.css?ver1">

<script>
   $(document).ready(function(){
      $.fn.movieCheck();      
      });
   $(function() {
      $("#sel1").change(function(){
      $("#sel2 option").remove();
      $("#sel3 option").remove();
      $.fn.movieCheck();      
      });
   });
   $(function() {
      $("#sel2").change(function(){
      $("#sel3 option").remove();
      $.fn.timeCheck();
      });
   });
   $(function(){   
   $("#myPage").click(function() {
      var data_param="";
      $.ajax({
         type : "post",
         url : "myPageDB.jsp",
         data : data_param,
         success : function(result) {
            var t = result.trim();
            if (t == 2) {
               alert("오류");
            } else {
               $("#bookContent").html(result);               
            }
         }
      });
   });
   });
   $.fn.movieCheck = function() {
      var data_param = "theaterName=" + $("#sel1").val();
      $.ajax({
         type : "post",
         url : "theaterCheckDB.jsp",
         data : data_param,
         success : function(result) {
            var p = result.trim();
            if (p == 2) {
               $('#sel2').append($('<option>', {
                  text : "없습니다."
               }));
               $('#sel3').append($('<option>', {
                  text : "없습니다."
               }));
            } else {/* 영화있음  */
               var value = p.split('&');
               for (var i = 0; i < value.length; i++) {
                  $('#sel2').append($('<option>', {
                     text : value[i]
                  }));
               }      
               $.fn.timeCheck();
            }
         }
      });
   }
   $.fn.timeCheck = function() {
      var data_param = "theaterName=" + $("#sel1").val() + "&movieName=" + $("#sel2").val();
      $.ajax({
         type : "post",
         url:"movieCheckDB.jsp",
         data : data_param,
         success : function(result) {         
            var p = result.trim();
            if (p == 2) {
               $('#sel3').append($('<option>', {
                  text : "없습니다."
               }))
            } else {/* 영화있음  */
               var value = p.split('&');
               for (var i = 0; i < value.length; i++) {
                  $('#sel3').append($('<option>', {
                     text : value[i]
                  }));
               }
            }
         }
      });
   }
</script>
</head>
<body>
	<div id="import_header">
		<div class="container-fluid" style="background: white;">
			<div class="navbar-header" style="height: 80px; padding-top: 5px;">
				<a class="navbar-brand" href="index.jsp"
					style="font-size: 30px; padding-top: 0px;"><img
					src="images/logo2.png" width="250px;"></a>
			</div>
			<ul class="nav navbar-nav" id="myul">
				<li class="active"><a href="lookingMovie.jsp">영화</a></li>
				<li id="bookBtn"><a data-toggle="modal" data-target="#myModal">예매</a></li>
				<li><a href="eventCulture.jsp">이벤트 & 컬쳐</a></li>
				<li><a href="membership.jsp">멤버쉽</a></li>
			</ul>
			<%
            String user_ID = (String) session.getAttribute("loginID");
            if (user_ID == null) {
         %>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jsp"><span
						class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
				<li><a href="signin.jsp"><span
						class="glyphicon glyphicon-user"></span> 회원가입</a></li>
				<li><a href="boardList.jsp?page=1"><span
						class="glyphicon glyphicon-wrench"></span> 고객지원</a></li>
			</ul>
			<%
            } else {
         %>
			<ul class="nav navbar-nav navbar-right">
				<li id="welcome_user"><%=user_ID%>님 환영합니다.</li>
				<li><a data-toggle="modal" data-target="#myModal2" id="myPage"><span
						class="glyphicon glyphicon-user"></span> 마이 페이지</a></li>
				<li><a href="logout.jsp"><span
						class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
				<li><a href="boardList.jsp?page=1"><span
						class="glyphicon glyphicon-wrench"></span> 고객지원</a></li>
			</ul>
			<%
            }
         %>
		</div>


		<!-- Modal -->
		<form action="bookPage.jsp" method="post">
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog" style="width: 800px;">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">영화 정보</h4>
						</div>
						<div class="modal-body">
							<table>
								<tr>
									<td><label for="sel1">상영관</label></td>
									<td><label for="sel2">상영 영화</label></td>
									<td><label for="sel3">상영 시간</label></td>
								</tr>
								<tr>
									<td><select class="form-control" id="sel1" name="cell1">
											<option>중계</option>
											<option>하계</option>
											<option>노원</option>
											<option>건대입구</option>
									</select></td>
									<td><select class="form-control" id="sel2" name="cell2">
									</select></td>
									<td><select class="form-control" id="sel3" name="cell3">a
									</select></td>
								</tr>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-primary">이동</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<form action="bookPage.jsp" method="post">
			<div class="modal fade" id="myModal2" role="dialog">
				<div class="modal-dialog" style="width: 800px;">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">영화 정보</h4>
						</div>
						<div class="modal-body">
							<table class="table table-hover" id="movieData">
								<thead>
									<tr>
										<th><label for="movie1">ID</label></th>
										<th><label for="movie2">상영관</label></th>
										<th><label for="movie3">상영 영화</label></th>
										<th><label for="movie4">상영 시간</label></th>
										<th><label for="movie5">좌석</label></th>
										<th><label for="movie6">예약 코드</label></th>
									</tr>
								</thead>
								<tbody id="bookContent">
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>

						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
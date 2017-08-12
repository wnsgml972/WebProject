<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/signinCSS.css?ver=2">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script> <script>
	$(function() {

		var out;
		$("#user_id").keyup(function() {

			var data_param = "input_id=" + $("#user_id").val();
			$.ajax({
				type : "post",
				url : "signinCheckDB.jsp",
				data : data_param,
				success : function(result) {
					var t = result.trim();
					var div = document.getElementById("signIn");
					if (t == 1) {
						$("#signIn").html("사용 가능한 ID 입니다.");
						$("#signIn").css("color", "blue");
					} else {
						div.innerHTML = "사용 중인 ID";
						$("#signIn").html("사용 중인 ID 입니다.");
						$("#signIn").css("color", "red");
					}
				}
			});
		});
	});
	$(function() {

		var out;
		$("#user_submit").click(
				function() {

					var data_param = "input_id=" + $("#user_id").val() + "&"
							+ "input_pw=" + $("#user_pw").val() + "&"
							+ "input_email=" + $("#user_email").val();
					$.ajax({
						type : "post",
						url : "signinDB.jsp",
						data : data_param,
						success : function(result) {
							var p = result.trim();
							if (p == 1)
								alert("중복확인 하세요!!");
							else if (p == 2)
								alert("비밀번호가 짧습니다.");
							else if (p == 3) {
								alert("회원가입 성공!");
								location.href = "login.jsp";
							}
						}
					});
				});
	});
	function Enter_Check(e) {
		if (e.keyCode == 13) { /* IE기준으로 설명 */
			document.getElementById("user_submit").click();
			return false;
		}

	}
</script> <script>
	document.onload = function() {
		var password = document.getElementById("user_pw");
		password.addEventListenr("keyup", myFuntion);

	}
	function myFunction() {
		var password = document.getElementById("user_pw");
		var progress = document.getElementById("pwprogress");

		switch (password.value.length) {
		case 0:
		case 1:
		case 2:
		case 3:
			progress.value = "30";
			progress.backgroundColor = "red";
			break;
		case 4:
		case 5:
		case 6:
			progress.value = "60";
			progress.backgroundColor = "blue";
			break;
		case 7:
		case 8:
		case 9:
			progress.value = "90";
			progress.backgroundColor = "green";
			break;
		}
	}
	function myAlert(userinput) {

	}
</script>
<link rel="shortcut icon" href="images/pabicon.ico" type="image/x-icon" />
</head>
<body>
	<div id="con"></div>

	<div id="header">
		<%@ include file="header.jsp"%>
	</div>
	<div id="loginHeader">
		<div>
			<form id="loginform" action="signinDB.jsp" method="post">
				<table>
					<tbody>
						<tr>
							<td colspan="2"><label for="user_id">ID</label></td>
						</tr>
						<tr>

							<td>
								<div class="input-group" style="margin: 5px 0px; padding: 0px;">
									<span class="input-group-addon" style="height: 50px;"><i
										class="glyphicon glyphicon-user"></i></span> <input id="user_id"
										style="height: 50px;" type="text" class="form-control"
										name="input_id" placeholder="ID">
								</div>
							</td>
							<!-- ID넣는곳  -->

							<td><div id="signIn" name="login"></div></td>


						</tr>
						<tr>
							<td colspan="2"><label for="user_pw">PW</label></td>
						</tr>
						<tr>
							<td>
								<div class="input-group" style="margin: 5px 0px; padding: 0px;">
									<span class="input-group-addon" style="height: 50px;"><i
										class="glyphicon glyphicon-lock"></i></span> <input id="user_pw"
										style="height: 50px;" type="password" class="form-control"
										name="input_pw" placeholder="Password"
										onkeydown="myFunction()">
								</div>
							</td>
							<!-- PW넣는곳  -->
							<td><progress min="0" max="100" value="30" id="pwprogress"></td>

						</tr>
						<tr>
							<td colspan="2"><label for="user_pw">E-mail</label></td>
						</tr>
						<tr>
							<td>
							<div class="input-group" style="margin: 5px 0px; padding: 0px;">
									<span class="input-group-addon" style="height: 50px;"><i
										class="glyphicon glyphicon-envelope"></i></span> <input id="user_email"
										style="height: 50px;" type="email" class="form-control"
										name="input_email" placeholder="E-Mail"
										onkeydown="JavaScript:Enter_Check(event);">
								</div>
							</td>
							<!-- email넣는곳  -->
						</tr>
						<tr>
							<td colspan="2"><label for="user_login">SignIn</label></td>
						</tr>
						
						<tr>
							<td><input type="button" id="user_submit"
								name="input_submit" value="Sign In"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>

	<%-- 	<script>
		document.findViewById("user_id").value =
	<%=request.getParameter("input_id")%>
		;
		document.findViewById("user_pw").value =
	<%=request.getParameter("input_pw")%>
		;
		document.findViewById("user_email").value =
	<%=request.getParameter("input_email")%>
		;
	</script> --%>
</body>
</html>
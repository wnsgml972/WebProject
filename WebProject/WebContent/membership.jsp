<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="CSS/lookingMovieCSS.css?ver=2">
</head>
<body>
	<%@ include file="/header.jsp"%>


	<div class="jumbotron text-center">
		<h1>멤버쉽</h1>
		<p>한성대학교 이신가요? 컴퓨터공학부 이신가요? 당신도 CKY Cinema의 VIP가 될 수 있습니다.</p>
	</div>


	<center>
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<img src="images/member1.png" class="movie_poster">
					<p>
						<strong><span style="color: magenta;">예매부터 감동이다!</span><br>
							CKY 영화예매권 10장 증정<br> 기간: 2017.05.30 ~ 2017.06.07</strong>
					</p>
				</div>
				<div class="col-sm-4">
					<img src="images/member2.png" class="movie_poster">
					<p>
						<strong><span style="color: magenta;">특별관 CLUB</span><br>
							영화도, 혜택도 특별함을 원하는 당신을 위해<br> 기간: 2017.05.30 ~ 2017.06.07</strong>
					</p>
				</div>
				<div class="col-sm-4">
					<img src="images/member3.png" class="movie_poster">
					<p>
						<strong><span style="color: magenta;">이젠 현금처럼 사용하자!</span><br>
							우리 은행 꿀머니로 이젠 현금처럼 사용하자<br> 기간: 2017.05.30 ~ 2017.06.07</strong>
					</p>
				</div>
			</div>
		</div>

		<br />
		<br />
		<br />
		<br />
		<div class="container">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="images\listImage\그림1.jpg" alt="Los Angeles"
							style="width: 100%;">
					</div>

					<div class="item">
						<img src="images\listImage\그림7.png" alt="Chicago"
							style="width: 100%;">
					</div>

					<div class="item">
						<img src="images\listImage\그림3.png" alt="New york"
							style="width: 100%;">
					</div>
				</div>
				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<br />
		<br />
		<br />
</body>
</html>

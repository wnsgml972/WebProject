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
		<h1>이벤트 & 컬쳐</h1>
		<p>CKY Cinema 한성대학교 학부생에게만 최대 이벤트! 어서 참여하세요.</p>
	</div>


	<center>
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<img src="images/event1.jpg" class="movie_poster">
					<p>
						<strong><span style="color: red;">스페셜이벤트</span><br>
							CKY 길 나중에 고양이 로소이다 10억<br> 기간: 2017.05.30 ~ 2017.06.07</strong>
					</p>
				</div>
				<div class="col-sm-4">
					<img src="images/event2.jpg" class="movie_poster">
					<p>
						<strong><span style="color: red;">스페셜이벤트</span><br>
							CKY 파란 나비 효과 thanks 121억<br> 기간: 2017.05.30 ~ 2017.06.07</strong>
					</p>
				</div>
				<div class="col-sm-4">
					<img src="images/event3.jpg" class="movie_poster">
					<p>
						<strong><span style="color: blue;">스페셜이벤트</span><br>
							CKY 용순 지금부터 시작이다 13억<br> 기간: 2017.05.30 ~ 2017.06.07</strong>
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
						<img src="images\listImage\그림6.png" alt="Los Angeles"
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

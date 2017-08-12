<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 부트스트랩 css -->
<!-- <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="bootstrap/bootstrap.css">
<script src="bootstrap/bootstrap.js"></script> -->


<link rel="stylesheet" type="text/css" href="CSS/containerCSS.css?ver=2">

</head>
<body>

   <div id="containr_wrap">
      <div id="ad_block">
         <!-- <img src="images/movie_background.png" width="100%" id="background_image"> -->
         <div id="slider" class="common_set">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
               <!-- Indicators -->
               <ol class="carousel-indicators">
                  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel" data-slide-to="1"></li>
                  <li data-target="#myCarousel" data-slide-to="2"></li>
                  <li data-target="#myCarousel" data-slide-to="3"></li>
               </ol>

               <!-- Wrapper for slides -->
               <div class="carousel-inner" style="height : 455px;">
                  <div class="item active">
                     <img src="images\listImage\그림1.jpg" class="img-thumbnail" alt="dog" width="980px" height="450px">                     
                  </div>

                  <div class="item">
                     <img src="images\listImage\그림3.png" class="img-thumbnail" alt="dog" width="980px" height="450px;">
                  </div>

                  <div class="item">
                     <img src="images\listImage\그림6.png" class="img-thumbnail" alt="dog" width="980px" height="450px;">
                  </div>
                  <div class="item">
                     <img src="images\listImage\그림7.png" class="img-thumbnail" alt="dog" width="980px" height="450px;">
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
            <!-- <div id="slider_item">
               <img src="images\dog.jpg" style="width: 100%; height: 100%">
               <input type="image" src="images\left.png" id="lbtn" width="80px">
               <input type="image" src="images\right.png" id="rbtn" width="80px">
            </div> -->
         </div>
      </div>

      <div class="common_set">
         <center>
            <div id="movie_selection">
               <h3 class="sub_title">
                  <img src="images\movie_selection.png" style="width: 400px;">
               </h3>
               <hr>
               <table>
                  <tr>
                     <td><iframe width="700px" height="400px"
                           src="https://www.youtube.com/embed/Nfu-t7FaY04?autoplay=1&rel=0&controls=0&loop=1"
                           frameborder="0"></iframe></td>
                     <td><img src="images\poster\wonderwoman.jpg"
                        style="height: 400px;"></td>
                  </tr>
               </table>
            </div>

            <div id="event">
               <h3 class="sub_title">
                  <img src="images\event.png" style="width: 200px;">
               </h3>
               <hr>
               <img src="images\listImage\그림5.png"
                  style="width: 100%; height: 100%">
            </div>
      </div>
   </div>
</body>
</html>
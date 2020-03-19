<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>

<!-- Scripts -->
<script>
var loginUserId = "${sessionScope.loginUser.adminId}";

var contextPath = "${pageContext.request.contextPath}";

var musicPlay;
var modal;
var modal02;
var playNow;	

</script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.scrollex.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/skel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/m_popup.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/main/main_project.js"></script>
<script>

$(document).ready(function(){
		
		
		musicPlay = new Audio("${pageContext.request.contextPath}/resources/music/Even though we're far away now.mp3");
		/* musicPlay.pause();
		musicPlay.play(); */
		
		modal = document.querySelector(".modal"); 
		modal.classList.toggle("show-modal"); 
		$('html, body').css({'overflow': 'hidden'});
		$('#element').on('scroll touchmove mousewheel', function(event) {
		   event.preventDefault();
		   event.stopPropagation();
		   return false;
		 });  
	 
		 
		$( "#start" ).click(function() {

			modal = document.querySelector(".modal"); 
			modal.classList.toggle("show-modal"); 
			
			 $('#element').off('scroll touchmove mousewheel');
			 $('html, body').css({'overflow': 'auto'});
			 
			 musicPlay.addEventListener('ended',function(){this.currentTime=0;this.play();},false);
			 
			 musicPlay.play();
			 playNow = true;
			 
			 
			 $(".indicators").children().eq(0).click();
			
			});
		
		btnClickEvent();
		
		 
});



function btnClickEvent(){
	
	
	/* $( "#cretecBtn" ).click(function() {
		
		modal02 = document.querySelector(".modal02"); 
		modal02.classList.toggle("show-modal"); 
			
		
		}); */
	
	
	$( "#closeBtn" ).click(function() {

		
		modal02 = document.querySelector(".modal02"); 
		modal02.classList.toggle("show-modal"); 
		
		
	});
	
	
	$("#muteBtn").click(function(){
		
		
		if (!musicPlay.mute) 
		{
			musicPlay.muted = true;
			$("#muteBtn").css("background-color","orange")
			musicPlay.mute = true; 
		}
		else 
		{
			
		    musicPlay.muted = false;
			$("#muteBtn").css("background-color","#666984e3")
			musicPlay.mute = false; 
		}
		
	});

}
	
function imgPopupOpen(url){
	  var img=new Image();
	  img.src=url;
	  var img_width=img.width;
	  var win_width=img.width+25;
	  var img_height=img.height;
	  var win=img.height+30;
	  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
	  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
	 }	


function projectManager(){
	var url = "${pageContext.request.contextPath}"+"/admin/projectManager";
	var OpenWindow=window.open(url,'_blank',  'menubars=no, scrollbars=auto');
	
}
	
	</script>


<style>
  body{ 
         text-align: center; 
         display: block; 
         margin: 0 auto; 
         font-size: 16px; 
         color: #999; 
     } 
     h1{ 
         font-family: 'Oswald', sans-serif; 
         font-size: 30px; 
         color: #216182; 
     } 
     
    .modal { 
         position: fixed; 
         left: 0; 
         top: 0; 
         width: 100%; 
         height: 100%; 
        /*  background-color: rgba(0, 0, 0, 0.5);  */
        background-color:black;
         opacity: 0; 
         visibility: hidden; 
         transform: scale(1.1); 
         transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
         z-index: 100;
     } 
     
     .modal02{
     	position: fixed; 
         left: 0; 
         top: 0; 
         width: 100%; 
         height: 100%; 
        /*  background-color: rgba(0, 0, 0, 0.5);  */
        background-color:black;
         opacity: 0; 
         visibility: hidden; 
         transform: scale(1.1); 
         transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
         z-index: 100;
         min-height: 300px;
     }
     .modal-content { 
         position: absolute; 
         top: 50%; 
         left: 50%; 
         transform: translate(-50%, -50%); 
         background-color: white; 
         padding: 1rem 1.5rem; 
         width: 350px;
    	 height: 170px;
         border-radius: 0.5rem; 
     } 
     
     
       .modal-content02 { 
         position: absolute; 
         top: 50%; 
         left: 50%; 
         transform: translate(-50%, -50%); 
         background-color: white; 
         padding: 1rem 1.5rem; 
        /*  width: 350px;
    	 height: 170px; */
    	/*  max-height: 650px; */
   		 max-width: 90%;
   		
         border-radius: 0.5rem; 
     } 
   
     .show-modal { 
         opacity: 1; 
         visibility: visible; 
         transform: scale(1.0); 
         transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s; 
     } 
     
     .title{
     font-family: 'Sunflower', sans-serif;
     
     }
     
     .projectDetailFont{
     font-family: 'Noto Sans KR', sans-serif;
     font-size: initial;
     }
     
      .projectTitle{
     font-family: 'Sunflower', sans-serif;
     
     }
     
      .projectTitle{
     font-family: 'Sunflower', sans-serif;
     
     }
     
     .detailDiv{
     
     overflow: scroll;
     
     }
     #start{
     
  	border: 1px solid black;
    background-color: black;
    width: 200px;
    height: 50px;
    display: inline-block;
    margin: auto;
    padding: 8px 8px 8px 8px;
    cursor: pointer;
    border-radius: 15px;
	}
	#start:hover { 
         background-color: darkgray; 
     } 
     
     #start span{
      font-family: 'Sunflower', sans-serif;
     color : white;
     font-weight: bold;
     display:inline-block;
     margin : auto;
     }
     
     
     
    #closeBtn{
    border: 1px solid black;
    background-color: black;
    width: 200px;
    height: 50px;
    display: inline-block;
    margin-top:10px;
    padding: 8px 8px 8px 8px;
    cursor: pointer;
    border-radius: 15px;
	}
	#closeBtn:hover { 
         background-color: darkgray; 
     } 
     
     #closeBtn span{
      font-family: 'Sunflower', sans-serif;
     color : white;
     font-weight: bold;
     display:inline-block;
     margin : auto;
     }
     
     
     .fit{
     cursor: pointer;
     
     }
    
    .skills{
        font-size: 2.0vh !important;;
    text-decoration: underline;
    }
    .grade{
    margin-left:10px;
     font-size: 1.6vh !important;
    }
    
    .career{
    display: inline-block;
    border-bottom: 1px solid #ffffff;
    font-size: 2.0vh !important;
    }
    h5{
   text-align: center;
    font-size: 1.6vh !important;
    }
    
    
    #careerP{
    -moz-animation: fadein 2s; /* Firefox */
    -webkit-animation: fadein 2s; /* Safari and Chrome */
    -o-animation: fadein 2s; /* Opera */
    }
    
    #careerDiv{
    -moz-animation: fadein 2s; /* Firefox */
    -webkit-animation: fadein 2s; /* Safari and Chrome */
    -o-animation: fadein 2s; /* Opera */
    }
    
     #skillsDiv{
    -moz-animation: fadein 2s; /* Firefox */
    -webkit-animation: fadein 2s; /* Safari and Chrome */
    -o-animation: fadein 2s; /* Opera */
    }
 	
 	#welcome02{
 	  -moz-animation: fadein 2s; /* Firefox */
    -webkit-animation: fadein 2s; /* Safari and Chrome */
    -o-animation: fadein 2s; /* Opera */
 	}
</style>
<head>
		<title>Chans Portfolio</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		 <!-- favicon 추가 -->
		 <link rel="icon" type="image/png"  href="${pageContext.request.contextPath}/resources/images/favicon/favicon.ico"/>
		<!-- 구글폰트 -->
		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
	</head>




	<body>
	

		<!-- Header -->
			<header id="header" class="alt">
				<div class="logo"><a >ChanSeon`s <span> Portfolio</span></a></div>
			
				
			
				<!-- <div id="muisicIcon"  ></div> --><a href="#menu" style="">Music</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				
				
			<div id="musicImg">
			</div>
			<span id ="musicTitle" class="title">지금은 우리가 멀리 있을지라도</span>
				<span id ="musicSinger" class="title">김광민</span>
			
			<div id="muteBtn" class="title">Mute</div>	
			</nav>

		<!-- Banner -->
			<section class="banner full">
				<article>
					<img src="${pageContext.request.contextPath}/resources/images/main_01.jpg" alt="" />
					<div class="inner">
						<header class="title">
							<div id="welcome01">
							<p>Welcome to my Portfolio Page.</p>
							<br/>
							<h3 >나는 박찬선입니다. <br/>나는 개발자입니다.</h3>
							
							</div>
							
						</header>
					</div>
				</article>
				
				<article>
					<img src="${pageContext.request.contextPath}/resources/images/main_04.jpg"  alt="" />
					<div class="inner">
						<header class="title">
							<p>I want to make it with you.</p>
							<br/>
							<h3>같이 가치있게 만들고 싶어요.</h3>
						</header>
					</div>
				</article>
				
				
				<article>
					<img src="${pageContext.request.contextPath}/resources/images/main_02.jpg" alt="" />
					<div class="inner">
						<header class = "sliderTitle title" style="">
							<p id ="careerP" style="font-size: 2rem !important;">my career.</p>
							
							<div id = "careerDiv" style="display:none;top:50%; left:50%; text-align: left;">
							
							<h4 class="career">2013.01 디큐브시티 짐보리 입사</h4>
							<br/>
							
							<h4 class="career">2019.01 더조은 IT 아카데미 </h4>
							<h5 style="text-align: center;">'하이브리드 앱 개발(IOS&안드로이드) <br/> 및 웹 개발자 양성과정' 수료</h5>
							<h4 class="career">2019.05 퓨렌스(컨플) 입사</h4>
							<h5 style="text-align: center;">Cretec, 남양유업, 삼양발브 프로젝트 진행</h5>
							</div>
							
						</header>
					</div>
				</article>
				<article>
					<img src="${pageContext.request.contextPath}/resources/images/main_03.jpg"  alt="" />
					<div class="inner">
						<header class = "sliderTitle title" style="" >
							<p id ="skillsP" style="font-size: 2rem !important;">my skills.</p>
							
							
							<div id = "skillsDiv" style="display:none;">
							
							<span class="skills">HTML5,CSS</span> <span class="grade">40%</span>
							<br/>
							<span class="skills">Javascript,jQuery</span> <span class="grade">40%</span>
							<br/>
							
							<span class="skills">Java,Spring</span> <span class="grade">40%</span>
							<br/>
							<span class="skills">Cordova</span><span class="grade">20%</span>
							&nbsp;
							<span class="skills">DHTMLX</span><span class="grade">40%</span>
							
							<br/>
							
										
							<span class="skills">Swift,AndroidStudio,Xcode</span><span class="grade">20%</span>
							<br/>
							
							
							
							<span class="skills">DBMS</span><span class="grade">MySQL,Oracle,Postgres,MariaDB,MSSQL</span>
							
							
							</div>
						</header>
					</div>
				</article>

				<%-- <article>
					<img style="transform: rotate(90deg);" src="${pageContext.request.contextPath}/resources/images/main_05.jpg"  alt="" />
					<div class="inner">
						<header>
							<p>Ipsum dolor sed magna veroeros lorem ipsum</p>
							<h2>Lorem adipiscing</h2>
						</header>
					</div>
				</article> --%>
			</section>
			
			
			
			
<section id="two" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>The reason why I chose developer as my job.</p>
						<h2>LIKE MAGICIAN..</h2>
					</header>
				</div>
			</section>


	
	<section id="three" class="wrapper style2">
				<div class="inner">
				
				<div class="myIntroduce" >
				
				<span class="title ">
				
				저는 ＜디큐브시티 짐보리＞에서 <br/><br/>
				영유아 놀이교사(센터장)로 5년을 근무하였습니다. <br/><br/>
				
				아이들도 좋아하고 일도 적성에 잘 맞았지만, <br/><br/>
				남자 교사라는 현실적인 한계점을 맞이하게 되었습니다. <br/><br/>
				
				이직을 결심하고 무엇인가를 만드는 기술을 배우고 싶다는 생각이 들었습니다. <br/><br/>
				
				사람들이 가장 많이 접하고 사용하는 웹과 앱을 만드는 방법이 궁금해졌습니다. <br/><br/>
				.<br/><br/>
				.<br/><br/>
				
				<span class="st">"이건 어떻게 만들었을까?"</span><br/><br/>
				
				.<br/><br/>
				.<br/><br/>
				
				생각하는 것을 구현해 내는 개발자들이 <br/><br/><span class="st">마법사</span> 같다는 생각이 들었고,<br/><br/>
				심혈을 기울여 기능들을 구현해 내는 모습이<br/><br/> 장인 같다는 생각이 들었습니다. <br/><br/>
				마법사같은 개발자가 되는길은 많이 어렵고 험난하지만..<br/><br/>
				오늘도 저는 장인 정신을 가진 마법사와 같은 <br/><br/>
				<span class="st">개발자</span>가 되기 위해  도전하고있습니다.
				
				</span>
				
				</div>
				
				</div>
				</section>
			
			
			
			
			<!-- Two -->
			<section id="two" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<!-- <p>These are the projects that I participated in.</p>
						<h2>2019.05 ~ </h2>
						 -->
						 
						 <p>These are the projects that I participated in.</p>
						<h2>PROJECTS.</h2>
						 
					</header>
				</div>
			</section>




		<!-- Three 프로젝트 로고 이미지 -->
			<section id="three" class="wrapper style2">
				<div class="inner">
					<c:if test="${loginUser.adminId ne null}">
					<div class = "projectManagerDiv" style="float: left;">
						<button onclick="projectManager()">프로젝트 관리</button>
					</div>
					</c:if>
					<div class="gallery">
						
						<c:forEach items="${logoList}" var ="list">
						<div>
							<div class="image fit" id ="cretecBtn" onclick="projectPopupOpen('${list.iProjectNo}')">
							<img src="<spring:url value="/imageFile/"/><c:out value="${list.iPath}${list.iName}" />" alt="" />
							
							</div>
						</div>
						
						</c:forEach>
						
						
						<%-- <div>
							<div class="image fit" id ="cretecBtn">
							<img src="${pageContext.request.contextPath}/resources/images/logo/cretec.gif" alt="" />
							
							</div>
						</div>
						<div>
							<div class="image fit">
							<img src="${pageContext.request.contextPath}/resources/images/logo/namyang.png" alt="" />
							
							</div>
						</div>
						<div>
							<div class="image fit">
							<img src="${pageContext.request.contextPath}/resources/images/logo/samyang.png" alt="" />
									
							</div>
						</div>
						 --%>
					</div>
				</div>
			</section>




		<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<!-- <ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
						
					</ul> -->
					<div class="iconsDiv">
					<a href="mailto:pro2sen@gmail.com" class="icon title"><span class="mail"></span ><span class="iconContent">pro2sen@gmail.com</span></a>
					<a href="tel:82-10-8613-5267"  class="icon title" ><span class="phone"></span><span class="iconContent">82-10-8613-5267</span></a>
					</div>
					
					
				</div>
				
				
				<div class="copyright">
					&copy; Hielo by TEMPLATED. All rights reserved.
				</div>
			</footer>


<!--  popup -->


 <div class="modal"> 
         <div class="modal-content"> 
            
             <h1 class="title">안녕하세요. <br/>
             	박찬선입니다.<br/>
             	방문해 주셔서 감사합니다.</h1> 
             	
             	<div id="start"><span>Enter</span></div>
            
         </div> 
     </div>


<!-- end popup -->




<!--  popup02 -->


 <div class="modal02"> 
         <div class="modal-content02"> 
            
             <div id ="projectName" class="title">CRETEC</div>
              <div id ="projectDate" class="title">2019.10 ~ 2020.01</div>
              <div id ="projectSummary" class="title">크레텍 고객상담 센터 상담 AP 개발</div>
             	
             	
             	<div id ="detailDiv" class="title">
             	<!-- 20200317 -->
<div class="sliderDiv">             	
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img class ="projectImg" src="${pageContext.request.contextPath}/resources/images/cretec/cretec01.jpg"
             				onclick="imgPopupOpen(this.src)">
  
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="http://placehold.it/300x100" style="width:100%">
  
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="http://placehold.it/300x100" style="width:100%">
  
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<!-- <br> -->

<div class="dotDiv" style="text-align:center">
  <span class="dot" onclick="currentSlide(1)" id = "firstDot"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>
</div>    	
             	
             	<!-- END -->
             		 <!-- 전체 wrap 감싸안으며 -->
             		<%-- <div class="slider">
   					 <div><img class ="projectImg" src="${pageContext.request.contextPath}/resources/images/cretec/cretec01.jpg"
             				onclick="imgPopupOpen(this.src)"> </div>
    				<div><img class ="projectImg"id="projectImg_0" src="${pageContext.request.contextPath}/resources/images/cretec/cretec01.jpg"
             				onclick="imgPopupOpen(this.src)"> </div>
  					</div> --%>
             		
             	<div id="contents" class="projectDetailFont">
             	
             	
             	</div>
             	
             	
             	</div>
             	
             	<div id="closeBtn"><span>Close</span></div>
             	
          
          
          
          
         </div> 
     </div>


<!-- end popup -->
		
	</body>
</html>
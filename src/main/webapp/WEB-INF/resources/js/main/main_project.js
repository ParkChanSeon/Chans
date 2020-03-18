

// 팝업 이미지 슬라이드 만들기 

function makeSlide(imageList){
	
	var imageList = imageList;
	// 이미지 만들기
	var size = imageList.length;
	
	var strSlider = '';
	var strDotDiv ='';	
	
	
	for(var i = 0 ; i < size ; i ++){
		
		var path = imageList[i].iPath;
		var fileName = imageList[i].iName;
		var srcPath = path + fileName;
		
		var finalPath = contextPath +'/imageFile' + srcPath;
		
		imageList[i].iPath = path.replace(/\\/g, "/");
		console.log(path)
		
		 strSlider += '<div class="mySlides fade">';
		 strSlider += '<div class="numbertext">'+(i+1)+' / '+(size)+'</div>';
		 strSlider += '<img class="projectImg" src="'+finalPath+'" onclick="imgPopupOpen(this.src)"></div>';
		 
		 if(i == 0){
		 strDotDiv += '<span class="dot" onclick="currentSlide('+(i+1)+')" id = "firstDot"></span>';
		 } else{
		 strDotDiv += '<span class="dot" onclick="currentSlide('+(i+1)+')"></span>'; 
		 }
	}
		strSlider += '<a class="prev" onclick="plusSlides(-1)">&#10094;</a>';
		strSlider += '<a class="next" onclick="plusSlides(1)">&#10095;</a>';	
	
	$(".slideshow-container").html(strSlider);	
	$(".dotDiv").html(strDotDiv);
	
	
	
}




// 프로젝트 정보 팝업
function projectPopupOpen(pNo){
	
	// alert("pNo : " + pNo);
	
	
	// 초기화
	$("#projectName").text("");
	$("#projectDate").text("");
	$("#projectSummary").text("");
	$("#contents").text("");
	
	$(".slideshow-container").empty();
	$(".dotDiv").empty();
	
	
	// ajax 로 정보들 가져오기.
	$.ajax({ 
		type: "GET", 
		url: contextPath +"/project/"+pNo, 
		/*data: {"pNo" : pNo},*/
		dataType : "json",
		success: function(jRes){
			
			var result = jRes;
			console.log(JSON.stringify(result))
			
			if(result.success == "Y"){
				
				var project = jRes.resData.project;
				var imageList = jRes.resData.imageList;
				
				
				// 프로젝트 타이틀
				$("#projectName").text(project.pTitle);
				// 프로젝트 기간
				$("#projectDate").text(project.pStartDate+" ~ " + project.pEndDate);
				// 프로젝트 설명
				$("#projectSummary").text(project.pSummary);
				// 프로젝트 내용
				$("#contents").text(project.pDetail);
				
				
				// console.log(imageList.length)
				
			makeSlide(imageList);
					
				
				
				modal02 = document.querySelector(".modal02"); 
				modal02.classList.toggle("show-modal");
				
				$("#firstDot").click();
			}
		 
			
			
		} // success: function(jRes) END
		});
	
    
   
	
}



var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace("active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
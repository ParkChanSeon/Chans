/**
 * 
 */


var loginUserId = "${loginUser.adminId}"

function addProject(){
	modal = document.querySelector(".modal02"); 
	modal.classList.toggle("show-modal"); 
	$("#saveBtn").prop("disabled", false);
	$("#pDetail").val("");
}

function closeBtnClick(){
	
	$("#pTitle").val("");
	$("#pStartDate").val("");
	$("#pEndDate").val("");
	$("#pSummary").val("");
	$("#pDetail").val("");
	$("#pLogoFile").val("");
	$("#pImageFiles").val("");
	
	
	
	modal = document.querySelector(".modal02"); 
	modal.classList.toggle("show-modal"); 
}


function formCheck(){

	
var pTitle = $("#pTitle").val();
var pStartDate =$("#pStartDate").val();
var pEndDate =	$("#pEndDate").val();
var pSummary = 	$("#pSummary").val();
var pDetail =	$("#pDetail").val();
var pLogoFile = $("#pLogoFile").val();
var pImageFiles = $("#pImageFiles").val();

if(pTitle =="" || pTitle.length == 0){
	alert("프로젝트 명을 입력하세요.")
	$("#pTitle").focus();
	return false;
} else if(pStartDate =="" || pStartDate.length < 10){
	alert("시작날짜를 입력하세요.")
	$("#pStartDate").focus();
	return false;
} else if(pEndDate =="" || pEndDate.length < 10){
	alert("종료날짜를 입력하세요.")
	$("#pEndDate").focus();
	return false;
} else if(pSummary =="" || pSummary.length == 0){
	alert("프로젝트 요약을 입력하세요.")
	$("#pSummary").focus();
	return false;
} else if(pDetail =="" || pDetail.length == 0){
	alert("프로젝트 내용을 입력하세요.")
	$("#pDetail").focus();
	return false;
} else if(pLogoFile =="" || pLogoFile.length == 0){
	alert("로고파일을 선택하세요.")
	return false;
} else if(pImageFiles =="" || pImageFiles.length == 0){
	alert("이미지파일을 선택하세요.")
	return false;
} else {
	return true;
}


	
	
}

// 팝업 열어 프로젝트 수정할수 있도록 하기
function openProjectPopup(pNo){
	alert(pNo + "click")
}


// 사용유무 변경 YN
function changeYn(pNo,val){
	 
	// alert("pNo : " + pNo +"\nvalue : "+ val)
	var pNo = pNo;
	var pUseYn = val;
	/*
	 * 	put 요청의 경우 
	 *  ajax 
	 *  contentType :"application/json"
	 *  JSON.stringify() 필수 
	 *  controller에서는 @RequestBody로 받아야한다.
	 *  request.parameter("")는 get,pos에서만 사용가
	 */
	$.ajax({ 
		type: "PUT", 
		url: contextPath +"/admin/projects/use", 
		contentType: "application/json",
		data: JSON.stringify({"pNo":pNo,"pUseYn":pUseYn}), 
		
		dataType : "json",
		success: function(jRes){
			
			var result = jRes;
			console.log(JSON.stringify(result))
			
			if(result.success == "Y"){
				
				alert("프로젝트 사용유무가 변경되었습니다.");
				
			}else{
				
				alert(result.result);
				
			}
			
			
			
			
		}
			
		});
	
	
	
}



$(document).ready(function(){

	$("#saveBtn").click(function(event){
		  //preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음
	    event.preventDefault();
	    
	    
	 if(formCheck()){
	   //  alert("들어옴")
	 var form = $('#saveProject')[0];

	    // Create an FormData object 
        var data = new FormData(form);

	   // disabled the submit button
        $("#saveBtn").prop("disabled", true);

        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: contextPath +"/admin/projects",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (jRes) {
            	
            	var result = jRes.result;
            	var success = jRes.success;
            	if(success =="Y"){
            	alert("complete");
                $("#btnSubmit").prop("disabled", false);
                

            	$("#pTitle").val("");
            	$("#pStartDate").val("");
            	$("#pEndDate").val("");
            	$("#pSummary").val("");
            	$("#pDetail").val("");
            	$("#pLogoFile").val("");
            	$("#pImageFiles").val("");
            	
            	
            	
            	modal = document.querySelector(".modal02"); 
            	modal.classList.toggle("show-modal"); 
                
            	// 리로드 
            	window.location.reload();
            	} else {
            		
            		alert(JSON.stringify(jRes))
            	}
            },
            error: function (e) {
                console.log("ERROR : ", e);
                $("#btnSubmit").prop("disabled", false);
                alert("fail");
            }
        });
	    
	    }   
		
	});
})

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script>
var loginUserId = "${loginUser.adminId}"
var loginDiv = false;

function loginCheck(){
	var id = $("#adminId").val();
	var pw = $("#adminPw").val();
	
	
 	if(id.length < 5){
 		if(id.length == 0){
 			alert("ID를 입력하세요.");
 			$("#adminId").focus();
 		} else {
	 		alert("5자 이상의 ID를 입력하세요.");
	 		$("#adminId").focus();
 		}
 		
 	} else if(pw.length == 0){
 		
 		alert("PASSWORD를 입력하세요.");
 		$("#adminPw").focus();
 	}else{
 		
 		
 		$.ajax({ 
			type: "POST", 
			url: "${pageContext.request.contextPath}"+"/post/admin/login", 
			data: {"id" : id,
				   "pw" : pw
					}, 
			
			dataType : "json",
			success: function(jRes){
				
				var result = jRes;
				console.log(JSON.stringify(result))
				
				if(result.success == "Y"){
					
					alert("로그인 성공!");
					window.location.href= "${pageContext.request.contextPath}";
					
					
				
			} else if( result.result == "Exception"){
				alert("Exception");
			} else if( result.result == "Password Error" || result.result == "Id Error"){
				alert("아이디 또는 비밀번호를 확인하세요!");
			} else if(result.result == "PARAM Error"){
				alert("PARAM Error");
			}
				
				
				
				
			} // success: function(jRes) END
			});
 		
 		
 		
 	
 	
 	
	
}

}

// 관리자 추가 버튼 
function regBtnClick(){
		if(loginUserId == ""){
		$(".loginDiv").css("display","none");
		$(".regDiv").css("display","inline-block");
		
		} else {
			
			
			
			$(".logOutDiv").css("display","none");
			if(!loginDiv){
			$(".wrapDiv").append('<div class="loginDiv"><input type="text" id="adminId" placeholder="ID">'+
								 '<input type="password" id ="adminPw"  placeholder="PASSWORD">'+
								 '<button id="loginBtn" onclick="loginCheck()">Sign In</button>'+ 
								 '<button id="regBtn" onclick="regBtnClick()">Sign Up</button></div>'+
								 '<div class="regDiv"><input type="text" id="regId" placeholder="ID">'+
								 '<input type="password" id ="regPw"  placeholder="PASSWORD">'+
								 '<input type="password" id ="confirmPw"  placeholder="관리자 비밀번호">'+
								 '<button id="regBtn02" onclick="regBtn02Click()">Sign Up</button>'+
								 '<button id="cancelBtn" onclick="cancelBtnClick()">Cancel</button></div>');
			loginDiv = true;
			}
			$(".loginDiv").css("display","none");
			$(".regDiv").css("display","inline-block");
		
		}
		
		
	
}

function cancelBtnClick(){
	if(loginUserId == ""){	
		$(".regDiv").css("display","none");
		$(".loginDiv").css("display","inline-block");
		
		$("#regId").val("");
		$("#regPw").val("");
		$("#confirmPw").val("");
	} else {
		$("#regId").val("");
		$("#regPw").val("");
		$("#confirmPw").val("");
		$(".regDiv").css("display","none");
		$(".logOutDiv").css("display","inline-block");
	}
	
}



// 관리자 추가 등록 버튼
function regBtn02Click(){
	
	var regId =  $("#regId").val().trim();
	var regPw = $("#regPw").val().trim();
	var confirmPw = $("#confirmPw").val().trim();
	
	
	if(regId.length < 5 ){
		
		if(regId.length == 0){
 			alert("ID를 입력하세요.");
 			$("#regId").focus();
 		} else {
	 		alert("5자 이상의 ID를 입력하세요.");
	 		$("#regId").focus();
 		}
		
	} else if(regPw.length == 0){
			alert("PASSWORD를 입력하세요.");
	 		$("#regPw").focus();
		
	} else if(confirmPw.length == 0){
			alert("관리자 비밀번를 입력하세요.");
	 		$("#confirmPw").focus();
	} else {
		
		
		$.ajax({ 
			type: "POST", 
			url: "${pageContext.request.contextPath}"+"/post/registration/admin", 
			data: {"regId" : regId,
				   "regPw" : regPw,
				   "confirmPw" : confirmPw
					}, 
			
			dataType : "json",
			success: function(jRes){
				
				var result = jRes;
				console.log(JSON.stringify(result))
				
				if(result.success == "Y"){
					
					alert("관리자 등록 성공!");
					
					$("#regId").val("");
					$("#regPw").val("");
					$("#confirmPw").val("");
					
					
					
					$(".regDiv").css("display","none");
					
					
					if(loginUserId != ""){
						$(".logOutDiv").css("display","inline-block");	
						
					}else{
						$(".loginDiv").css("display","inline-block");
					}
					
				}else{
					
					if(result.result == "SignUp Error"){
						alert("관리자 등록 실패!!");
					}else if(result.result == "ConfirmPw Error"){
						alert("관리자 비밀번호를 잘못 입력하였습니다.")
						$("#confirmPw").focus();
					}else if (result.result == "Id Duplication"){
						alert("해당 아이디는 이미 사용중입니다.")
						$("#regId").focus();
					}else if (result.result == "Parameter Error"){
						alert("PARAM ERROR!");
						
					} else if (result.result == "SignUp Error"){
						alert("DB ERROR!");
						
					} else if( result.result == "Exception"){
						alert("Exception");
					}
					
				}
				
				
				
				
			}
				
			});

		
		
		
	}
	
		
	
	
	// 성공시
	/* $(".loginDiv").css("display","inline-block");
	$(".regDiv").css("display","none"); */
	
	
}
function logOutBtnClick(){
	
	if(confirm("로그아웃 하시겠습니까?")){
		$.ajax({ 
			type: "POST", 
			url: "${pageContext.request.contextPath}"+"/logout", 
			dataType : "json",
			success: function(jRes){
				
			if(jRes.success == "Y"){
				console.log(JSON.stringify(jRes))
				if(jRes.resData.result == "1"){
				alert("로그아웃 성공!!");
				
				/* loginUserId = "";
				loginDiv = false;
				
				$(".logOutDiv").css("display","none");
				$(".loginDiv").css("display","inline-block");
				$(".regDiv").css("display","none"); */
				
				window.location.href= "${pageContext.request.contextPath}";
				
				}
				
			}
				
			}
		});
				
	}
	
	
}
</script>


<style>
html, body {

    margin: 0;

    height: 100%;

    overflow: hidden;

}

.loginDiv{
	display: inline-block;
    width: 200px;
    height: 200px;
    margin: auto;
   
    border: 2px solid white;
    border-radius: 20px;
    padding: 50px 50px 50px 50px;
}
.regDiv{
	display: none;
    width: 200px;
    height: 225px;
    margin: auto;
   
   border: 2px solid white;
    border-radius: 20px;
    padding: 50px 50px 50px 50px;
}

.logOutDiv{
	display: inline-block;
    width: 200px;
    height: 200px;
    margin: auto;
   
    border: 2px solid white;
    border-radius: 20px;
    padding: 50px 50px 50px 50px;
}
input {
padding-left:15px;
border:1px solid black;
}



#adminId{
width:100%;
height: 30px;
border-radius: 20px;


}

#adminPw{

width:100%;
height: 30px;
border-radius: 20px;
margin-top: 30px;

}
#loginBtn{
border-radius: 20px;
margin-top: 30px;
width: 200px;
height: 30px;
background-color:black;
color:white;
border : 1px solid black;
}

#regBtn{
border-radius: 20px;
margin-top: 30px;
width: 200px;
height: 30px;

background-color:gray;
color:white;
border : 1px solid gray;
}

#regId{
width:100%;
height: 30px;
border-radius: 20px;
}

#regPw{
width:100%;
height: 30px;
border-radius: 20px;
margin-top:20px;
}

#confirmPw{
width:100%;
height: 30px;
border-radius: 20px;
margin-top:20px;
}



#regBtn02{
border-radius: 20px;
margin-top: 20px;
width: 200px;
height: 30px;

background-color:black;
color:white;
border : 1px solid black;
}
  
#cancelBtn{
border-radius: 20px;
margin-top: 20px;
width: 200px;
height: 30px;

background-color:gray;
color:white;
border : 1px solid gray;
}

#logOutBtn{
border-radius: 20px;
margin-top: 20px;
width: 200px;
height: 30px;

background-color:red;
color:white;
border : 1px solid red;
}
.wrapDiv{
width:100%; 
height: 100%;
text-align: center;
display:flex;
background-color: #00000099;
}
</style>

</head>



<body >

<div class ="wrapDiv" >

<c:if test="${loginUser.adminId eq null}" >

<div class="loginDiv">

<input type="text" id="adminId" placeholder="ID">



<input type="password" id ="adminPw"  placeholder="PASSWORD">


<button id="loginBtn" onclick="loginCheck()">Sign In</button>
<button id="regBtn" onclick="regBtnClick()">Sign Up</button>
</div>



<div class="regDiv">

<input type="text" id="regId" placeholder="ID">

<input type="password" id ="regPw"  placeholder="PASSWORD">

<input type="password" id ="confirmPw"  placeholder="관리자 비밀번호">

<button id="regBtn02" onclick="regBtn02Click()">Sign Up</button>
<button id="cancelBtn" onclick="cancelBtnClick()">Cancel</button>
</div>
</c:if>
<c:if test="${loginUser.adminId ne null}" >

<div class="logOutDiv">
<h3 style="color:blue">${loginUser.adminId}</h3>
<span id ="userInfoSpan">로 접속중입니다. </span>
<button id = "logOutBtn" onclick="logOutBtnClick()">LOG-OUT</button>

<button id="regBtn" onclick="regBtnClick()">Sign Up</button>
</div>
</c:if>

</div>
</body>



</html>
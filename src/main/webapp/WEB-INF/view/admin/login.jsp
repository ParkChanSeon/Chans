<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script>



function loginCheck(){
	var id = $("#adminId").val();
	var pw = $("#adminPw").val();
	
 	console.log("id : " + id);
 	console.log("pw : " + pw);
 	
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
 		
 		
 		alert("로그인 체크");
 	}
 	
 	
	
}


function regBtnClick(){
	
	
	
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
   
    border: 1px solid black;
    border-radius: 20px;
    padding: 50px 50px 50px 50px;
}


input {
padding-left:15px;
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

}

#regBtn{
border-radius: 20px;
margin-top: 30px;
width: 200px;
height: 30px;

background-color:gray;
color:white;

}

.wrapDiv{
width:100%; 
height: 100%;
text-align: center;
display:flex;
}
</style>

</head>



<body >

<div class ="wrapDiv" >
<div class="loginDiv">

<input type="text" id="adminId" placeholder="ID">



<input type="password" id ="adminPw"  placeholder="PASSWORD">


<button id="loginBtn" onclick="loginCheck()">Sign In</button>
<button id="regBtn">Sign Up</button>
</div>
</div>
</body>



</html>
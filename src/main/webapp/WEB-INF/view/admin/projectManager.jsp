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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/projectManager.css">


<script>
var contextPath = "${pageContext.request.contextPath}";
</script>

<script src="${pageContext.request.contextPath}/resources/js/projectManager/projectManager.js"></script>


<style>
html, body {

  /*   margin: 0;
	width: 100%;
    height: 100%; */
   

}

</style>

</head>

<header>
<div class = "title_header">
<h2>My Projects.</h2>
</div>
</header>

<body >


<section id = "main">



<div class="table_div">

<div class ="btn_div">

<button type="button" class="btn btn-default" onclick="addProject()"> 프로젝트 추가</button>

</div>
<table id = "board_table" class ="table-striped">
<tr style="border-bottom:3px solid black;">
<th style="width:50px; border-right: 3px solid black;">NO</th>
<th style="width:350px; border-right: 3px solid black;">프로젝트  명</th>
<th style="width:160px; border-right: 3px solid black;">기간</th>
<th style="width:140px; border-right: 3px solid black;">업로드 날짜</th>
<th style="width:143px; " class= "lastT">사용유무</th>
</tr>

<c:forEach items="${projectList}" var ="list">
<tr >
<td>${list.pNo}</td>
<td><div class="pTitleDiv" onclick="openProjectPopup('${list.pNo}')"><a>${list.pTitle}</a></div></td>
<td>${list.pStartDate}~${list.pEndDate}</td>
<td class="uploadDate">${list.pCreateDate} ${list.pCreateTime}</td>
<td class= "lastT">
<select onchange="changeYn('${list.pNo}',this.value)">
	
	<c:if test ="${list.pUseYn eq 'Y'}">
	<option value="Y" selected="selected">Y</option>
	<option value="N">N</option>	
	</c:if>
	
	<c:if test ="${list.pUseYn ne 'Y'}">
	<option value="Y" >Y</option>
	<option value="N" selected="selected">N</option>	
	</c:if>
</select>
</td>

</tr>
</c:forEach>


</table>


<div class="page_number">
 <c:if test="${page.hasArticles()}">
  <ul class="pagination">
  
    
   <c:if test="${page.startPage > 5}">
   <li>
      <a href="${pageContext.request.contextPath}/?pageNo=${page.startPage - 5}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    
    <c:forEach var = "pNo" begin = "${page.startPage}" end ="${page.endPage}">
    
    <li><a href="${pageContext.request.contextPath}/?pageNo=${pNo}">${pNo}</a>
    
    </c:forEach>
 
 	<c:if test="${page.endPage < page.totalPages}">
 	 <li>
      <a href="${pageContext.request.contextPath}/?pageNo=${page.startPage + 5}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </c:if>
    
  </ul>
  </c:if>
  </div>
  
</div> 


<!--  popup02 -->


 <div class="modal02"> 
 			
         <div class="modal-content02"> 
            <h2 style="border-bottom: 1px solid #000000a3; color: gray;">새로운 프로젝트 추가</h2>
        
        <form id = "saveProject" method="POST" enctype="multipart/form-data">
             <div class= "formInnerDiv">
             <label class="pLabel">프로젝트 명</label>
             <input type="text" id="pTitle" name="pTitle" maxlength="30"/>
             </div>
             <div class= "formInnerDiv">
             <label class="pLabel">프로젝트 시작</label>
             <input type="date" id="pStartDate" name="pStartDate" />
             </div>
             <div class= "formInnerDiv">
             <label class="pLabel">프로젝트 종료</label>
             <input type="date" id="pEndDate" name="pEndDate" />
             </div>
             <div class= "formInnerDiv">
             <label class="pLabel">프로젝트 요약</label>
             <input type="text" id="pSummary" name="pSummary" maxlength="100"/>	
             </div>	
             	
             <div class= "formInnerDetailDiv">
             <label class="pDtailLabel">프로젝트 내용</label>
             <textarea id="pDetail" name="pDetail" cols="40" rows="10" >	
             
               
             </textarea>
             
             </div >
             
              <div class= "formInnerDiv">
                  <label class="pLabel">프로젝트 로고</label>
             <input type="file" id="pLogoFile" name="pLogoFile"/>
             </div>
             
             <div class= "formInnerDiv">
                  <label class="pLabel">프로젝트 이미지</label>
             <input type="file" id="pImageFiles" name="pImageFiles[]" multiple="multiple" />
             </div>
             
             
             <div class= "formInnerBtnDiv" style="text-align: center;">
             	<input type ="submit" id="saveBtn" name = "saveBtn" value="저장"/>
             	<input type ="button" id="closeBtn" value="닫기" onclick="closeBtnClick()"/>
             </div>	
          </form>
          
          
          
         </div> 
     </div>


<!-- end popup -->
		
</section>



</body>



</html>
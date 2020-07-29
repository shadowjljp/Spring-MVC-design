<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--HeaderFooter Css-->
<link rel="stylesheet" href="<c:url value="/component/css/base.css"/>">
<link rel="stylesheet" href="<c:url value="/component/css/layout.css"/>">
<link rel="stylesheet" href="<c:url value="/component/css/main.css"/>">
<link rel="stylesheet"
	href="<c:url value="/component/css/headerAndFooter.css"/>">
<!--HeaderFooter Css   End!-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<!--memberCenter Css-->
<link rel="stylesheet" href="<c:url value="/component/css/memberCenter.css"/>">
	<script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/component/js/jquery-ui-effect.min.js"/>"></script>

<style>
.centralized {
	margin-top:20px;
	margin-top: 100px;
	width: 100vh;
	height:100vh;
	display: block;
	margin-left: auto;
	margin-right: auto;
	font-size:1.5em;
	
	
	
}
 /*P標簽樣式*/
#finish {
 text-align :center; /*居中*/
 font-size:1.5em;     /*字體大小*/
 color:black;          /*字體顏色*/
}
#jump{
 text-align :center; /*居中*/
 font-size:1.1em;
 color:black;          /*字體顏色*/
}
 #b2{
    width:100%;
    height:80%;
    padding:1%;
    font-size:1.2em;
    float:right;
}
table{
margin-top:auto;
margin-left:auto;
margin-right:auto;
}
</style>
<title>Order Completed back to Index</title>

  <script type="text/javascript" >
        onload = function () {
            var span = document.getElementById("second");
            // setInterval就是開啟一個計時器，里面傳入一個方法和一個時間
            // 表示每隔這個時間間隔調用一次這個方法
            var intervalId = setInterval(function () {
                // var num = span.innerHTML - 1;    //等價下面三行
                //innerHTML：獲得或設置一個標簽下的內容（內容可以是HTML格式的）：
                var numstr = span.innerHTML;
                var num = parseInt(numstr);
                num--;

                span.innerHTML = num;

                if (num <= 0) {
                    // 停下計時器
                    clearInterval(intervalId);
                   
                    location.href = "<c:url value="/index.jsp"/>";
                }
            }, 300);

        };
    </script>
</head>
<body>
<div class="wrapper">
		<c:import url="/partial/header.jsp"></c:import>
		<%@include file="../partial/memberCenter.jsp"%>
	<div class="container">
	
		<div class="centralized">
			<form action="<c:url value="/index.jsp"/>">
			<table >
		<tr><td><p id="finish">您的訂單已經完成</p></td></tr>
		 <tr><td><p id="jump"><span id="second">3</span>秒后跳轉至首頁</p></td></tr>
		 <tr><td><button class="search-btn" type="submit" id="b2" >直接回首頁</button></td></tr>
		 </table>
			</form>
			<!-- ---------------------------------------------------- -->
		

</div>



</div>
		<%@ include file="../partial/footer.jsp"%>
</div>

</body>
</html>
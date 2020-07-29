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

.othersAlsoBuy {
	width: 250px;
	background-color: #EBA3A3;
	margin-bottom: 0px;
	border-radius: 5px;
	display: inline;
	padding: 5px 15px 3px 15px;
	height:6vh;
}
.info1 {
	border: solid #E0E0E0 1px;
	padding: 10px;
	margin-top: 3px;
}
.paragh6,#five{
	margin-top:5vh;
}
.othersAlsoBuy+td{
	height:6vh;
}
#seven{
margin-top:3vh;
}
table td{
border-collapse:collapse;
border-spacing:10vh;
}
#b2{
    width:100%;
    height:100%;
    padding:1%;
    font-size:1.2em;
    float:right;
}
#b1{
    width:60%;
    margin-right:5%;
    height:82%;
    padding:1%;
    float:right;
    border-radius: 15px 0px 0px 15px;
    padding-bottom: 0px;
}
#nine td {
        margin-bottom:12%;
        width:17vh;
        height:7vh;
        padding-bottom: 0px;
        padding-top:5vh;
} 
#nine table{
float:right;
}
</style>
<title>Order Completed</title>


</head>
<body>
<div class="wrapper">
		<c:import url="/partial/header.jsp"></c:import>
		<%@include file="../partial/memberCenter.jsp"%>
	<div class="container">
		<div class="centralized">
	<form action='<c:url value="/finish.controller" />' method="post">
		<table>
		<tr>
		<td  class="othersAlsoBuy">您的配送方式:</td><td>${shipping }</td>
		</tr>
		<tr>
		<td  class="othersAlsoBuy">您的付款方式:</td><td>${payment }</td>
		</tr>
		
		</table>
		<!-- 訂購人資訊以下 -->
		<div id="five">
		<div class="underline">
					<h4 class="othersAlsoBuy">訂購人資訊</h4>
				</div>
				<div class="info1">
							<table>
								<tbody><tr>
									<td><label>姓名</label></td>
									<td>${memberName}</td>
									
								</tr>
								<tr>
									<td>聯絡電話:&emsp;</td>
									<td>${memberMobile}</td>
								</tr>
								<tr>
									<td>E-mail</td>
									<td>${memberEmail }</td>
								</tr>
							</tbody></table>
						</div>
						</div>
		<!------------ 以下為收件人資訊 -->
							<div class="paragh6" id="six">
			<div id="test1">
				<div class="underline">
					<h4 class="othersAlsoBuy">收件人資訊</h4>
				</div>	
						<div class="info1">
							<table>
								<tr>
									<td>收件人</td>
									<td>${receiverName }</td>
									
								</tr>
								<tr>
									<td>聯絡電話:&emsp;</td>
									<td>${receiverMobile }</td>
								</tr>
								<tr>
									<td>E-mail</td>
									<td>${receiverEmail }</td>
								</tr>
	
								
								
							</table>
							
						</div>
						</div>
			</div>
			<!-- -----------以下為收件地址 -->
			<div>
			<h4 class="othersAlsoBuy">收件地址</h4><span id="userAddress">${ZipCode } &emsp; ${City }${RoadStreet }${lSS }段
			<c:if test="${not empty fn:trim(txtLL)}">${txtLL}巷</c:if><c:if test="${not empty fn:trim(txtAA)}">${txtAA}弄</c:if>
			<c:if test="${not empty fn:trim(txtNN)}">${txtNN}號</c:if><c:if test="${not empty fn:trim(txtEE)}">之 ${txtEE}，</c:if>
			<c:if test="${not empty fn:trim(txtFF)}">${txtFF}樓</c:if><c:if test="${not empty fn:trim(txtDD)}">之${txtDD}， </c:if>
			<c:if test="${not empty fn:trim(txtRR)}">${txtRR}室</c:if>
			</span>
			<input type="hidden" id="hiddenAddress" name="hiddenAddress" value="">
			</div>
			<!-- 以下為發票資訊 -------------------------->
			<div id="seven">
				<div class="underline" >
					<h4 class="othersAlsoBuy">發票資訊 </h4><span>${invoice }</span>
				</div>
				
			</div>
		
			<!-- -------以下為送出資料進database--------- -->
				<div id="nine">
				<table>
				<tr>
				<td>
				<button class="btn btn-secondary" id="b1">上一步</button>	
				</td>
				<td>
				<button class="search-btn" type="submit" id="b2">完成訂單</button>
				</td>
				</tr>
				</table>
			</div>
			<!-- ---------------------------------------------------- -->
		</form>

</div>



</div>
		<%@ include file="../partial/footer.jsp"%>
</div>
<script>
$(function(){
	var address=$('#userAddress').text()
	console.log(address)
	$('#hiddenAddress').val(address)
	
	//------------以下按了匯回到上一頁--------------
		$('#b1').click(function(){
	 parent.history.back();
     return false;
						})
//-----------------------ending---------------------	
})

</script>
</body>
</html>
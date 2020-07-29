<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/component/css/base.css"/>">
<link rel="stylesheet" href="<c:url value="/component/css/layout.css"/>">
<link rel="stylesheet" href="<c:url value="/component/css/headerAndFooter.css"/>">
<title>shoppingCart</title>

<style>


header {
	display: block;
}
body{
background-color:rgb(255, 249, 239);
}
#myTable {

	padding-right: 0px;
	margin-right: 0px;
}

table td {
	padding-top: 10px;
	width: 200px;
	border-radius: 10px;
	text-align: center;
	line-height: 10vh;
	vertical-align: top;
}

legend {
	border: 1px solid rgb(230, 192, 192);
	background-color: gold;
	text-align: center;
	width: 10%;
}

.goal {
	-webkit-filter: sepia(50%);
	margin-top: 50px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 70%;
}

p {
	color: black;
}

.topgray {
	background-color: rgb(230, 192, 192);
	text-align: center;
}

.buttomgray {
	background-color: rgb(230, 192, 192);
	text-align: center;
}

.prodimg {
	width: 10vh;
	height: 10vh;
/* 	border: solid 2px pink; */
	text-align:top;
	padding-bottom:0px;

}
img{
display: block;
}

.centralized {
margin-top: 50px;
	width: 1200px;
	display: block;
	margin-left: auto;
	margin-right: auto;

}

.buttom {
	padding: 20px;
	margin-left: 400px;
	padding-top: 50px;
}

.buttom button {
	color: black;
}

#cash {
	padding: 10px;
	background-color: orange;
	margin-left: 30px;
}

#b_amount {
	width: 50%;
}

.extrabuy {
	margin-top: 50px;
}

.othersAlsoBuy {
	width:250px;
	background-color: #EBA3A3;
margin-bottom:0px;
}
.extraProdimg{
	width: 180px;
	height: 180px;
	
}
.nextPage{
float:right;
}
.underline{
border-bottom: solid 2px #EBA3A3;
}
.item{
margin-top:30px;
padding:5px;
margin-left:40px;
border:2px solid gray;
width:250px;
height:380px;
display: inline-block;
}

.nextPage{
	width:200px;
	margin-left:580px;
}
.keepbuying{
	padding:5px;
}
.td1{
	width:40%;
}
.td2{
	width:12%
}
.td3{
	width:12%
}
.td4{
	width:12%
}
.td5{
	width:12%
}
.bookName{
padding-top:0px;
line-height:5vh;
text-align:center;
}
</style>
</head>
<body>
	<div class="wrapper"> 
    <c:import url="/partial/header.jsp"></c:import>

	<div class="goal">
		<img src="<c:url value="/images/ShoppingStage1.png"/>"/>
	</div> 
	<!-- header ends here,  header ends here,   header ends here,   header ends here, 	  header ends here, -->
	<div class="centralized">
		<div>
		
			<c:if test="${not empty (user.memname)}"><p>親愛的${user.memname}會員您好:</p></c:if>


		</div>
<!-- 			<legend>購物明細</legend> -->
			<hr />
			<form action="<c:url value="/shoppingCart_transit.controller" />" method="post">
			<table id="myTable">
			<thead>
				<tr class="topgray">
					<!--<td>勾選處</td> -->
					<td colspan="2" class="td1">商品明細</td>
					<td class="td2">優惠價</td>
					<td class="td3">數量</td>
					<td class="td4">小計</td>
					<td class="td5">庫存</td>
					<td class="td6">變更明細</td>
				</tr>
					</thead>
					<tbody>
				<tr class="merchandise1">
					<!--<td><input type="checkbox" class='chk' /></td> -->


					<td class="prodimg"><img src='${book.prodimg }' /></td>

					<td class="bookName">${book.bknamezh }<c:if test="${not empty (book.status)}"><br><br>此為${book.status }版本</c:if></td>


					<td>${book.prodprice }</td>


					<td><c:if test="${not empty (book.status)}"><input type="number" value="1" step="1" id="count"
						name="b_amount1" min="1" max="100" />本</c:if></td>
					<label for="b_amount1"></label>
					<td class="money"></td>
					

					<td id="subtotal">${book.prodstock }</td>

					<td><c:if test="${not empty (book.status)}"><button id="delete" type="button"
							onclick="deleteOne()">移除商品</button>
						<button onclick="buyNextTime()">下次再買</button></c:if></td>

				</tr>
				<tr class="buttomgray">
					<%--<td>全選<input type="checkbox"  id="toggleme"  onClick="toggle(this)" /></td> --%>
					<td colspan="2">
						<button type="button" onclick="deleteAll()">刪除全部商品</button>
						<button type="button" onclick="hopelistAll()">整批加入願望清單(下次再買)</button>
					</td>
					<td colspan="5">
						<%--重量一共 171 公克 table=product, Book_weight --%>
					</td>

				</tr>
				</tbody>
			</table>

			<br />

			<div>
			<div class="nextPage">
			<table id="myTable1">
			<tr><td class="filler" colspan="10"></td><td><button class="keepbuying" onclick="buyMore()">繼續選購</button></td><td><button type="submit" id="cash">結帳</button></td></tr>
			
			</table>
			</div>
			</div>
		<input type="hidden" class="moneyPass" name="productPrice" value=""/>
		</form>

<!-- 以下為 額外購買區--------------------------------------------------------- -->
 		<div class="extrabuy"> 
			
				<div class="underline">
					<h4 class="othersAlsoBuy">其他人也買了這些產品</h4>
				</div>
				<div class="item">
					<a class="extraProdimg"><img src="<c:url value="/component/images/SampleImage.jpg" />"></a>
					<h5>產品說明</h5>

					<p>
						優惠價 $475 元,加購價 <span>399元</span>
					</p>
					<p>
						<span>數量</span> <select class="count">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select> <a class="" href="" onclick="">
							
						</a>
						</p>
						</div> 
<!-- 						sitem1 ends -->
						<div class="item">
						<a class="extraProdimg"><img src="<c:url value="/component/images/SampleImage.jpg"/>" alt="產品圖片放置處" ></a>
					<h5>產品說明</h5>

					<p>
						優惠價 $475 元,加購價 <span>399元</span>
					</p>
					<p>
						<span>數量</span> <select class="count">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select> <a class="" href="" onclick="">
						
						</a>
						</p>
						</div>  
<!-- 						item2 ends -->
							<div class="item">
						<a class="extraProdimg"><img src="<c:url value="/component/images/SampleImage.jpg"/>" alt="產品圖片放置處" /></a>
					<h5>產品說明</h5>

					<p>
						優惠價 $475 元,加購價 <span>399元</span>
					</p>
					<p>
						<span>數量</span> <select class="count">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select> <a class="" href="" onclick="">
						
						</a>
						</p>
						</div>  
<!-- 						第三個物品結束 -->
							<div class="item">
						<a class="extraProdimg"><img src="<c:url value="/component/images/SampleImage.jpg"/>" alt="產品圖片放置處" ></a>
					<h5>產品說明</h5>

					<p>
						優惠價 $475 元,加購價 <span>399元</span>
					</p>
					<p>
						<span>數量</span> <select class="count">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select> <a class="" href="" onclick="">
<!-- 							"processDivShow();addProdToCart('N000762845' , $('#qty_N000762845').val(), '399','PKG0098678' , '10');" 放入購物車 -->
						</a>
						</p>
						</div>
		</div>
 </div>
    	<%@include file="../partial/memberCenter.jsp"%>
      <%@ include file="../partial/footer.jsp"%>
</div>
<script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/component/js/jquery-ui-effect.min.js"/>"></script>
<script>
$(function() {
	var count = $('#count').val()
	var price=${book.prodprice }
	var price1=$('.moneyPass').val(count*price)
// 	console.log(count)
// 	console.log(price)
console.log('price1= '+price1)
	$('.money').text(count*price)
	
 	$('#count').on('click',function(){
 		 count = $('#count').val()
 		$('.money').text(count*price)
 		 $('.moneyPass').val(count*price)
 	})
	
	$('.keepbuying').click(function(){
		window.location.href = '<c:url value="/index.jsp" />'
	})
	
	$('#cash').click(function(){
		window.location.href = '<c:url value="/pages/Checkout.jsp" />'
	})
	
	
	
}) 

// function  buyMore(){
// 	location.href='../index.jsp';
// 	return false;
// }
// function deleteAll(){
// 	alert("deleteAll")
// }
// function hopelistAll(){
// 	alert("hopelistAll")
	
// }

// function buyNextTime(){
// 	alert("buyNextTime")
// }
// function deleteOne(){
// 	alert("deleteOne(this)")
// }

</script>
</body>
	

</html>
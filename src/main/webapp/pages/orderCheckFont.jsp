<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet"
	href="<c:url value="/component/css/memberCenter.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/component/css/datatables.css"/>" />
<script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/component/js/jquery-ui-effect.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/component/js/datatables.min.js"/>"></script>
<style>
.wrapper{
height:200vh;
}
.centralized {
	margin-top: 10px;
	padding-left: 5%;
	display: block;
	height:1000vh;
}

.underline {
	margin-top: 100px;
	border-bottom: solid 2px #EBA3A3;
}

.othersAlsoBuy {
	width: 250px;
	background-color: #EBA3A3;
	margin-bottom: 0px;
	border-radius: 5px;
	display: inline;
	padding: 5px 15px 3px 15px;
}

.topgray {
	background-color: rgb(230, 192, 192);
	text-align: center;
}

/* td:after { */
/* 	position: absolute; */
/* 	bottom: 0; */
/* 	left: 0; */
/* } */

table.MainTable td {
	border: 1px solid black;
	text-align: center;
	width: 64px;
	height: 64px;
	position: relative;
	vertical-align: middle;
}

table.MainTable {
	width: 153vh;
}

.topInfo {
	float: right;
}

.date {
	padding-right: 60px;
	padding-left: 60px;
}

.merchandise1 {
	text-align: center;
	width: 50%;
	line-height: 30px;
}

.merchandise2 {
	width: 10%;
	text-align: center;
	line-height: 30px;
}

.merchandise3 {
	width: 10%;
}

.merchandise4 {
	width: 15%;
}

.merchandise5 {
	width: 15%;
}

.prodimg {
	width: 180px;
	height: 180px;
	border: solid 2px pink;
}

.orderType {
	width: 20%;
	font-size: 1.5em;
	margin: 10px;
}

.page-container {
	position: absolute;
}

.orderTimeRange, .merchandise1, .merchandise2, .merchandise3,
	.merchandise4, .merchandise5, td {
	font-size: 1.5em;
}
.topFunction,topFunction1{
	display:inline;
}
.topFunction1{
float:right;
	
}
#b2{
width:5vw;
}
</style>
<title>訂單查詢</title>
</head>

<body>
	<div class="wrapper">
		<%--   <%@ include file="../partial/header.jsp"%> --%>
		<c:import url="/partial/header.jsp"></c:import>
		<%@include file="../partial/memberCenter.jsp"%>
		<!-- header ends here,  header ends here,   header ends here,   header ends here, 	  header ends here, -->

		<!-- 側邊功能攔到此結束     -->
		<div class="container">
			<div class="centralized">
				<div class="topFunction">
					<select class="orderTimeRange" name="Time">
						<option selected value="three">最近三個月的訂單</option>
						<option value="longer">三個月以上的訂單</option>
						<option value="unlimited">全部的訂單</option>

					</select> <select class="orderType" name="category">
						<option value="all">全部訂單</option>
						<option selected value="electric">電子書</option>
						<option value="solid">實體書</option>
					</select>
					<div class="topFunction1">
					<button class="search-btn" type="submit" id="b2" >回首頁</button>
					</div>
				</div>
				<div class="topInfo">
					<!--             <span> 共1筆，顯示1-1筆</span> -->
					<!--<span class="D-b Mt-14 Mb-40 EC-C-betweenlightgrey">共<span class="EC-C-red">1</span>筆，顯示1-1筆   <a class="Mstart-10 EC-C-linkblue Fz-15 D-n" href="orderList?offset=1&amp;type=&amp;filterType=" data-rapid_p="32">下10筆 &gt;</a></span>-->

				</div>
				<div class="underline">
					<h4 class="othersAlsoBuy">
						<img />訂單查詢
					</h4>
				</div>

				<div class="tableSet">
					<table class="MainTable" id="myTable">
						<thead>
							<tr class="topgray">
								<!--<td>勾選處</td> -->
								<td class="merchandise1" colspan="2">商品明細</td>
								<td class="merchandise2">實付金額</td>
								<td class="merchandise3">狀態</td>
								<td class="merchandise4">訂購日</td>
								<td class="merchandise5">訂單發票</td>
							</tr>
						</thead>
						<tbody>
							<!--                 <tr> -->
							<!--                     <td class="prodimg">產品圖片放置處</td> -->
							<!--                     <td><input type="text" readonly name="productName" -->
							<!-- 						placeholder="產品解說"/></td> -->
							<!--                     <td></td> -->
							<!--                     <td></td> -->
							<!--                 </tr> -->
						</tbody>
					</table>

				</div>
			</div>
		</div>
		
		<%@ include file="../partial/footer.jsp"%>


		<!-- wrapper -->
	</div>

	<script>
		$(document)
				.ready(
						function() {

							$('.orderTimeRange, .orderType')
									.on(
											'click',
											function() {

												var time = $('.orderTimeRange')
														.val()
												var category = $('.orderType')
														.val()
												console.log(category)
												console.log(time)
												//memid 之後要用接的
												var memid = 3;
												//memid 之後要用接的
												console.log(memid)
												$
														.get(
																'../fontOrderCheck.controller',
																{
																	"time" : time,
																	"category" : category,
																	"memid" : memid
																},
																function(
																		frontOrderCheck) {
																	$(
																			'#myTable>tbody')
																			.empty();
																	$(
																			'#myTable')
																			.DataTable(

																					frontOrderCheck
																							.forEach(function(
																									bean) {
																								//    					console.log(bean.size)
																								var cell1 = $(
																										"<td class="+"merchandise1"+"></td>")
																										.text(
																												bean.bknamezh);
																								//	 var image = $filter(bean.prodimg)($scope.picture );
																								var cell2 = $(
																										"<td class="+"merchandise1"+"></td>")
																										.html(
																												"<img src='"+bean.prodimg+"' />");
																								var cell3 = $(
																										"<td class="+"merchandise2"+"></td>")
																										.text(
																												bean.orderamount);
																								var cell4 = $(
																										"<td class="+"merchandise3"+"></td>")
																										.text(
																												bean.shippingstate);
																								var cell5 = $(
																										"<td class="+"merchandise4"+"></td>")
																										.text(
																												bean.orderdate);
																								var cell6 = $(
																										"<td class="+"merchandise5"+"></td>")
																										.text(
																												bean.invoicenum);
																								var row = $(
																										'<tr></tr>')
																										.append(
																												[
																														cell1,
																														cell2,
																														cell3,
																														cell4,
																														cell5,
																														cell6 ]);
																								$(
																										'#myTable>tbody')
																										.append(
																												row);
																								$(
																										'td')
																										.css(
																												"text-align",
																												"center;")
																							}))
																}, "json")

											}); //function orderCheck() ends here-------------------------------------------------
						//----back to index function is down here---------
						$('#b2').click(function(){
							window.location.href = "<c:url value="/index.jsp"/>"
						})
						
						})//ready--------------
	</script>
</body>
</html>
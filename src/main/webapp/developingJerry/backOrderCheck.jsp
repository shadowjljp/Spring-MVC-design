<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/component/css/datatables.css"/>"/>
<script  src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/component/js/jquery-ui-effect.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/component/js/datatables.js"/>"></script>


 <link href="<c:url value="/component/css/tableexport.css"/>" rel="stylesheet" type="text/css">
 	<script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
 <script type="text/javascript" src="<c:url value="/component/js/FileSaver.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/component/js/xlsx.core.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/component/js/jspdf.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/component/js/jspdf.plugin.autotable.js"/>"></script>
<script type="text/javascript" src="<c:url value="/component/js/es6-promise.auto.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/component/js/html2canvas.min.js"/>"></script>
<script src="<c:url value="/component/js/bootstrap.min.js"/>"></script>
 <script type="text/javascript" src="<c:url value="/component/js/tableexport.js"/>"></script> 

<title>訂單查詢(後台)</title>
<style>

.centralized {
	position: relative;
	top: 0px;
	left: 0px;
	display: block;
}

.underline {
	margin-top: 100px;
	border-bottom: solid 2px #EBA3A3;
}

.othersAlsoBuy {
	background-color: #EBA3A3;
	border-radius: 5px;
	display: inline;
	padding: 5px 15px 3px 15px;
}

.topgray {
	background-color: rgb(230, 192, 192);
	text-align: center;
}

table {
	border-collapse: separate;
	padding-right: 0px;
	margin-right: 0px;
}

table td {
	padding-top: 10px;
	width: 500px;
	height: 40px;
	border-radius: 10px;
	text-align: center;
	line-height: 30px;
	font-size:1.5em;
}

.topInfo {
	font-size: 1.5em;
	float: right;
	margin-right: 20px;
}

.date {
	padding-right: 60px;
	padding-left: 60px;
}

.merchandise1 {
	text-align: center;
	width: 50%;
}

.merchandise2 {
	width: 10%;
}

.merchandise3 {
	width: 20%;
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

form {
	margin-top: 20px;
	font-size: 1.5em; 
}
#textbox1,#textbox2,#textbox3,#textbox4,#textbox5,#textbox6{
	height:150%;
    font-size: 1.5em; 
}
.othersAlsoBuy,span,label{
 font-size: 1.5em; 
}
select{
 font-size: 1.2em; 
}
.searchImg{

height:4vh;
width:4vh
}
</style>
</head>
<body>
	<div class="centralized">
		<div>
				<div>
					日期範圍: 起始:<input id="textbox1" type="date" name="dayStart">~ 結束:<input
						id="textbox2" type="date" name="dayEnd"> 
						<select class="orderType" name="category">
						<option selected value="all">全部種類</option>
						<option value="electric">電子書</option>
						<option value="solid">實體書</option>
					</select>

				</div>
				訂單編號:<input id="textbox3" type="text" name="orderID">
				<!-- order id -->
				會員手機:<input id="textbox4" type="text" name="memberPhone">
				<!-- member memphone -->
				
				<button class="search-btn"  id="textbox5"  >
				 <img class="searchImg" src="<c:url value="/component/images/searchBT.png"/>" alt="">
				 </button>
			


		
			<!--<span class="D-b Mt-14 Mb-40 EC-C-betweenlightgrey">共<span class="EC-C-red">1</span>筆，顯示1-1筆   <a class="Mstart-10 EC-C-linkblue Fz-15 D-n" href="orderList?offset=1&amp;type=&amp;filterType=" data-rapid_p="32">下10筆 &gt;</a></span>-->

		</div>
		<div class="underline">
			<h4 class="othersAlsoBuy">訂單查詢</h4>
<!-- 			<input type="text" id="textbox6" onkeyup="myFunction()" placeholder="Search in table.." title="Type in a name"> -->
<!-- 				<span class="topInfo"> 共1筆，顯示1-1筆</span> -->
		</div>

		<div>
			<table id="orderCheck">
			<thead>
				<tr class="topgray">
					<!--<td>勾選處</td> -->
					<td class="merchandise1" colspan="2">商品明細</td>
					<td class="merchandise2">實付金額</td>
					<td class="merchandise3">配送狀態</td>
					<td class="date">訂購日</td>
					<td>發票</td>
				</tr>
				</thead>
				<tbody>
<!-- 					<tr> -->
<!-- 						<td class="prodimg">產品圖片放置處</td> -->
<!-- 						<td><input type="text" readonly name="productName" -->
<!-- 							placeholder="產品解說" /></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 						<td></td> -->
<!-- 					</tr> -->
				</tbody>
			</table>
			<div><input type="button" id="export" value="Excel資料輸出"/></div>
		</div>
	</div>
	
<script>
$(document).ready(function(){

	$('#textbox5').on('click',function(){
		var dayStart=$('#textbox1').val()
		var dayEnd=$('#textbox2').val()
		var category=$('.orderType').val()
		console.log(category)
		var orderID=$('#textbox3').val()
		console.log(orderID)
		var memberPhone =$('#textbox4').val()
		console.log(memberPhone)
		$.get('../backOrderCheck_page.controller',{"dayStart":dayStart,"dayEnd":dayEnd,"category":category,"orderID":orderID,"memberPhone":memberPhone},function(backOrderCheck){
		$('#orderCheck>tbody').empty();
		$('#orderCheck').DataTable(	
				backOrderCheck.forEach(function(bean){
//					console.log(bean.size)
			 var cell1 = $("<td></td>").text(bean.bknamezh);
		//	 var image = $filter(bean.prodimg)($scope.picture );
 			 var cell2 = $("<td></td>").html("<img src='"+bean.prodimg+"' />");
			 var cell3 = $("<td></td>").text(bean.orderamount);
			 var cell4 = $("<td></td>").text(bean.shippingstate); 
			 var cell5 = $("<td></td>").text(bean.orderdate);		
			 var cell6 = $("<td></td>").text(bean.invoicenum);	
			  var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6]);
             $('#orderCheck>tbody').append(row); 
		}))

		
	},"json")
		
	});
	//--------------------以下為資料輸出---------------------------
	  $("#export").click(function(){
			$("#export").toggle("slow","swing",function(){
		     $('#orderCheck').tableExport(); 
		     })
			  });
})


// function orderCheck(){
// 		var dayStart=$('#textbox1').text()
// 		console.log(dayStart)
// 		var dayEnd=$('#textbox2').val()
// 		var category=$('.orderType').val()
// 		var orderID=$('#textbox3').val()
// 		var memberPhone =$('#textbox4').val()
// 		$.get('../backOrderCheck_page.controller',{"dayStart":dayStart,"dayEnd":dayEnd,"category":category,"orderID":orderID,"memberPhone":memberPhone},function(backOrderCheck){
// 		$('#myTable>tbody').empty();
// 		$('#myTable').DataTable(	
// 				backOrderCheck.forEach(function(bean){
// 					console.log(bean.size)
		
		
// 			 var cell1 = $("<td></td>").text(bean.bknamezh);
// 		//	 var image = $filter(bean.prodimg)($scope.picture );
//  			 var cell2 = $("<td></td>").html("<img src='"+bean.prodimg+"' />");
// 			 var cell3 = $("<td></td>").text(bean.orderamount);
// 			 var cell4 = $("<td></td>").text(bean.shippingstate); 
// 			 var cell5 = $("<td></td>").text(bean.orderdate);		
// 			 var cell6 = $("<td></td>").text(bean.invoicenum);	
// 			  var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6]);
//              $('#myTable>tbody').append(row);
// 		}))

		
// 	},"json")

// 	}
</script>
	<script>
// 	function myFunction() {
// 		  var input, filter, table, tr, td, i;
// 		  input = document.getElementById("textbox6");
// 		  filter = input.value.toUpperCase();
// 		  table = document.getElementById("myTable");
// 		  tr = table.getElementsByTagName("tr");
// 		  for (i = 0; i < tr.length; i++) {
// 		    td = tr[i].getElementsByTagName("td")[0];
// 		    if (td) {
// 		      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
// 		        tr[i].style.display = "";
// 		      } else {
// 		        tr[i].style.display = "none";
// 		      }
// 		    }       
// 		  }
// 		}
	</script>
</body>

</html>
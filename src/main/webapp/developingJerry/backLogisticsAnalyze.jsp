<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/component/css/datatables.css"/>" />
	
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


<style>
body {
	font-size: 25px;
}

tr, td {
	text-align: center;
}
</style>
<title>業者分析</title>
</head>

<body>
	<div>
		<table id="logistic">
			<thead>
				<tr>
					<th>業者 id</th>
					<th>訂單編號</th>
					<th>業者名稱</th>
					<th>交通工具</th>
					<th>平均速率</th>
					<th>價格</th>
					<th>目的地(宅配/超商)</th>
					<th>客戶評分</th>
				</tr>
			</thead>
			<tbody>

			</tbody>

		</table>
	<div>
	<input type="button" id="export" value="Excel資料輸出"/>
	</div>
	</div>
	<script src="<c:url value="/component/js/jquery-ui-effect.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/component/js/datatables.js"/>"></script>
	<script>
	$(document).ready(function() {

		$.post('../logisticSelectAll.controller',{},function(logistic){
			$('#logistic>tbody').empty();
			$('#logistic').DataTable(
					
					logistic.forEach(function(bean){
						 var cell1 = $("<td></td>").text(bean.id);
						 var cell2 = $("<td></td>").text(bean.orderid);
						 var cell3 = $("<td></td>").text(bean.compname);
						 var cell4 = $("<td></td>").text(bean.transport);
						 var cell5 = $("<td></td>").text(bean.spd);
						 var cell6 = $("<td></td>").text(bean.price);
						 var cell7 = $("<td></td>").text(bean.dest);
						 var cell8 = $("<td></td>").text(bean.score);
						  var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8]);
	                     $('#logistic>tbody').append(row);
					}))
		
		},"json")
//----------------------------------------------------------------------------
		
		  $("#export").click(function(){
				$("#export").toggle("slow","swing",function(){
			     $('#logistic').tableExport(); 
			     })
				  });
///-----------輸出資料-----------------
//指定業者做為測試用
	//	  var id = $('.test').text();  //指定業者名稱的來源
	
	});
</script>
</body>
</html>
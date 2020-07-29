<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>爬蟲的結果分析</title>

<link rel="stylesheet" href="<c:url value="/component/css/bootstrap.min.css"/>"/>
<link rel="stylesheet" href="<c:url value="/component/css/jumbotron.css"/>"/>
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.css"/> -->
 <link rel="stylesheet" type="text/css" href="<c:url value="/component/css/datatables.css"/>"/>
<!--  ---------------------------------------------- -->
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

.backToSetting {
	padding: 10px;
	font-size: 35px;
	font-weight: bold;
	float: right;
	margin-right: 50px;
}

label, table {
	margin-top: 15px;
	padding-bottom: 15px;
	margin-bottom: 50px;
}
</style>
</head>
<body>
				<h4>爬蟲的結果分析</h4>
				
				<div class="card-body">
					<!-- 每頁不同的內容從這裡開始 -->
					<table id="Spider"
						class="table table-bordered table-striped table-hover">
							<thead>
					<tr>
						<th>資料來源</th>
						<th>對應我方的Product id</th>
<!-- 						<th>產品名稱</th> -->
<!-- 						<th>ISBN</th> -->
<!-- 						<th>分類名稱</th> -->
						<th>價格</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
					<!-- 每頁不同的內容到這裡結束 -->
					
				</div>
<!-- 			</div> -->
<div>
				<input type="button" id="export" value="Excel資料輸出"/><input class="backToSetting" type="button" value="回到條件設定" />
			</div>



	
	<script>
	 
		$(document).ready(function() {
// 			$.fn.tableExport.charset = "charset=utf-8";
// 			$.fn.tableExport.defaultButton = "button-default";


			  $.getJSON('/FinalProject/JerryForJQuery', {  }, function (data) {
	                $('#Spider>tbody').empty();
				  $('#Spider').DataTable( $.each(data.data, function (i, spider) {
	                    //console.log(product.ProductName);
	                    var cell1 = $("<td></td>").text(spider.id);
	                    var cell2 = $("<td></td>").text(spider.prodid);
	                    var cell3 = $("<td></td>").text(spider.price);
//	                    var cell4 = $("<td></td>").text(product.UnitsInStock);
	                  

	                    var row = $('<tr></tr>').append([cell1, cell2, cell3]);
	                    $('#Spider>tbody').append(row);
	                })
	              
				  );
	              
				
	            
	            })
	      	  $("#export").click(function(){
					$("#export").toggle("slow","swing",function(){
				     $('#Spider').tableExport(); 
				     })
					  });    	

		})
	</script>
</body>
</html>
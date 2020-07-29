<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
		<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/component/css/datatables.css"/>"/>
<script  src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/component/js/jquery-ui-effect.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/component/js/datatables.min.js"/>"></script>

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

body{
	font-size:25px;
}

tr,td{
text-align:center;
}
</style>

<title>訂單資料分析</title>

</head>
<body >
	<div>
		<table id="Order">
			<thead>
				<tr>
					<th>訂單日期</th>
					<th>付款方式</th>
					<th>訂單金額</th>
					<th>會員性別</th> 	
					<th>會員生日(年齡)</th>
					<th>會員地址</th>
					<th>訂單狀態</th>
				</tr>
			</thead>
		  <tbody> <!-- 之後將tbody內的資料全清空，tbody標籤要留 -->
        </tbody>

		</table>
		<div>
<input type="button" id="export" value="Excel資料輸出"/>
		</div>
	</div>

<script>
$(document).ready(function() {
	$.post('../backOrderAnalyzeSelectAll.controller',{},function(backOrderAnalyze){
		// console.log(backOrderAnalyze)
		$('#Order>tbody').empty();
		$('#Order').DataTable(
				backOrderAnalyze.forEach(function(bean){
					 var cell1 = $("<td></td>").text(bean.orderdate);
					 var cell2 = $("<td></td>").text(bean.paymenttype);
					 var cell3 = $("<td></td>").text(bean.orderamount);
					 var cell4 = $("<td></td>").text(bean.memgen); // member.memgen
					 var cell5 = $("<td></td>").text(bean.membirth);		// member.membirth
					 var cell6 = $("<td></td>").text(bean.memadd);	//member.memadd
					 var cell7 = $("<td></td>").text(bean.orderstate);		//order.orderstate
					
					  var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6, cell7]);
	                 $('#Order>tbody').append(row);
				}))

	},"json")
	//--------------------以下為資料輸出---------------------------
	
// 	  $("#export").click(function(){
//           $('#Order').tableExport(); 
//             }); 
	  $("#export").click(function(){
	$("#export").toggle("slow","swing",function(){
     $('#Order').tableExport(); 
     })
	  });
});

</script>
</body>
</html>
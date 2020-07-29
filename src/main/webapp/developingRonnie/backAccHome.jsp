<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="UTF-8">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet" href="<c:url value="/component/css/jquery-ui.css" /> ">
<link rel="stylesheet" href="<c:url value="/component/css/base.css" /> ">
<link rel="stylesheet" href="<c:url value="/component/css/bootstrap.min.css" /> ">
<link rel="stylesheet" href="<c:url value="/component/css/jumbotron.css" /> ">
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.css"/> -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/component/css/datatables.css" /> ">
<script src="<c:url value="/component/js/jquery-3.3.1.min.js" /> "></script>
<script src="<c:url value="/component/js/bootstrap.min.js" /> "></script>
<!--  <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.js"></script> -->
<script type="text/javascript" src="<c:url value="/component/js/datatables.min.js" /> "></script>

<script src="<c:url value="/component/js/jquery-1.12.4.js" /> "></script>
<script src="<c:url value="/component/js/jquery-ui.js" /> "></script>
<script>
	$(function() {
		$(".widget input[type=button], .widget a, .widget button").button();
		$("button, input, a").click(function(event) {
			event.preventDefault();
		});

	});
</script>

<style>
.AccHomeTielt {
	text-align: center;
	font-size: 50px;
	color: black
}

footer {
	text-align: center;
	margin-top: 90px;
}

.all {
	margin-top: 80px;
}

.foot {
	font-size: 20px
}
</style>

</head>

<body>
	<div class="all">
		<h2>
			<p class="AccHomeTielt">
				<font face="fantasy">會計資訊系統</font>
			</p>

		</h2>

		<div style="text-align: center; margin-top: 80px">
			<span class="widget"> <input
				class="ui-button ui-widget ui-corner-all" type="submit"
				value="損    益" style="border-radius: 10px"> <input
				class="ui-button ui-widget ui-corner-all" type="submit" value="收益細項"
				style="border-radius: 10px"> <input
				class="ui-button ui-widget ui-corner-all" type="submit" value="成本細項"
				style="border-radius: 10px"> <input
				class="ui-button ui-widget ui-corner-all" type="submit" value="現金流量"
				style="border-radius: 10px"> <input
				class="ui-button ui-widget ui-corner-all" type="submit" value="稅務資訊"
				style="border-radius: 10px">
			</span>
		</div>
		<footer>
			<p class="foot">
				提醒：距下次營業稅申報期限， <span>10月15日</span>尚有 <span>15天</span>
			</p>
			<p class="foot">
				提醒：距下次營所稅暫繳申報期限， <span>9月30日</span>尚有 <span>15天</span>
			</p>
		</footer>
	</div>
	<table id="table1">
		<tbody>

		</tbody>
	</table>


	<script>
		$.getJSON('/FinalProject/JerryForJQuery', {}, function(data) {
			$('#table1>tbody').empty();
			$('#table1').DataTable($.each(data.data, function(i, spider) {
				//console.log(product.ProductName);
				var cell1 = $("<td></td>").text(spider.id);
				var cell2 = $("<td></td>").text(spider.prodid);
				var cell3 = $("<td></td>").text(spider.price);

				var row = $('<tr></tr>').append([ cell1, cell2, cell3 ]);
				$('#table1>tbody').append(row);
			}));

		})
	</script>
</body>

</html>
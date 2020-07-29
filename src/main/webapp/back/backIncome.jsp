<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">



<link rel="icon"
	href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<title>收入線條圖</title>
<link rel="stylesheet"
	href="<c:url value="/component/css/jquery-ui.css"/>">
<link rel="stylesheet" href="<c:url value="/component/css/base.css" />">
<link rel="stylesheet"
	href="<c:url value="/component/css/bootstrap.min3.3.7.css" />">
<script src="<c:url value="/component/js/jquery.min3.3.1.js" />"></script>
<script src="<c:url value="/component/js/bootstrap.min3.3.7.js" />"></script>
<%-- <script src="<c:url value="/component/js/jquery-1.12.4.js" />"></script> --%>
<script src="<c:url value="/component/js/jquery-ui.js" />"></script>
<script src="<c:url value="/component/js/highcharts.js" />"></script>
<script src="<c:url value="/component/js/exporting.js" />"></script>
<script src="<c:url value="/component/js/series-label.js" />"></script>
<script src="<c:url value="/component/js/oldie.js" />"></script>
<script src="<c:url value="/component/js/highcharts-zh_CN.js" />"></script>
<script src="<c:url value="/component/js/dark-unica.js" />"></script>
<!--載入期間選擇器連結-->
<%-- <script src="<c:url value="/component/js/jquery.min-2.2.0.js" />"></script> --%>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="<c:url value="/component/js/moment.min-2.1.25.js" />"></script>
<script
	src="<c:url value="/component/js/daterangepicker.min-2.1.25.js" />"></script>
<link rel="stylesheet"
	href="<c:url value="/component/css/daterangepicker.min-2.1.25.css"/>" />
<!--載入連結-->


<style>

.divPercent {
	width: 1000px;
	height: 650px;
	float: left;
	padding: 15px;
	position: absolute;
}

.divOutAmount {
	width: 600px;
	height: 530px;
	position: relative;
	left: 1050px;
}

.amount {
	text-align: left;
	padding-top: 80px;
	line-height: 80px;
}

.tab-title p {
	display: inline;
}

.container {
	text-align: center;
	padding: 30px;
	font-size: 24px;
	float: left;
	background-color: #FFF9EF;
}

.center {
	text-align: center;
}

.right {
	text-align: right;
}
</style>
</head>

<body>

	<div class="container">
		<div class="changePage">
			<ul class="tab-title">
				<span>
					<p>
						<a href="#tab01"> <input type="submit" class="btn btn-info"
							value="線條圖" nowrap style="font-size: 29px; background-color: #b14d3b">
						</a>
					</p>
					<p>
						<a href="#tab02"> <input type="submit" class="btn btn-info"
							value="收入表" nowrap style="font-size: 29px ; background-color: #b14d3b">
						</a>
					</p>
				</span>
			</ul>
			<div class="tab-inner" id="tab01">
				<div class="divPercent" id="percent"></div>
				<div class="divOutAmount">
					<dl class="amount">
						<dt>2018年至今-
						<dd>&nbsp&nbsp&nbsp&nbsp收&nbsp&nbsp&nbsp入：<span id="2018income"></span></dd>
						
<!-- 						<dd>&nbsp&nbsp&nbsp&nbsp年增率：</dd> -->
<!-- 						<span id="108incomerate"></span> -->
						</dt>
						<dt>2017年總計-
						<dd>&nbsp&nbsp&nbsp&nbsp收&nbsp&nbsp&nbsp入：<span id="2017income"></span></dd>
<!-- 						<dd>&nbsp&nbsp&nbsp&nbsp年增率：</dd> -->
<!-- 						<span id="107incomerate"></span> -->
						</dt>
						<dt>2016年總計-
						<dd>&nbsp&nbsp&nbsp&nbsp收&nbsp&nbsp&nbsp入：<span id="2016income"></span></dd>
<!-- 						<dd>&nbsp&nbsp&nbsp&nbsp年增率：</dd> -->
<!-- 						<span id="106incomerate"></span> -->
						</dt>
					</dl>
				</div>
			</div>


			<div class="tab-inner" id="tab02" style="background-color: #FFF9EF">
				<table class="table table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th title="Field #1"></th>
							<th title="Field #2"></th>
							<th class="center"><input class="dateRange form-control"
								type="text" id="date" style="background-color: #FFF9EF"></th>
							<th class="center"><input class="dateRange form-control"
								type="text" id="date2" style="background-color: #FFF9EF"></th>
							<th title="Field #5"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>營業收入</td>
							<td></td>
							<td align="right"></td>
							<td align="right"></td>
							<td>差異率</td>
						</tr>
						<tr>
							<td></td>
							<td><a href="">銷售收入</a></td>
							<td class="right" id="salesIncome1"></td>
							<td class="right" id="salesIncome2"></td>
							<td class="right" id="salesIncomeRate"></td>
						</tr>
						<tr>
							<td></td>
							<td><a href="">廣告收入</a></td>
							<td class="right" id="advertIncome1"></td>
							<td class="right" id="advertIncome2"></td>
							<td class="right" id="advertIncomeRate"></td>
						</tr>
						<tr>
							<td></td>
							<td><a href="">銷售退回</a></td>
							<td class="right" id="salesReturn1"></td>
							<td class="right" id="salesReturn2"></td>
							<td class="right" id="salesReturnRate"></td>
						</tr>
						<tr>
							<td></td>
							<td><a href="">合計</a></td>
							<td class="right" id="total1"></td>
							<td class="right" id="total2"></td>
							<td class="right" id="totalRate"></td>
						</tr>

					</tbody>
				</table>
			</div>

		</div>

	</div>

	<table id="table1">
		<tbody>

		</tbody>
	</table>



	<!--date事件-->
	<!--     <script> -->
	<!-- // 		$(document).ready(function() { -->

	<!-- // 			$("#date").change(function() { -->

	<!-- //             $.getJSON('/FinalProject/JerryForJQuery', {}, function (data) { -->
	<!-- //                 $('#table1>tbody').empty(); -->
	<!-- //                 $('#table1').DataTable($.each(data.data, function (i, spider) { -->
	<!-- //                     //console.log(product.ProductName); -->
	<!-- //                     var cell1 = $("<span></span>").text(spider.id); -->
	<!-- //                     var cell2 = $("<span></span>").text(spider.prodid); -->
	<!-- //                     var cell3 = $("<span></span>").text(spider.price); -->

	<!-- //                     var row = $('<div></div>').append([cell1, cell2, cell3]); -->
	<!-- //                     $('.container').append(row); -->
	<!-- //                 })); -->

	<!-- //             }); -->
	<!-- // 			}); -->

	<!-- // 			//將表單的資料傳給Register Servlet -->

	<!-- // 		}) -->
	<!-- 	</script> -->


	<!--date事件-->
	<script>
		$(document).ready(function() {
			$("#date").on('change', function() {
				var date = $('#date').val()
				var newDate = date.substring(0, 10)
				var newDate2 = date.substring(13)
				
				var sumTemp;
				var adverTemp;
				var salesReturnSum;
				var DateTotal;
				//銷售收入
				$.post('../backIncome.controller', {"orderdate" : newDate,"orderdate2" : newDate2}, function(sum) {
					$('#salesIncome1').html(sum)
				sumTemp = parseInt(sum);
				//銷售收入

				//廣告收入
				$.post('../backIncomeAdvert.controller', {
					"launchtime1" : newDate,
					"launchtime2" : newDate2
				}, function(advertSum) {
					$('#advertIncome1').html(advertSum)
				
				//廣告收入

				//銷售退回
				$.post('../backIncome1.controller', {
					"orderdate" : newDate,
					"orderdate2" : newDate2
				}, function(salesReturnSum) {
					$('#salesReturn1').html(salesReturnSum)
					//console.log(newDate);
					//console.log(newDate2);
				
				//銷售退回
				
				//合計
				DateTotal = parseInt(sum) + parseInt(advertSum) + parseInt(salesReturnSum);
				$('#total1').html(DateTotal);
				//console.log("sum"+sum+"DateTotal"+DateTotal)
				//合計	
				
				<!--百分比運算-->
				//銷售收入	
				var salesIncomeRate;
				var salesIncome1 = sumTemp;
				var salesIncome2 = $('#salesIncome2').text();

				var salesIncomeRate = (salesIncome1 - salesIncome2)/ salesIncome1;

				var salesIncomeRate4 = (salesIncomeRate + "").substring(0, 6);
				$('#salesIncomeRate').html(salesIncomeRate4);
				//銷售收入	

				//廣告收入	
				var advertIncomeRate;
				var advertIncome1 = $('#advertIncome1').text();
				var advertIncome2 = $('#advertIncome2').text();
		
				var advertIncomeRate = (advertIncome1 - advertIncome2)/ advertIncome1;

				var advertIncomeRate4 = (advertIncomeRate + "").substring(0, 6);
				$('#advertIncomeRate').html(advertIncomeRate4);
				//廣告收入	
			
				//銷售退回
				var salesReturnRate;
				var salesReturn1 = $('#salesReturn1').text();
				var salesReturn2 = $('#salesReturn2').text();
				var salesReturnRate4;

				var salesReturnRate = (salesReturn1 - salesReturn2)/ salesReturn1;

				salesReturnRate4 = (salesReturnRate + "").substring(0, 6);
				$('#salesReturnRate').html(salesReturnRate4);
				//銷售退回
				
				//合計
				var total1 = $('#total1').text();
				var total2 = $('#total2').text();
				var totalRate4;

				var totalRate = (total1 - total2)/total1;
				totalRate4 = (totalRate + "").substring(0,6)
				$('#totalRate').html(totalRate4);
				//合計
				<!--百分比運算-->
				
				})
				});
				})
				});
		});

		//將表單的資料傳給Register Servlet
	</script>

	<!--date2事件-->
	<script>
		$(document).ready(function() {	
			$("#date2").on('change',function() {
				var date = $('#date2').val()
				var newDate = date.substring(0,10)
				var newDate2 = date.substring(13)
				
				var sumTemp;
				var adverTemp;
				var salesReturnSum2Temp;
				var DateTotal2;
			//console.log(newDate);
			//console.log(newDate2);

			//銷售收入
			$.post('../backIncome.controller',{"orderdate" : newDate,"orderdate2" : newDate2},
				function(sum) {$('#salesIncome2').html(sum);
				sumTemp = parseInt(sum);
				var salesIncome2 = sumTemp;
			//銷售收入	
			
			//廣告收入
			$.post('../backIncomeAdvert.controller',{"launchtime1" : newDate,"launchtime2" : newDate2},
				function(advertSum) {$('#advertIncome2').html(advertSum)
				adverTemp = parseInt(advertSum);
			//廣告收入
			
			//銷售退回
			$.post('../backIncome1.controller',{"orderdate" : newDate,"orderdate2" : newDate2},
					function(salesReturnSum2) {$('#salesReturn2').html(salesReturnSum2)
				salesReturnSum2Temp = parseInt(salesReturnSum2);
			//console.log(newDate);
			//console.log(newDate2);				
			//銷售退回
			
			//合計
			DateTotal2 = parseInt(sum) + parseInt(advertSum) + parseInt(salesReturnSum2);
			$('#total2').html(DateTotal2);
			//console.log("sum"+sum+"DateTotal"+DateTotal)
			//合計
			
						<!--百分比運算-->
			//銷售收入	
			var salesIncome1 = $('#salesIncome1').text();
			var salesIncome2 = sumTemp;
			var salesIncomeRate = (salesIncome1 - salesIncome2)/ salesIncome1;
			
			var salesIncomeRate4 = (salesIncomeRate + "").substring(0, 6);
			$('#salesIncomeRate').html(salesIncomeRate4);
			//銷售收入	
			
			//廣告收入	
			var advertIncome1 = $('#advertIncome1').text();
			var advertIncome2 = adverTemp;
			var advertIncomeRate = (advertIncome1 - advertIncome2)/ advertIncome1;

			var advertIncomeRate4 = (advertIncomeRate + "").substring(0, 6);
			$('#advertIncomeRate').html(advertIncomeRate4);
			//廣告收入	
			
			//銷售退回
			var salesReturn1 = $('#salesReturn1').text();
			var salesReturn2 = salesReturnSum2Temp;

			var salesReturnRate = (salesReturn1 - salesReturn2)/ salesReturn1;

			var salesReturnRate4 = (salesReturnRate + "").substring(0, 6);
			$('#salesReturnRate').html(salesReturnRate4);
			//銷售退回
			
			//合計
			var total1 = $('#total1').text();
			var total2 = DateTotal2;

			var totalRate = (total1 - total2)/total1;
			
			var totalRate4 = (totalRate + "").substring(0,6);
			$('#totalRate').html(totalRate4);
			//合計
			<!--百分比運算-->
			
			})
			})			
			})

					});
				});
	</script>


	<!--圖表-->
	<script>
		$(document).ready(
				function() {
					var jan;
					let thisY = new Array;
					let LastY = new Array;
					let beforeY = new Array;
					
					//當年度
					$.post('../backIncomeFirst.controller', {},
							function(dataThisY) {

// 								jan = data.a1a;
								// 			$('#salesIncome2').html();
// 								console.log(data);
// 								console.log(data.a2a);								
								thisY.push(dataThisY.a1a);
								thisY.push(dataThisY.a2a);
								thisY.push(dataThisY.a3a);
								thisY.push(dataThisY.a4a);
								thisY.push(dataThisY.a5a);
								thisY.push(dataThisY.a6a);
								thisY.push(dataThisY.a7a);
								thisY.push(dataThisY.a8a);
								thisY.push(dataThisY.a9a);
								thisY.push(dataThisY.a10a);
								thisY.push(dataThisY.a11a);
								thisY.push(dataThisY.a12a);

								
								//去年度
								$.post('../backIncomeFirstLastY.controller', {},
										function(dataLastY) {
						
											LastY.push(dataLastY.a1a);
											LastY.push(dataLastY.a2a);
											LastY.push(dataLastY.a3a);
											LastY.push(dataLastY.a4a);
											LastY.push(dataLastY.a5a);
											LastY.push(dataLastY.a6a);
											LastY.push(dataLastY.a7a);
											LastY.push(dataLastY.a8a);
											LastY.push(dataLastY.a9a);
											LastY.push(dataLastY.a10a);
											LastY.push(dataLastY.a11a);
											LastY.push(dataLastY.a12a);								
							//console.log(dataLastY.a11a,dataLastY.a12a);
								//前年度
								$.post('../backIncomeFirstbeforeY.controller', {},
										function(databeforeY) {
						
											beforeY.push(databeforeY.a1a);
											beforeY.push(databeforeY.a2a);
											beforeY.push(databeforeY.a3a);
											beforeY.push(databeforeY.a4a);
											beforeY.push(databeforeY.a5a);
											beforeY.push(databeforeY.a6a);
											beforeY.push(databeforeY.a7a);
											beforeY.push(databeforeY.a8a);
											beforeY.push(databeforeY.a9a);
											beforeY.push(databeforeY.a10a);
											beforeY.push(databeforeY.a11a);
											beforeY.push(databeforeY.a12a);	
							
					var chart = Highcharts.chart('percent', {
						title : {
							text : '年度 營業收入簡表'
						},
						subtitle : {
							text : '数据来源：Modify desktop professional team.com'
						},
						yAxis : {
							title : {
								text : '營業額'
							}
						},
						legend : {
							layout : 'vertical',
							align : 'right',
							verticalAlign : 'middle'
						},
						plotOptions : {
							series : {
								label : {
									connectorAllowed : false
								},
								pointStart : 1
							}
						},
						series : [
								{
									name : '2018',
									data : [ thisY[0], thisY[1], thisY[2], thisY[3], thisY[4], thisY[5],thisY[6],
										thisY[7] , thisY[8], thisY[9], thisY[10], thisY[11]]
								},
								{
									name : '2017',
									data : [ LastY[0], LastY[1], LastY[2], LastY[3], LastY[4], LastY[5],LastY[6],
										LastY[7] , LastY[8], LastY[9], LastY[10], LastY[11] ]
								},
								{
									name : '2016',
									data : [ beforeY[0], beforeY[1], beforeY[2], beforeY[3], beforeY[4], beforeY[5],beforeY[6],
										beforeY[7] , beforeY[8], beforeY[9], beforeY[10], beforeY[11] ]
								}
						// {
						//     name: '项目开发',
						//     data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
						// }, {
						//     name: '其他',
						//     data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]
						// }
						],
						responsive : {
							rules : [ {
								condition : {
									maxWidth : 500
								},
								chartOptions : {
									legend : {
										layout : 'horizontal',
										align : 'center',
										verticalAlign : 'bottom'
									}
								}
							} ]
						}
					});
					
					
					var Income2018 = 0;
					for(i=0;i<12;i++){
						Income2018 = thisY[i]+ Income2018 
					}
					$('#2018income').html(Income2018);
					
					var Income2017 = 0;
					for(i=0;i<12;i++){
						Income2017 = LastY[i]+ Income2017 
					}
					$('#2017income').html(Income2017);
					
					var Income2016 = 0;
					for(i=0;i<12;i++){
						Income2016 = beforeY[i]+ Income2016 
					}
					$('#2016income').html(Income2016);
					
					},"json");//thisY
					},"json");//lastY
					},"json");//beforeY
				});
	</script>
	<!--分頁標籤-->
	<script>
		$(function() {
			var $p = $('ul.tab-title p');
			$($p.eq(0).addClass('active').find('a').attr('href')).siblings(
					'.tab-inner').hide();

			$p.click(function() {
				$($(this).find('a').attr('href')).show().siblings('.tab-inner')
						.hide();
				$(this).addClass('active').siblings('.active').removeClass(
						'active');
			});
		});
	</script>
	<!--執行內容期間更改-->
	<script>
		$("input.dateRange").daterangepicker(
				{
					"alwaysShowCalendars" : true,
					opens : "left",
					startDate : "2017-08-01",
					endDate : "2017-09-01",
					ranges : {
						"今年" : [ moment().startOf("year"), moment() ],
						"去年" : [ moment().subtract(1, "year").startOf("year"),
								moment().subtract(1, "year").endOf("year") ],
						"本月" : [ moment().startOf("month"),
								moment().endOf("month") ],
						"上個月" : [
								moment().subtract(1, "month").startOf("month"),
								moment().subtract(1, "month").endOf("month") ]
					},
					locale : {
						format : "YYYY-MM-DD",
						separator : " ~ ",
						applyLabel : "確定",
						cancelLabel : "清除",
						fromLabel : "開始日期",
						toLabel : "結束日期",
						customRangeLabel : "自訂日期區間",
						daysOfWeek : [ "日", "一", "二", "三", "四", "五", "六" ],
						monthNames : [ "1月", "2月", "3月", "4月", "5月", "6月",
								"7月", "8月", "9月", "10月", "11月", "12月" ],
						firstDay : 1
					}
				});
		$("input.dateRange").on("cancel.daterangepicker", function(ev, picker) {
			$(this).val("");
		});
	</script>

</body>

</html>
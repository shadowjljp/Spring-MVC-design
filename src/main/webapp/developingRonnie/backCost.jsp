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
<title>成本線條圖</title>
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



<style>
.divPercent {
	width: 1000px;
	height: 650px;
	float: left;
	padding: 15px;
	position: absolute;
}

.divOutAmount {
	width: 300px;
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
							value="成本圖" nowrap style="font-size: 29px; background-color: #b14d3b">
						</a>
					</p>
					<p>
						<a href="#tab02"> <input type="submit" class="btn btn-info"
							value="分析表" nowrap style="font-size: 29px ; background-color: #b14d3b">
						</a>
					</p>
				</span>
			</ul>
			<div class="tab-inner" id="tab01">
				<div class="divPercent" id="percent"></div>
				<div class="divOutAmount">
					<dl class="amount">
						<dt>2018年至今-
						<dd>&nbsp&nbsp&nbsp&nbsp成&nbsp&nbsp&nbsp本：<span id="2018income"></span></dd>
						
<!-- 						<dd>&nbsp&nbsp&nbsp&nbsp年增率：</dd> -->
<!-- 						<span id="108incomerate"></span> -->
						</dt>
						<dt>2017年總計-
						<dd>&nbsp&nbsp&nbsp&nbsp成&nbsp&nbsp&nbsp本：<span id="2017income"></span></dd>
<!-- 						<dd>&nbsp&nbsp&nbsp&nbsp年增率：</dd> -->
<!-- 						<span id="107incomerate"></span> -->
						</dt>
						<dt>2016年總計-
						<dd>&nbsp&nbsp&nbsp&nbsp成&nbsp&nbsp&nbsp本：<span id="2016income"></span></dd>
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
							<td>期間</td>
							<td>銷貨收入</td>
							<td>銷貨成本</td>
							<td>每期成本率</td>
							<td>每期差異率</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="Year2014">2014</td>
							<td align="right" id="2014Sales"></td>
							<td align="right" id="2014Cost"></td>
							<td align="right" id="2014CostRate"></td>
							<td align="right" id="2014DiffRate"></td>
						</tr>
						<tr>
							<td id="Year2015">2015</td>
							<td align="right" id="2015Sales"></td>
							<td align="right" id="2015Cost"></td>
							<td align="right" id="2015CostRate"></td>
							<td align="right" id="2015DiffRate"></td>
						</tr>
						<tr>
							<td id="Year2016">2016</td>
							<td align="right" id="2016Sales"></td>
							<td align="right" id="2016Cost"></td>
							<td align="right" id="2016CostRate"></td>
							<td align="right" id="2016DiffRate"></td>
						</tr>
						<tr>
							<td id="Year2017">2017</td>
							<td align="right" id="2017Sales"></td>
							<td align="right" id="2017Cost"></td>
							<td align="right" id="2017CostRate"></td>
							<td align="right" id="2017DiffRate"></td>
						</tr>
						<tr>
							<td id="Year2018">2018</td>
							<td align="right" id="2018Sales"></td>
							<td align="right" id="2018Cost"></td>
							<td align="right" id="2018CostRate"></td>
							<td align="right" id="2018DiffRate"></td>
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
		<script>
		$(document).ready(function() {

// 				var newDate = date.substring(0, 10)
// 				var newDate2 = date.substring(13)
				
// 				var sumTemp;
// 				var adverTemp;
// 				var salesReturnSum;
// 				var DateTotal;

				//銷售收入2016
				var sales2016= $('#Year2016').text();
						//console.log("2016"+newDate);
				$.post('../backIncome.controller', {"orderdate" : sales2016+"-01-01","orderdate2" : sales2016+"-12-31"}, function(sum) {
					$('#2016Sales').html(sum)
					//console.log("sales2016 Date="+sales2016+"-01-01",sales2016+"-12-31");
				
				//銷售收入2016
				
				//銷貨成本2016
				$.post('../backCost.controller', {"orderdate3" : sales2016+"-01-01","orderdate4" : sales2016+"-12-31"}, function(cost) {
					console.log("cost2016 Date="+newDate,newDate2);
					$('#2016Cost').html(cost);
					console.log("cost2016 Date="+sales2016+"-01-01",sales2016+"-12-31");
				})
				});
				//銷貨成本2016
				
				
				
				
				
				
				//銷售收入2017
				var sales2017= $('#Year2017').text();

				$.post('../backIncome.controller', {"orderdate" : sales2017+"-01-01","orderdate2" : sales2017+"-12-31"}, function(sum) {
					$('#2017Sales').html(sum)});
				console.log("sales2017 Date="+sales2017+"-01-01",sales2017+"-12-31");
				//銷售收入2017
				
				
				
				
				//銷售收入2018
				var Today = new Date();
　				var currentDay = (Today.getFullYear()+ "-" + (Today.getMonth()+1) + "-" + Today.getDate());
				var sales2018= $('#Year2018').text();
				newDate = sales2018+"-01-01";
				newDate2 = currentDay;
				
				$.post('../backIncome.controller', {"orderdate" : newDate,"orderdate2" : newDate2}, function(sum) {
					$('#2018Sales').html(sum)});
				console.log("sales2018 Date="+newDate,newDate2);
				//銷售收入2018
				

				
				
				
				
				
				

// 				<!--百分比運算-->
// 				//銷售收入	
// 				var salesIncomeRate;
// 				var salesIncome1 = sumTemp;
// 				var salesIncome2 = $('#salesIncome2').text();

// 				var salesIncomeRate = (salesIncome1 - salesIncome2)/ salesIncome1;

// 				var salesIncomeRate4 = (salesIncomeRate + "").substring(0, 6);
// 				$('#salesIncomeRate').html(salesIncomeRate4);
// 				//銷售收入	

// 				//廣告收入	
// 				var advertIncomeRate;
// 				var advertIncome1 = $('#advertIncome1').text();
// 				var advertIncome2 = $('#advertIncome2').text();
		
// 				var advertIncomeRate = (advertIncome1 - advertIncome2)/ advertIncome1;

// 				var advertIncomeRate4 = (advertIncomeRate + "").substring(0, 6);
// 				$('#advertIncomeRate').html(advertIncomeRate4);
// 				//廣告收入	
			
// 				//銷售退回
// 				var salesReturnRate;
// 				var salesReturn1 = $('#salesReturn1').text();
// 				var salesReturn2 = $('#salesReturn2').text();
// 				var salesReturnRate4;

// 				var salesReturnRate = (salesReturn1 - salesReturn2)/ salesReturn1;

// 				salesReturnRate4 = (salesReturnRate + "").substring(0, 6);
// 				$('#salesReturnRate').html(salesReturnRate4);
// 				//銷售退回
				
// 				//合計
// 				var total1 = $('#total1').text();
// 				var total2 = $('#total2').text();
// 				var totalRate4;

// 				var totalRate = (total1 - total2)/total1;
// 				totalRate4 = (totalRate + "").substring(0,6)
// 				$('#totalRate').html(totalRate4);
// 				//合計
// 				<!--百分比運算-->
				
 				})


		</script>
	

	<!-- 	圖表	 -->
	<script>
		var chart = Highcharts.chart('percent', {
			title : {
				text : '營業成本'
			},
			subtitle : {
				text : '數據來源：Modify desktop professional team.com'
			},
			yAxis : {
				title : {
					text : '流動成本'
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
						name : '2016',
						data : [ 43934, 52503, 57177, 69658, 97031, 119931,
								137133, 154175 ]
					},
					{
						name : '2017',
						data : [ 24916, 24064, 29742, 29851, 32490, 30282,
								38121, 40434, 49434, 49434, 49434, 49434 ]
					},
					{
						name : '2018',
						data : [ 11744, 17722, 16005, 19771, 20185, 24377,
								32147, 39387, 39387, 39387, 39387, 39387 ]
					}

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
	</script>
	
	<!-- 	分頁標籤 	-->
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
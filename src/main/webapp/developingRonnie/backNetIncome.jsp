<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<link rel="icon"
	href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<title>損益表</title>
<link rel="stylesheet" href="<c:url value="/component/css/jquery-ui.css" />">
<link rel="stylesheet" href="<c:url value="/component/css/base.css" />">
<link rel="stylesheet" href="<c:url value="/component/css/bootstrap.min3.3.7.css" />">
<link rel="stylesheet" href="<c:url value="/component/css/jumbotron.css" />">
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.css"/> -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/component/css/datatables.css" />">
<script src="<c:url value="/component/js/jquery-3.3.1.min.js" />"></script>
<script src="<c:url value="/component/js/bootstrap.min.js" />"></script>
<!--  <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.js"></script> -->
<script type="text/javascript" src="<c:url value="/component/js/datatables.min.js" />"></script>
<script src="<c:url value="/component/js/jquery.min3.3.1.js" />"></script>
<script src="<c:url value="/component/js/bootstrap.min3.3.7.js" />"></script>
<script src="<c:url value="/component/js/jquery-1.12.4.js" />"></script>
<script src="<c:url value="/component/js/jquery-ui.js" />"></script>
<script src="<c:url value="/component/js/highcharts.js" />"></script>
<script src="<c:url value="/component/js/exporting.js" />"></script>
<script src="<c:url value="/component/js/series-label.js" />"></script>
<script src="<c:url value="/component/js/oldie.js" />"></script>
<script src="<c:url value="/component/js/highcharts-zh_CN.js" />"></script>
<script src="<c:url value="/component/js/dark-unica.js" />"></script>
<!--載入期間選擇器連結-->
<script src="<c:url value="/component/js/jquery.min-2.2.0.js" />"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet"></link>
<script src="<c:url value="/component/js/moment.min-2.1.25.js" />"></script>
<script src="<c:url value="/component/js/daterangepicker.min-2.1.25.js" />"></script>
<link href="<c:url value="/component/css/daterangepicker.min-2.1.25.css"
	rel="stylesheet" />"></link>
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
							value="線條圖" nowrap style="font-size: 29px">
						</a>
					</p>
					<p>
						<a href="#tab02"> <input type="submit" class="btn btn-info"
							value="損益表" nowrap style="font-size: 29px">
						</a>
					</p>
				</span>
			</ul>
			<div class="tab-inner" id="tab01">
				<div class="divPercent" id="percent"></div>
				<div class="divOutAmount">
					<dl class="amount">
						<dt>108年至今-
						<dd>&nbsp&nbsp&nbsp&nbsp淨利(損)：</dd>
						<span id="108netIncome"></span>
						<dd>&nbsp&nbsp&nbsp&nbsp年增率：</dd>
						<span id="108netIncomeRate"></span>
						</dt>
						<dt>107年總計-
						<dd>&nbsp&nbsp&nbsp&nbsp淨利(損)：</dd>
						<span id="107netIncome"></span>
						<dd>&nbsp&nbsp&nbsp&nbsp年增率：</dd>
						<span id="107netIncomeRate"></span>
						</dt>
						<dt>106年總計-
						<dd>&nbsp&nbsp&nbsp&nbsp淨利(損)：</dd>
						<span id="106netIncome"></span>
						<dd>&nbsp&nbsp&nbsp&nbsp年增率：</dd>
						<span id="106netIncomeRate"></span>
						</dt>
					</dl>
				</div>
			</div>


			<div class="tab-inner" id="tab02">
				<table class="table table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th title="Field #1"></th>
							<th title="Field #2"></th>
							<th title="Field #3"></th>
							<th class="center"><input class="dateRange form-control"
								type="text" id="date"></th>
							<th class="center"><input class="dateRange form-control"
								type="text" id="date2"></th>
							<th title="Field #6"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>流動損益</td>
							<td></td>
							<td></td>
							<td align="right"></td>
							<td align="right"></td>
							<td>差異率</td>
						</tr>
						<tr>
							<td></td>
							<td>銷售淨利</td>
							<td></td>
							<td align="right"></td>
							<td align="right"></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>銷售收入</td>
							<td align="right">123456</td>
							<td align="right">123456</td>
							<td>4%</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>(銷貨退回)</td>
							<td align="right">123456</td>
							<td align="right">123456</td>
							<td>4%</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>銷貨淨額</td>
							<td align="right">123456</td>
							<td align="right">123456</td>
							<td>4%</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>銷售成本</td>
							<td align="right">123456</td>
							<td align="right">123456</td>
							<td>4%</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>銷售淨利</td>
							<td align="right">123456</td>
							<td align="right">123456</td>
							<td>4%</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td align="right"></td>
							<td align="right"></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td>營業費用</td>
							<td></td>
							<td align="right"></td>
							<td align="right"></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>銷貨運費</td>
							<td align="right">123456</td>
							<td align="right">123456</td>
							<td>4%</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td align="right"></td>
							<td align="right"></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td>其他損益</td>
							<td></td>
							<td align="right"></td>
							<td align="right"></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>活動收入</td>
							<td align="right">123456</td>
							<td align="right">123456</td>
							<td>4%</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>活動費用</td>
							<td align="right">123456</td>
							<td align="right">123456</td>
							<td>4%</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>廣告收入</td>
							<td align="right">123456</td>
							<td align="right">123456</td>
							<td>4%</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>小計</td>
							<td align="right">123456</td>
							<td align="right">123456</td>
							<td>4%</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td align="right"></td>
							<td align="right"></td>
							<td></td>
						</tr>
						<tr>
							<td>本期流動損益</td>
							<td></td>
							<td></td>
							<td align="right">123456</td>
							<td align="right">123456</td>
							<td>4%</td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>
		</tbody>
		</table>
	</div>

	<table id="table1">
		<tbody>

		</tbody>
	</table>

        <!--date事件-->
		<script>
			$(document).ready(function() {
	
				$("#date").change(function() {
	
				$.getJSON('/FinalProject/JerryForJQuery', {}, function (data) {
					$('#table1>tbody').empty();
					$('#table1').DataTable($.each(data.data, function (i, spider) {
						//console.log(product.ProductName);
						var cell1 = $("<span></span>").text(spider.id);
						var cell2 = $("<span></span>").text(spider.prodid);
						var cell3 = $("<span></span>").text(spider.price);
	
						var row = $('<div></div>').append([cell1, cell2, cell3]);
						$('.container').append(row);
					}));
	
				});
				});
	
				//將表單的資料傳給Register Servlet
	
			})
		</script>
		
			<!--date2事件-->
		<script>
			$(document).ready(function() {
	
				$("#date2").change(function() {
	
				$.getJSON('/FinalProject/JerryForJQuery', {}, function (data) {
					$('#table1>tbody').empty();
					$('#table1').DataTable($.each(data.data, function (i, spider) {
						//console.log(product.ProductName);
						var cell1 = $("<span></span>").text(spider.id);
						var cell2 = $("<span></span>").text(spider.prodid);
						var cell3 = $("<span></span>").text(spider.price);
	
						var row = $('<div></div>').append([cell1, cell2, cell3]);
						$('.container').append(row);
					}));
	
				});
				});
	
				//將表單的資料傳給Register Servlet
	
			})
		</script>
	

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
	<script>
		var chart = Highcharts.chart('percent', {
			title : {
				text : '營業損益簡表'
			},
			subtitle : {
				text : '数据来源：Modify desktop professional team.com'
			},
			yAxis : {
				title : {
					text : '淨    利    (損)'
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
	</script>
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
	<script>
		$("input.default").daterangepicker();
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享讀</title>
<link rel="stylesheet" href='<c:url value="/component/css/jquery-1.12.1-ui.css"></c:url>'>
    
<link rel="stylesheet" href='<c:url value="/component/css/base.css"></c:url>'>
<link rel="stylesheet" href='<c:url value="/component/css/layout.css"></c:url>'>
<link rel="stylesheet" href='<c:url value="/component/css/main.css"></c:url>'>
<link rel="stylesheet" href='<c:url value="/component/css/headerAndFooter.css"></c:url>'>
    
<link rel="stylesheet" href='<c:url value="/component/css/search.css"></c:url>'>
<link rel="stylesheet" href='<c:url value="/component/css/bootstrap.min3.3.7.css"></c:url>'>
<script src='<c:url value="/component/js/jquery-3.3.1.min.js"></c:url>'></script>
<script src='<c:url value="/component/js/highcharts.js"></c:url>'></script>
<script src='<c:url value="/component/js/exporting.js"></c:url>'></script>
<script src='<c:url value="/component/export-data.js"></c:url>'></script>
 <style>
    .container{

    }
    .analysis{
        height: 200px;
        /* height:20vh; */
    }
    .title{
        float: left;
        width: 80vw;
    }
    .chart{
        float: right;
        width: 30vw;
    }
    .inside{
        float: left;
    }
    .area2{
        /* height: 70vh;
        width: 80vw;
        border-bottom: black 2px solid; */
        height: 850px;
        width: 1040px;
        border-bottom: 2px solid black;
    }
    .management{
        font-family: 微軟正黑體;
    }
    .member{
        margin: auto;
    }
    .h3{

    }
    </style>
</head>
<body>
   <section class="container">
        <section class="analysis">
            <div class="title">
                    <h2>問題統計</h2>
            </div>
            <div class="chart">
                <div class="inside">
                    <h3>OOOOOOOOOOOOO</h3>
                    <h3>XXXXXXXXXXXXX</h3>
                </div>
            </div>
        </section>

        <div class="area2">
                <div style="height:420px;border-bottom:solid green 2px">
                    <div id="age" style="width: 490px; height: 400px;float: left"></div>
                    <div id="gender" style="width: 490px; height: 400px;float: right"></div>
                </div>
                <div>
                    <div id="planpercent" style="width: 490px; height: 400px;float: left"></div>
                    <div id="planmoney" style="width: 490px; height: 400px;float: right"></div>
                </div>
            </div>
            <script>
                    // Build the chart
                    Highcharts.chart('age', {
                        chart: {
                            backgroundColor: '#FFF9EF',
                            plotBackgroundColor: null,
                            plotBorderWidth: null,
                            plotShadow: false,
                            type: 'pie'
                        },
                        title: {
                            text: '年齡層'
                        },
                        tooltip: {
                            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                        },
                        plotOptions: {
                            pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {
                                    enabled: false
                                },
                                showInLegend: true
                            }
                        },
                        series: [{
                            name: 'Brands',
                            colorByPoint: true,
                            data: [{
                                name: '20歲以下',
                                y: 11.84
                            }, {
                                name: '20-30歲',
                                y: 10.85
                            }, {
                                name: '30-40歲',
                                y: 4.67
                            }, {
                                name: '40-50歲',
                                y: 4.18
                            }, {
                                name: '50歲以上',
                                y: 7.05
                            }]
                        }]
                    });
                    // Build the chart
                    Highcharts.chart('gender', {
                        chart: {
                            backgroundColor: '#FFF9EF',
                            plotBackgroundColor: null,
                            plotBorderWidth: null,
                            plotShadow: false,
                            type: 'pie'
                        },
                        title: {
                            text: '性別'
                        },
                        tooltip: {
                            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                        },
                        plotOptions: {
                            pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {
                                    enabled: false
                                },
                                showInLegend: true
                            }
                        },
                        series: [{
                            name: 'Brands',
                            colorByPoint: true,
                            data: [{
                                name: '男性',
                                y: 61.41,
                                sliced: true,
                                selected: true
                            },{
                                name: '女性 ',
                                y: 7.05
                            }]
                        }]
                    });
                    // Build the chart
                    Highcharts.chart('planpercent', {
                        chart: {
                            backgroundColor: '#FFF9EF',
                            plotBackgroundColor: null,
                            plotBorderWidth: null,
                            plotShadow: false,
                            type: 'pie'
                        },
                        title: {
                            text: '問題種類比率'
                        },
                        tooltip: {
                            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                        },
                        plotOptions: {
                            pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {
                                    enabled: false
                                },
                                showInLegend: true
                            }
                        },
                        series: [{
                            name: 'Brands',
                            colorByPoint: true,
                            data: [{
                                name: '一',
                                y: 60,
    
                            }, {
                                name: '二',
                                y: 20
                            }, {
                                name: '三',
                                y: 20
                            }]
                        }]
                    });
                    // Build the chart
                    Highcharts.chart('planmoney', {
                        chart: {
                            backgroundColor: '#FFF9EF',
                            plotBackgroundColor: null,
                            plotBorderWidth: null,
                            plotShadow: false,
                            type: 'pie'
                        },
                        title: {
                            text: '訂單問題統計'
                        },
                        tooltip: {
                            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                        },
                        plotOptions: {
                            pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {
                                    enabled: false
                                },
                                showInLegend: true
                            }
                        },
                        series: [{
                            name: 'Brands',
                            colorByPoint: true,
                            data: [{
                                name: '一',
                                y: 40,
    
                            }, {
                                name: '二',
                                y: 20
                            }, {
                                name: '三',
                                y: 40
                            }]
                        }]
                    });
                </script>


    <div class="management">
        <h3 class="h3">

        </h3>

        <table class="member">

            <thead>
                <tr>
                    <th data-priority="1">問題單號</th>
                    <th data-priority="2">問題狀態</th>
                    <th data-priority="3">問題種類</th>
                    <th data-priority="4">會員狀態</th>
                    <th data-priority="5">發問時間</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>1</th>
                    <th>已處理</th>
                    <th>商品詢問</th>
                    <th>VIP</th>
                    <th>2018-05-26</th>
                </tr>
                <tr>
                    <th>2</th>
                    <th>已處理</th>
                    <th>商品詢問</th>
                    <th>VIP</th>
                    <th>2018-05-26</th>
                </tr>
                <tr>
                    <th>3</th>
                    <th>已處理</th>
                    <th>商品詢問</th>
                    <th>VIP</th>
                    <th>2018-05-26</th>
                </tr>
                <tr>
                    <th>4</th>
                    <th>已處理</th>
                    <th>商品詢問</th>
                    <th>VIP</th>
                    <th>2018-05-26</th>
                </tr>
                <tr>
                    <th>5</th>
                    <th>已處理</th>
                    <th>商品詢問</th>
                    <th>VIP</th>
                    <th>2018-05-26</th>
                </tr>                 
            </tbody>
            
        </table>

        
    </div>
    </section>
</body>
</html>
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

<style type="text/css">
		.booktitle {
            height: 200px;
        }

        .area2 {
            height: 850px;
            width: 1040px;
            border-bottom: black 2px solid;
        }
</style>
</head>
<body>
 <div class="wrapper">

        <section class="container">
            <section class="booktitle">
                <div style="float: left;width: 700px">
                    <h2>會員資料統計</h2>
                </div>
                <div style="float: right;width: 300px">
                    <div style="float: left">
                        <h3>OOOOOOOOOOOOOOOOO</h3>
                        <h3>XXXXXXXXXXXXXXXXX</h3>
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
                        text: '居住地比例'
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
                        text: '消費金額比例'
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
 
        </section>


    </div>
</body>
</html>
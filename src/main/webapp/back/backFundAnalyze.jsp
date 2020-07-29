<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>專案分析</title>
 <link rel="stylesheet" href="<c:url value="/component/css/jquery-1.12.1-ui.css"/>">
    <link rel="stylesheet" href="<c:url value="/component/css/base.css"/>">
    <link rel="stylesheet" href="<c:url value="/component/css/back.css"/>">
    <link rel="stylesheet" href="<c:url value="/component/css/bootstrap.min3.3.7.css"/>">
    <script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
    <script src="<c:url value="/component/js/highcharts.js"/>"></script>
    <script src="<c:url value="/component/js/exporting.js"/>"></script>
    <script src="<c:url value="/component/export-data.js"/>"></script>
    <style>
        .area2 {
            height: 850px;
            width: 1040px;
            border-bottom: black 2px solid;
        }

        .booktitle {
            height: 200px;
            color: #8B6257;
        }

        section {
            margin-top: 50px;
        }

        tr:hover {
            background-color: burlywood;
            color: blue
        }

        td:hover {
            text-decoration: underline;
            color: blue
        }

        table {
            border: 1;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }

        .eventtitle {
            width: 900px;
        }

        table td,
        th {
            height: 50px;
            width: 200px;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div class="wrapper">
        <section class="container">
            <section class="booktitle">
                <div style="float: left;width: 700px">
                    <h2>OOO專案</h2>
                </div>
                <div style="float: right;width: 300px">
                    <div style="float: left">
                        <h3>提案人：會員1</h3>
                        <h3>已募金額：32,000元</h3>
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
                        backgroundColor: '#FFFFFF',
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
                        backgroundColor: '#FFFFFF',
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
                        }, {
                            name: '女性 ',
                            y: 7.05
                        }]
                    }]
                });
                // Build the chart
                Highcharts.chart('planpercent', {
                    chart: {
                        backgroundColor: '#FFFFFF',
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie'
                    },
                    title: {
                        text: '方案百分比'
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
                            name: '方案一',
                            y: 60,

                        }, {
                            name: '方案二',
                            y: 20
                        }, {
                            name: '方案三',
                            y: 20
                        }]
                    }]
                });
                // Build the chart
                Highcharts.chart('planmoney', {
                    chart: {
                        backgroundColor: '#FFFFFF',
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie'
                    },
                    title: {
                        text: '方案贊助金額'
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
                            name: '方案一',
                            y: 40,

                        }, {
                            name: '方案二',
                            y: 20
                        }, {
                            name: '方案三',
                            y: 40
                        }]
                    }]
                });
            </script>
            <div class="area3">

                <h3>贊助人名單
                    <p>匯出為：XML格式、JSON格式</p>
                </h3>

                <table id="sponsor">
                    <thead>
                        <tr>
                            <th data-priority="1">贊助人</th>
                            <th data-priority="2">地址</th>
                            <th data-priority="3">E-mail</th>
                            <th data-priority="4">連絡電話</th>
                            <th data-priority="5">贊助金額</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>劉德華</td>
                            <td>台北市大安區......</td>
                            <td>ReadShare@xxxx.com.tw</td>
                            <td>098787878787</td>
                            <td>600</td>
                        </tr>
                        <tr>
                            <td>劉德華</td>
                            <td>台北市大安區......</td>
                            <td>ReadShare@xxxx.com.tw</td>
                            <td>098787878787</td>
                            <td>100</td>
                        </tr>
                        <tr>
                            <td>劉德華</td>
                            <td>台北市大安區......</td>
                            <td>ReadShare@xxxx.com.tw</td>
                            <td>098787878787</td>
                            <td>500</td>
                        </tr>
                        <tr>
                            <td>劉德華</td>
                            <td>台北市大安區......</td>
                            <td>ReadShare@xxxx.com.tw</td>
                            <td>098787878787</td>
                            <td>1200</td>
                        </tr>
                        <tr>
                            <td>劉德華</td>
                            <td>台北市大安區......</td>
                            <td>ReadShare@xxxx.com.tw</td>
                            <td>098787878787</td>
                            <td>1200</td>
                        </tr>
                        <tr>
                            <td>劉德華</td>
                            <td>台北市大安區......</td>
                            <td>ReadShare@xxxx.com.tw</td>
                            <td>098787878787</td>
                            <td>1200</td>
                        </tr>
                        <tr>
                            <td>劉德華</td>
                            <td>台北市大安區......</td>
                            <td>ReadShare@xxxx.com.tw</td>
                            <td>098787878787</td>
                            <td>1200</td>
                        </tr>
                        <tr>
                            <td>劉德華</td>
                            <td>台北市大安區......</td>
                            <td>ReadShare@xxxx.com.tw</td>
                            <td>098787878787</td>
                            <td>1200</td>
                        </tr>
                        <tr>
                            <td>劉德華</td>
                            <td>台北市大安區......</td>
                            <td>ReadShare@xxxx.com.tw</td>
                            <td>098787878787</td>
                            <td>1200</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
</body>
</html>
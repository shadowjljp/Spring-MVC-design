<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>募資-付款頁面</title>
<!--套用jquery-->
    <script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
    <script src="<c:url value="/component/js/bootstrap.min.js"/>"></script>
<!--套用Header Footer CSS-->
	<link rel="stylesheet" href="<c:url value="/component/css/base.css"/>">
	<link rel="stylesheet" href="<c:url value="/component/css/layout.css"/>">
	<link rel="stylesheet" href="<c:url value="/component/css/headerAndFooter.css"/>">
<style>
        body {
            background-color: rgb(255, 249, 239);
        }

        .titlebody {
            margin-left: 0;
            text-align: center;
            font-size: 45px;
        }

        .total-div {
            width: 1400px;
            height: 800px;
            margin-left: -1.7em;
            margin-top: 10%;
        }

        .input-type {
            width: 200px;
            height: 25px;
            margin-left: 0.5em;
        }

        .payTitle-div {
            margin-left: 15em;

        }

        .payTitle {
            font-size: 20px;
            font-family: 微軟正黑體;
            font-weight: bold;
        }

        .pay-insert-div {
            font-size: 20px;
            margin-left: 10em;
            border-radius: 10px;
            border: 1px solid rgb(29, 28, 28);
            width: 500px;
            height: 85px;
        }

        .left-div {
            float: left;
            margin-top: 1em;
        }

        .txt {
            font-size: 80%;
            margin-left: 0.5em;
            margin-bottom: 1em;
            width: 450px;
            color: gray;
        }

        .block1div {
            margin-left: 2em;
            margin-top: 0.2em;
        }

        .paymoney-text {
            width: 200px;
            height: 25px;
            margin-left: 0.5em;
        }

        .pay-info-div {
            margin-top: 1em;
            font-size: 20px;
            margin-left: 10em;
            width: 500px;
            border: 1px solid rgb(29, 28, 28);
            border-radius: 10px;
        }

        .Feedback-title {
            margin-top: 1em;
        }

        .feedback-p {
            font-size: 20px;
            font-family: 微軟正黑體;
            font-weight: bold;
        }

        .projectFeedback-div {
            width: 500px;
            height: 610px;
            float: left;
            margin-left: 3em;
        }

        .projectFeedback {
            border: 1px solid rgb(46, 45, 45);
            border-radius: 10px;
            width: 400px;
            height: 150px;
        }
        .projectFeedback:hover{
            border: 1.5px solid rgb(46, 45, 45);
        }

        .projectFeedback-title {
            border: 1px solid rgb(46, 45, 45);
            border-radius: 10px;
            width: 400px;
            height: 35px;
            background-color: rgb(226, 216, 216);
        }

        .projectFeedback-span1 {
            font-size: 25px;
            margin-left: 0.3em;
            font-weight: bold;
        }

        .projectFeedback-span2 {
            float: right;
            margin-right: 0.2em;
            font-size: 20px;
            text-align: center;
        }

        .enter-button {
            width: 450px;
            height: 50px;
            background-color: rgb(248, 237, 223);
            border-radius: 10px;

            margin: 0.5em 0% 30% 32%;
        }
    </style>
</head>
<body>
	<div class="wrapper">
		<%--include header.jsp --%>
		<%@include file="../partial/headerForProject.jsp"%>
		<%--網頁內容 --%>
		<div class="container">
			<div class="total-div">
                <h1 class="titlebody">小小廚神養成計畫報名開始囉！</h1>
                <div class="left-div">

                    <div class="payTitle-div">
                        <p class="payTitle">請輸入您的贊助人資訊並付款,可參考右方回饋資訊</p>
                    </div>
                    <div class="pay-insert-div">
                        <div class="block1div">
                            <label for="">輸入贊助金額:</label>
                            <br> $
                            <form action='<c:url value="/projectpay.controller"></c:url>'>
<!--                             danny -->
                            <input class="paymoney-text" type="text " placeholder="請在右方點選要贊助的金額" name="
                    " id="payMoney">
                            <br>
                            <span class="txt">提醒您!金額達到回饋方案要求會有限量禮物唷!</span>
                        </div>
                    </div>
                    <div class="pay-info-div">
                        <div style="margin-left: 2em;margin-top: 0.2em;">
                            <label for="">贊助人姓名:</label>
                            <br>
<!--                             danny -->
                            <input class="input-type" type="text " placeholder="請輸入贊助人姓名" name="
                    " id=" ">
                            <br>
                            <span class="txt">ex:王曉明</span>
                            <br>
                            <label for="">贊助人電話:</label>
                            <br>
<!--                             danny -->
                            <input style=" width: 200px;height:25px;margin-left: 0.5em; " type="text " placeholder="請輸入贊助人電話" name="
                    " id=" ">
                            <br>
                            <span class="txt">ex:0933-000-098</span>
                            <br>
                            <label for="">贊助人地址:</label>
                            <br>
<!--                             danny -->
                            <input style=" width: 200px;height:25px;margin-left: 0.5em; " type="text " placeholder="請輸入贊助人地址" name="
                    " id=" ">
                            <br>
                            <span class="txt">ex:新北市蘆洲區xxxxxxxxxxxx</span>
                            <br>
                            <label for="">贊助人mail:</label>
                            <br>
<!--                             danny -->
                            <input style=" width: 200px;height:25px;margin-left: 0.5em; " type="text " placeholder="請輸入贊助人e-mail" name="
                    " id=" ">
                            <br>
                            <span class="txt">ex:1234567ddddd@hahaha.com.tw</span>
                        </div>
                    </div>
                    <input class="enter-button" type="submit" name="" id="" value="付款確認">
                    </form>
                    
                    
                </div>
                <div class="projectFeedback-div">
                    <div class="Feedback-title">
                        <p class="feedback-p">回饋方案</p>
                    </div>
                    
                    <div id="feedBackDiv1" class="projectFeedback">        
                        <div class="projectFeedback-title">
                            <span id="feedBackMoney1" class="projectFeedback-span1">${money1}</span>
                            <span class="projectFeedback-span2">限量10/100</span>
                        </div>
                        <p>為了感謝您的贊助,我們將限量送出100份小禮物唷!!</p>   
                    </div>         
                    <div id="feedBackDiv2" class="projectFeedback">
                        <div class="projectFeedback-title">
                            <span id="feedBackMoney2" class="projectFeedback-span1">${money2}</span>
                            <span class="projectFeedback-span2">限量10/100</span>
                        </div>
                        <p>為了感謝您的贊助,我們將限量送出100份小禮物唷!!</p>
                    </div>
                    <div id="feedBackDiv3" class="projectFeedback">
                        <div class="projectFeedback-title">
                            <span id="feedBackMoney3" class="projectFeedback-span1">${money3}</span>
                            <span class="projectFeedback-span2">限量03/80</span>
                        </div>
                        <p>為了感謝您的贊助,我們將限量送出80份小禮物唷!!</p>
                    </div>
                </div>
            </div>
		</div>    
		<%--Footer部分 --%>
		<%@ include file="../partial/footer.jsp"%>
	</div>
	<%--JavaScript部分--%>
	<script>
            $("#feedBackDiv1").click(function () {
                var text = $("#feedBackMoney1").text();
                $("#payMoney").val(text);
            });
            $("#feedBackDiv2").click(function () {
                var text = $("#feedBackMoney2").text();
                $("#payMoney").val(text);
            });
            $("#feedBackDiv3").click(function () {
                var text = $("#feedBackMoney3").text();
                $("#payMoney").val(text);
            });
        </script>
</body>
</html>
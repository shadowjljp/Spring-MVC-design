<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>募資-各別專案</title>
<!--套用jquery-->
<script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/component/css/bootstrap.min3.3.7.css"/>">
<link rel="stylesheet" href="<c:url value="/component/css/jquery-1.12.1-ui.css"/>">
<!--套用css-->
<link rel="stylesheet" href="<c:url value="/component/css/base.css"/>">
<link rel="stylesheet" href="<c:url value="/component/css/layout.css"/>">
<link rel="stylesheet"
	href="<c:url value="/component/css/headerAndFooter.css"/>">
	<script src="<c:url value="/component/js/jquery-1.12.4.js"/>"></script>
    <script src="<c:url value="https://code.jquery.com/ui/1.12.1/jquery-ui.js"/>"></script>
	<script>
        $(function () {
            $("#tabs").tabs();
        });
    </script>
<style>
        body{
            background-color: rgb(255, 249, 239);
        }
        .container{
            margin-top: 6em;
        }
        .titlebody {
            text-align: center;
        }

        .top-div {
            
            width: 920px;
            height: 600px;
           
            margin: 0px auto;
        }

        .goalfinish {
            font-size: 18px;
            font-weight: bold;
            margin-left: 0.3em;
        }

        .goalday {
            font-size: 18px;
            margin-left: 340px;
        }

        .iframe-div {
            float: left;
            width: 565px;
            height: 320px;
            border: 2px solid black;
        }

        .bar-font-div {
            margin-top: 20px
        }

        .bar-font-left {
            font-size: 18px;
        }

        .bar-font-right {
            font-size: 18px;
            font-weight: bold;
            margin-left: 300px;
        }

        .detailitem {
            font-size: 35px;
            font: bold;
        }

        .detailitemsmall {
            padding-top: -20em;
        }

        .request-div {
            padding-top: -50em;
        }
        /*-------付款按鈕----------*/
        .button-div {
            width: 940px;
            height: 80px;
        }

        .CreateButton {
            float: right;
            margin-left: 10px;
            text-align: center;
            color: #cccccc;
            height: 3em;
            width: 8em;
            color: #8B6257;
            border: solid 0.5px;
            border-radius: 10px;

        }
        .CreateButton:hover{
            border: 1.5px solid #8B6257;
        }        
        /*------------------------*/
        .iframe-right-div {
            float: left;
            width: 325px;
            margin-left: 1.5em;
           
        }

        .progress-bar {
            position:absolute;
            top: 9%;
           left: 0.1%;
            height: 23px;
            width: 550px;
            background-color: rgb(248, 133, 181);
        }

        .progress {
            border: 1px solid rgb(201, 198, 198);
            width: 550px;
            height: 30px;
        }

        .goaldiv {
            margin-top: -1em;
            margin-left: 0.3em;
        }

        .goalfinish {
            font-size: 18px;
            font-weight: bold;
            margin-left: 0.3em;
        }

        .button-div {
            width: 1150px;
            margin: 0px auto;
        }

        .tabs {
            width: 920px;
            height: 3000px;
            float: left;

        }

        .projectFeedback-div {
            width: 210px;
            height: 2000px;
            float: right;
        }
         .projectFeedback {
            border: 1px solid rgb(201, 198, 198);
            width: 210px;
            height: 200px;
        }

        .projectFeedback-title {
            border: 1px solid rgb(221, 217, 217);
            width: 209px;
            height: 35px;
            background-color: rgb(248, 237, 222);
        }

        .projectFeedback-span1 {
            font-size: 20px;
            margin-left: 0.3em;
            font-weight: bold;
        }

        .projectFeedback-span2 {
            float: right;
            margin-right: 0.2em;
            font-size: 18px;
            text-align: center;
        }
        .button{
        	width: 90px;
        	height: 40px;
        	border-radius: 10px;
        	background-color: #F8EDDE;
        	border: 1px solid black;
        }
    </style>
</head>
<body>
	<div class="wrapper">
		<%--include header.jsp --%>
		<%@include file="../partial/headerForProject.jsp"%>
		<%--網頁內容 --%>
		<div class="container">
		
			<div class="top-div">
                <h3 class="titlebody">${bean.projname}</h3>
                <br>
                <div class="titlediv">
                    <div class="iframe-div">
                    ${bean.projytube}
<!--                         <iframe width="560" height="315" src="https://www.youtube.com/embed/1ZhuCiQ1nqY?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" -->
<!--                             allow="autoplay; encrypted-media" allowfullscreen></iframe> -->
                        <div class="bar-font-div">
                            <span class="bar-font-left">目前$${bean.totalmoney}</span>
                            <span class="bar-font-right">目標$${bean.projbdg}</span>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${bean.answer}%;">
                                </div>
                            </div>
                            <div class="goaldiv">
    
                                <span class="goalfinish">已完成${bean.answer}%</span>
                                <span class="goalday">還剩下${bean.projendt}天</span>
                            </div>
                        </div>
                    </div>
                    <div class="iframe-right-div">
                        <div>
                            <p class="detailitem">$${bean.totalmoney}</p>
                            <p class="detailitemsmall">目標$${bean.projbdg}</p>
                        </div>
                        <div>
                            <p class="detailitem">${bean.totalProjPay}</p>
                            <p class="detailitemsmall">人贊助</p>
                        </div>
                        <div class="request-div">
                            <p class="detailitem">${bean.projendt}</p>
                            <p class="detailitemsmall">天結束</p>
                            <br>
                        </div>
                        <div>
						<form id='${bean.id}' name="${bean.id}"  action='<c:url value="/projectpay.controller"></c:url>' method="get">
                           <input type="hidden" name="id" value="${bean.id}">
                            <input  type="button" value="贊助專案" class="button" onclick="submit()"> 
						</form>                          
                            <br>
                            <div>
                               <p>請有意贊助的朋友多多支持</p>
                            </div>
                        </div>
                        
                    </div>
                    <br>
                </div>
            </div>
		
    
            <div class="button-div">
                <div class="tabs" id="tabs">
                    <div class="choose-iframe">
                        <div>
                            <ul>
                                <li>
                                    <a href="#tabs-1">專案內容</a>
                                </li>
                                <li>
                                    <a href="#tabs-2">專案進度</a>
                                </li>
                                <li>
                                    <a href="#tabs-3">專案支持者</a>
                                </li>
                            </ul>
    
                            <div id="tabs-1" class="tabs-div">
    							${bean.projcontent}
                            </div>
                            <div id="tabs-2" class="tabs-div">
                                <p>
                                    專案進度未更新。
                                </p>
                            </div>
                            <div id="tabs-3" class="tabs-div">
                                <p>
    
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="projectFeedback-div">
                    <div class="projectFeedback">
                        <div class="projectFeedback-title">
                            <span class="projectFeedback-span1">$${bean.projplan1price}</span>
                            <span class="projectFeedback-span2">限量${bean.projplan1num}</span>
                        </div>
                        <p>${bean.projplan1}</p>
                    </div>
                    <div class="projectFeedback">
                        <div class="projectFeedback-title">
                            <span class="projectFeedback-span1">$${bean.projplan2price}</span>
                            <span class="projectFeedback-span2">限量${bean.projplan2num}</span>
                        </div>
                        <p>${bean.projplan2}</p>
                    </div>
                    <div class="projectFeedback">
                        <div class="projectFeedback-title">
                            <span class="projectFeedback-span1">$${bean.projplan3price}</span>
                            <span class="projectFeedback-span2">限量${bean.projplan3num}</span>
                        </div>
                        <p>${bean.projplan3}</p>
                    </div>
                    
                </div>
            
            </div>
		</div>
		
		<%@ include file="../partial/footer.jsp"%>
	</div>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享讀</title>
<link rel="stylesheet" href='<c:url value="/component/css/base.css"></c:url>'>
    <link rel="stylesheet" href='<c:url value="/component/css/layout.css"></c:url>'>
    <link rel="stylesheet" href='<c:url value="/component/css/main.css"></c:url>'>
    <link rel="stylesheet" href='<c:url value="/component/css/headerAndFooter.css"></c:url>'>
<!-- memberCenter Css Start-->
    <link rel="stylesheet" href='<c:url value="/component/css/memberCenter.css"></c:url>'>
<!-- memberCenter CSS end -->

<style>
        .list {
            font-family: 微軟正黑體;
            margin: auto;
            height: 1500px;
            width: 820px;
            margin-top: 10%;
        }

        .list-div {
            margin: auto;
        }

        .h2 {
            text-align: center;
        }

        .ul {
            list-style-type: none;
            width: 90%;
            margin: auto;
        }

        .li {
            list-style-type: none;
            float: left;
            height: 325px;
            margin-left:5em; 
            border-style: solid;
            border-width: 1.5px;
            border-color: #9d9d9d;
            padding: 20px;
        }

        .text {
            overflow: hidden;
            font-weight: bold;
            color: rgb(51, 50, 50);
            width: 140px;
            height: 2em;
            line-height: 1em;
            text-align: left;
            border-width: 3px;
            border-color: #8B6257;
        }

        .img {
            height: 200px;
            width: 140px;
        }

        .button {
            width: 60px;
            height: 40px;
            border: 1px solid rgb(58, 56, 56);
            border-radius: 10px;
            background-color: rgb(226, 195, 184);
        }

        .button:hover {
            border: 1.8px solid rgb(58, 56, 56);
        }

        .button-div {
            margin: auto;
            width: 125px;
            height: 60px;
        }

        .oneLineHopeList {
            height: 330px;
        
            margin-top: 2em;
        }
    </style>

</head>
<body>
  <div class="wrapper">
        <!-- wrapper start -->
                	<%@ include file="../partial/header.jsp"%>
                	        	<%@include file="../partial/memberCenter.jsp"%>
            <div class="container">
            <!-- container start -->

            <div class="list">
                <div class="list-div">
                    <h2 class="h2">願望清單</h2>
                    <!--第一行-->
                    <div class="oneLineHopeList">
                        <div class="li">
                            <a href="https://www.youtube.com/">
                                <img src="../component/images/HopeList/wonderLand.jpg" alt="wonderLand" class="img">
                                <p class="text">房思琪的初戀樂園</p>
                            </a>
                            <div class="button-div">
                                <button class="button">移除</button>
                                <button class="button">購買</button>
                            </div>
                        </div>
                        <div class="li">
                            <a href="#">
                                <img src="../component/images/HopeList/ThankYouForLate.jpg" alt="Late" class="img">
                                <p class="text">謝謝你遲到了</p>
                                <div class="button-div">
                                    <button class="button">移除</button>
                                    <button class="button">購買</button>
                                </div>
                            </a>
                        </div>
                        <divli class="li">
                            <a href="#">
                                <img src="../component/images/HopeList/BlockChain.jpg" alt="BlockChain" class="img">
                                <p class="text">區塊鏈革命</p>
                                <div class="button-div">
                                    <button class="button">移除</button>
                                    <button class="button">購買</button>
                                </div>
                            </a>
                    </div>
                    <!--第二行-->
                    <div class="oneLineHopeList">
                        <div class="li">
                            <a href="#">
                                <img src="../component/images/HopeList/courage.jpg" alt="courage" class="img">
                                <p class="text">被討厭的勇氣</p>
                                <div class="button-div">
                                    <button class="button">移除</button>
                                    <button class="button">購買</button>
                                </div>
                            </a>
                        </div>
                        <div class="li">
                            <a href="#">
                                <img src="../component/images/HopeList/orange.jpg" alt="orange" class="img">
                                <p class="text">蘋果橘子經濟學</p>
                                <div class="button-div">
                                    <button class="button">移除</button>
                                    <button class="button">購買</button>
                                </div>
                            </a>
                        </div>
                        <div class="li">
                            <a href="#">
                                <img src="../component/images/HopeList/kind.jpg" alt="kind" class="img">
                                <p class="text">你的善良必須有點鋒芒</p>
                                <div class="button-div">
                                    <button class="button">移除</button>
                                    <button class="button">購買</button>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="oneLineHopeList">
                        <div class="li">
                            <a href="#">
                                <img src="../component/images/HopeList/negotiation.jpg" alt="negotiation" class="img">
                                <p class="text">華頓商學院最受歡迎的談判課</p>
                                <div class="button-div">
                                    <button class="button">移除</button>
                                    <button class="button">購買</button>
                                </div>
                            </a>
                        </div>
                        <div class="li">
                            <a href="#">
                                <img src="../component/images/HopeList/taiwanHistory.jpg" alt="taiwanHistory" class="img">
                                <p class="text">臺灣史上最有梗的臺灣史</p>
                                <div class="button-div">
                                    <button class="button">移除</button>
                                    <button class="button">購買</button>
                                </div>
                            </a>
                        </div>
                        <div class="li">
                            <a href="#">
                                <img src="../component/images/HopeList/BlackHole.jpg" alt="BlackHole" class="img">
                                <p class="text">關係黑洞</p>
                                <div class="button-div">
                                    <button class="button">移除</button>
                                    <button class="button">購買</button>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="oneLineHopeList">
                        <div class="li">
                            <a href="#">
                                <img src="../component/images/HopeList/IndustrialRevolution.jpg" alt="IndustrialRevolution" class="img">
                                <p class="text">第四次工業革命</p>
                                <div class="button-div">
                                    <button class="button">移除</button>
                                    <button class="button">購買</button>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

            </div>

            <!-- container end -->

        </div>

            <!-- container end -->
        	<!--memberCenter選單include-->
        	<!--  -->
         <%@ include file="../partial/footer.jsp"%>
   </div>

        
</body>
</html>
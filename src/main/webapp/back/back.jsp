<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享讀後臺系統</title>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!--後臺icon套用-->
    <link rel="icon" type="image/x-icon" href="<c:url value="/component/images/ReadShare_back.jpg"/>">
    <!--後臺css套用-->
    <link rel="stylesheet" href="<c:url value="/component/css/base.css"/>">
    <link rel="stylesheet" href="<c:url value="/component/css/back.css"/>">
 
<script language="JavaScript">
        function ShowMenu(obj, noid) {
            var block = document.getElementById(noid);
            var n = noid.substr(noid.length - 1);
            if (noid.length == 4) {
                var ul = document.getElementById(noid.substring(0, 3)).getElementsByTagName("ul");
                var h2 = document.getElementById(noid.substring(0, 3)).getElementsByTagName("h2");
                for (var i = 0; i < h2.length; i++) {
                    h2[i].innerHTML = h2[i].innerHTML.replace("-", "+");
                    h2[i].style.color = "";
                }
                obj.style.color = "#FF0000";
                for (var i = 0; i < ul.length; i++) { if (i != n) { ul[i].className = "no"; } }
            } else {
                var span = document.getElementById("menu").getElementsByTagName("span");
                var h1 = document.getElementById("menu").getElementsByTagName("h1");
                for (var i = 0; i < h1.length; i++) {
                    h1[i].innerHTML = h1[i].innerHTML.replace("-", "+");
                    h1[i].style.color = "";
                }
                obj.style.color = "#0000FF";
                for (var i = 0; i < span.length; i++) { if (i != n) { span[i].className = "no"; } }
            }

            if (block.className == "no") {
                block.className = "";
                obj.innerHTML = obj.innerHTML.replace("+", "-");
            } else {
                block.className = "no";
                obj.style.color = "";
            }
        }
        function Loadfunction(aID) {
            var iFUN = document.getElementById(aID.id);
            var iPRG = document.getElementById("iframe");
            if (iFUN.id == "index") {
                iPRG.src = "../developingHoward/IndexContent.html";
            } else if (iFUN.id == "backProd") {
                iPRG.src = "<c:url value='/back/backProd.jsp'/>";
            } else if (iFUN.id == "backProdEdit") {
                iPRG.src = "backProdEdit.jsp";
            } else if (iFUN.id == "backClassEdit") {
                iPRG.src = "../developingPaco/pages/back/Product/backClassEdit.html";
            } else if (iFUN.id == "ResetPassword") {
                iPRG.src = "ResetPassword.html";
            } else if (iFUN.id == "SearchInformation") {
                iPRG.src = "SearchInformation.html";
            } else if (iFUN.id == "SearchOrder") {
                iPRG.src = "<c:url value="/developingJerry/backOrderCheck.jsp"/>";
            } else if (iFUN.id == "backFund") {
                iPRG.src = "backFund.jsp";
            } else if (iFUN.id == "backFundStatus") {
                iPRG.src = "<c:url value='/back/backFundStatus.jsp'/>";
            } else if (iFUN.id == "backFundAnalyzeIndex") {
                iPRG.src = "../developingPaco/pages/back/Fund/backFundAnalyzeIndex.html";
            } else if (iFUN.id == "SAMPLE01") {
                iPRG.src = "SAMPLE01.html";
            } else if (iFUN.id == "Acchome") {
                iPRG.src = "../developingRonnie/backAccHome.html";
            }
            else if (iFUN.id == "AccLogin") {
                iPRG.src = "../developingRonnie/backAccLogin.html";
            }
            else if (iFUN.id == "CantFind") {
                iPRG.src = "../developingRonnie/backCantFind.html";
            }
            else if (iFUN.id == "CashFlow") {
                iPRG.src = "../developingRonnie/backCashFlow.html";
            }
            else if (iFUN.id == "Cost") {
                iPRG.src = "../developingRonnie/backCost.html";
            }
            else if (iFUN.id == "Income") {
                iPRG.src = "<c:url value='/back/backIncome.jsp'/>";
            }
            else if (iFUN.id == "NetIncome") {
                iPRG.src = "../developingRonnie/backNetIncome.html";
            }
            else if (iFUN.id == "Tax") {
                iPRG.src = "../developingRonnie/backTax.html";
            }
            else if (iFUN.id == "NotFond") {
                iPRG.src = "../developingRonnie/pageNotFond.html";
            }
            else if (iFUN.id == "SAMPLE01") {
                iPRG.src = "SAMPLE02.html";
            } 
            else if(iFUN.id == "MemberManager"){
                iPRG.src = "../developingJimmy/backMember.html";
            }
            ////////////////howard begin
            else if(iFUN.id == "adEditor"){
                iPRG.src = "<c:url value='/back/adEditor.jsp'/>";
            }
            else if(iFUN.id == "adClick"){
                iPRG.src = "<c:url value='/back/adanalysis.jsp'/>";
            }
            else if(iFUN.id == "message"){
                iPRG.src = "<c:url value='/back/message_collection.jsp'/>";
            }////////howard end
            else {
                iPRG.src = "backPage.html";
            };
        }
    </script>
    <style>
    	.back-signout-button{
    		margin:auto;
    		color:#8B6257;
    		border:1px solid #8B6257;
    		border-radius:20px;
    		width: 80px;
    		height: 45px;
    		font-size:30px;
    		float: right;
     		margin-right:1.6em;  
    		margin-top: 0.5em;
			display: block;
    		text-align: center;
    	}
    	.back-signout-button:hover{
    		border:1.5px solid #8B6257;
    		text-decoration: none;
    	}
    	.back-signout-button-a{
     		text-align: center; 
    	}
    	.welcome-span{
    		margin-top:0.5em;
    
/*     		width: 390px; */
    		height:55px;
    		bottom:0;
    		float: left;
    		margin-left:2.8em; 
    		font-size: 30px;
    		absolute:none;
    		font-family: 微軟正黑體; 
    		color:#8B6257; 		
    	}
    </style>
</head>
<body>
	<div class="wrapper">
        <header>
            <nav>
                <ul class="headerul">
                    <div class="logo">
                        <a href="../index.jsp">
                            <img class="projimg" src="<c:url value="/component/images/ReadShareLOGO.png"/>" alt="">
                        </a>
                    </div>
                    <div class="logoSp">享讀 後臺</div>  
<%--                     ${requestScope.user} --%>
                    		<span class="welcome-span">嗨，${manager.admacc}，歡迎光臨享讀！</span>
<!--                     <span class="welcome-span">嗨,Danny,歡迎光臨享讀後臺</span> -->
                    <div class="back-signout-button">
                    <a class="back-signout-button-a" href='<c:url value="/signout.controller"></c:url>'>登出</a>
                	</div>
                </ul>
            </nav>
        </header>

        <div class="container">
            <section class="section1">
                <aside class="left">
                    <div class="left-div">
                        <div id="menu">
                            <h1 > 後臺管理選單</h1>
                            <span id="NO0">
                                <h2 onClick="javascript:ShowMenu(this,'NO00')"> + 產品管理</h2>
                                <ul id="NO00" class="no">
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="backProd">產品查詢</a>
                                    </li>
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="backProdEdit">產品編輯</a>
                                    </li>
                                   </ul>
                                <h2 onClick="javascript:ShowMenu(this,'NO01')"> + 會員功能</h2>
                                <ul id="NO01" class="no">
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="MemberManager">會員管理</a>
                                    </li>
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="SearchInformation">會員資料分析</a>
                                    </li>
                                </ul>
                                <h2 onClick="javascript:ShowMenu(this,'NO02')"> + 訂單管理</h2>
                                <ul id="NO02" class="no">
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="SearchOrder">訂單查詢</a>
                                    </li>
                                </ul>
                                <h2 onClick="javascript:ShowMenu(this,'NO03')"> + 募資專案</h2>
                                <ul id="NO03" class="no">
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="backFund">專案查詢</a>
                                    </li>
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="backFundStatus">專案審核</a>
                                    </li>
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="backFundAnalyzeIndex">專案分析</a>
                                    </li>
                                </ul>
                                <h2 onClick="javascript:ShowMenu(this,'NO04')"> + 財務統計分析</h2>
                                <ul id="NO04" class="no">
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="Acchome">Acchome</a>
                                    </li>
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="AccLogin">AccLogin</a>
                                    </li>
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="CantFind">CantFind</a>
                                    </li>
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="CashFlow">CashFlow</a>
                                    </li>
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="Cost">Cost</a>
                                    </li>
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="Income">收入</a>
                                    </li>
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="NetIncome">NetIncome</a>
                                    </li>
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="Tax">Tax</a>
                                    </li>
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="NotFond">NotFond</a>
                                    </li>

                                </ul>
                                <h2 onClick="javascript:ShowMenu(this,'NO05')"> + 廣告相關</h2>
                                <ul id="NO05" class="no">
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="adEditor">首頁編輯</a>
                                    </li>
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="adClick">點擊分析</a>
                                    </li>
                                </ul>
                                
                                <h2 onClick="javascript:ShowMenu(this,'NO06')"> + 客服處理</h2>
                                <ul id="NO06" class="no">
                                    <li class="message">
                                        <a href="#" onClick="Loadfunction(this);" id="message">即時客服</a>
                                    </li>
                                </ul>
                                
                            </span>
                        </div>
                    </div>
                </aside>
            </section>
            <section class="section2">
                <div>
                    <!--修改下方index.html位置，即為iframe裡的頁面-->
                    <a href="../developing/IndexContent.html"></a>
                    <a href="../developing/message_collection.html"></a>
                    <a href="../developing/ClickTest.html"></a>
                    <a href="../developing/adEditor.html"></a>
                    <iframe src="backPage.jsp" id="iframe" align="middle" scrolling="auto"></iframe>
                </div>
            </section>
        </div>


    </div>
</body>
</html>
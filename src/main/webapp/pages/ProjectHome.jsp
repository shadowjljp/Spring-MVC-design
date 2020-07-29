<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>募資首頁</title>
<!--套用jquery-->
<script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--圖片輪播-->
<link rel="stylesheet" href="<c:url value="/component/css/posterTvGrid.css"/>">
<script src="https://code.jquery.com/jquery-3.3.1.js"
	type="text/javascript"></script>
<script src="<c:url value="/component/js/posterTvGrid.js"/>"></script>
<!--套用css-->
<link rel="stylesheet" href="<c:url value="/component/css/base.css"/>">
<link rel="stylesheet" href="<c:url value="/component/css/layout.css"/>">
<link rel="stylesheet"
	href="<c:url value="/component/css/headerAndFooter.css"/>">
<style>
body {
	background-color: rgb(255, 249, 239);
}

.projhome-div {
	margin: 0px auto;
	width: 970px;
}

/*-----------按鈕div--------------*/
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

.CreateButton:hover {
	border: 1.5px solid #8B6257;
}

/*-----------------------------------*/

/*-----------專案展示div--------------*/
.OneProject-div {
	width: 970px;
	margin: auto;
	height: 450px;
}

.projimg {
	width: 300px;
	height: 195px;
	border-radius: 13px;
}

.projarea {
	border: 1.5px solid rgb(112, 111, 111);
	border-radius: 15px;
	width: 300px;
	height: 400px;
	margin-left: 1em;
	margin-top: 1em;
	overflow: hidden;
	float: left;
}

.projarea:hover {
	border: 2px solid rgb(112, 111, 111);
}

.projtitle {
	text-align: center;
	font-weight: bold;
	font-size: 17px;
	margin-left: 0.5em;
	margin-right: 0.3em;
	margin-top: 0.1em;
	height: 2em;
	overflow: hidden;
}

.projcontent {
	margin-left: 0.1em;
	margin-right: 0.1em;
	height: 4.2em;
	overflow: hidden;
}

/*-----------專案進度條--------------*/
.progress {
	border: 1px solid rgb(119, 116, 116);
	height: 15px;
}

.progress-bar {
	height: 14px;
	background-color: black;
}

/*--------------------------------*/

/*-----------專案文字內容--------------*/
.goaldiv {
	margin-top: 0.3em;
	margin-left: 0.3em;
}

.goalfinish {
	font-weight: bold;
	margin-left: 0.3em;
}

.goalday {
	float: right;
	margin-right: 0.3em;
}

.buttompage {
	text-align: center;
}

/*--------------------------------*/

/*-----------頁數分頁---------------*/
</style>
</head>
<body>
	<div class="wrapper">
		<%--include header.jsp --%>
		<%@include file="../partial/headerForProject.jsp"%>
		<%--網頁內容 --%>
		<div class="container">
			<div id="content">
				<!--圖片輪播-->
				<div id="posterTvGrid" style="margin: 40px auto 0 auto;"></div>
				<script type="text/javascript">
					var posterTvGrid = new posterTvGrid('posterTvGrid', {
						className : "posterTvGrid"
					}, [ {
						"img" : "..\/component\/images\/maxresdefault.jpg",
						"title" : "Lorem ipsum dolor sit amet",
						"url" : "http:\/\/paco.tw\/proj"
					}, {
						"img" : "..\/component\/images\/dog.jpg",
						"title" : "Lorem ipsum dolor sit amet",
						"url" : "http:\/\/paco.tw\/proj"
					}, {
						"img" : "..\/component\/images\/FPjunhD.jpg",
						"title" : "Lorem ipsum dolor sit amet",
						"url" : "http:\/\/paco.tw\/proj"
					}, {
						"img" : "..\/component\/images\/project.png",
						"title" : "Lorem ipsum dolor sit amet",
						"url" : "http:\/\/paco.tw\/proj"
					}, {
						"img" : "..\/component\/images\/givememoney.png",
						"title" : "Lorem ipsum dolor sit amet",
						"url" : "http:\/\/paco.tw\/proj"
					}, {
						"img" : "..\/component\/images\/cute.jpg",
						"title" : "Lorem ipsum dolor sit amet",
						"url" : "http:\/\/paco.tw\/proj"
					}, ]);
				</script>

				<!--首頁專案展示div-->
				<div class="projhome-div">
					<div class="button-div">
						<input class="CreateButton" type="button" value="新增專案"
							onclick="location.href='CreateProject.html'"> <input
							class="CreateButton" type="button" value="我的專案"
							onclick="location.href='MyProject.html'">
					</div>
					<div id="firstProj-load"> 
<!-- 					class="OneProject-div"				 -->
					
<!-- 						<a href="project.html"> -->
<!-- 							<div class="projarea"> -->
<%-- 								<img class="projimg" src="<c:url value="/component/images/maxresdefault.jpg"/>" alt=""> --%>
<!-- 								<p class="projtitle">UYAS Play 頑.音響｜音樂與風格由你混搭</p> -->
<!-- 								<p class="projcontent">喜歡聽音樂的我們，總想像著有沒有更簡單、更直覺的聆聽方式。找不到歌？何不把常用的音樂服務整合在一起；配對繁瑣？</p> -->
<!-- 								<div class="progress"> -->
<!-- 									<div class="progress-bar" role="progressbar" aria-valuenow="60" -->
<!-- 										aria-valuemin="0" aria-valuemax="100" style="width: 55%;"> -->
<!-- 									</div> -->

<!-- 								</div> -->
<!-- 								<div class="goaldiv"> -->
<!-- 									<span>$550,000</span> <span class="goalfinish">已完成55%</span> <span -->
<!-- 										class="goalday">還剩下xx天</span> -->
<!-- 								</div> -->

<!-- 							</div> -->
<!-- 						</a> -->
<!-- 						<div class="projarea"> -->
<%-- 							<img class="projimg" src="<c:url value="/component/images/dog.jpg"/>" alt=""> --%>
<!-- 							<p class="projtitle">如何幫助小狗適應新的環境?</p> -->
<!-- 							<p class="projcontent">快拿出你的錢錢來幫助小狗找到新家,並且讓他們適應新的環境</p> -->
<!-- 							<div class="progress"> -->
<!-- 								<div class="progress-bar" role="progressbar" aria-valuenow="60" -->
<!-- 									aria-valuemin="0" aria-valuemax="100" style="width: 69%;"> -->

<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="goaldiv"> -->
<!-- 								<span>$690,000</span> <span class="goalfinish">已完成69%</span> <span -->
<!-- 									class="goalday">還剩下xx天</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="projarea"> -->
<%-- 							<img class="projimg" src="<c:url value="/component/images/FPjunhD.jpg"/>" alt=""> --%>
<!-- 							<p class="projtitle">天線寶寶要跟你互相傷害耶!!!快點來參與</p> -->
<!-- 							<p class="projcontent">覺得天線寶寶很白癡嗎?是不是想要揍他一頓了呢,付出你的錢我們幫你</p> -->
<!-- 							<div class="progress"> -->
<!-- 								<div class="progress-bar" role="progressbar" aria-valuenow="60" -->
<!-- 									aria-valuemin="0" aria-valuemax="100" style="width: 55%;"> -->

<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="goaldiv"> -->
<!-- 								<span>$550,000</span> <span class="goalfinish">已完成55%</span> <span -->
<!-- 									class="goalday">還剩下xx天</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>

						<div id="TestAjax"></div>
					<!--抓到的資料丟進以下DIV-->
				</div>
				<!--首頁專案展示div(尾巴)-->
			</div>
		</div>
		<%@ include file="../partial/footer.jsp"%>
	</div>
	<script>
	$(document).ready(function () {
		 var x=0;
		var persent;
		//點擊進頁面自動載入
		
		$.get("../ajaxproject.controller", { "projstatus":"執行中","x":x }, function (projectBeans) {
			projectBeans.forEach(function (bean) {
				persent=(bean.answer+"").substring(0,4);
				
                $('#firstProj-load').append("<form id='"+bean.id+"' name='"+bean.id+"' action='<c:url value='/selectprojhome.controller'/>' method='get'><input type='hidden' name='id' value='"+bean.id+"'><div class='projarea'><button type='button' onClick='submit()'><img class='projimg' src='"+bean.projimg+"'/><p class='projtitle'>"+bean.projname+"</p><p class='projcontent'>"+bean.projcontent+"</p></button><div class='progress'><div class='progress-bar' role='progressbar' aria-valuenow='60'aria-valuemin='0' aria-valuemax='100' style='width: "+persent+"%;'></div></div><div class='goaldiv'><span>$"+bean.projbdg+"</span><span class='goalfinish'>已完成"+persent+"%</span><span class='goalday'>還剩下"+bean.projendt+"天</span></div></div></form>");
            });//forEach
			x=6;
			console.log('x='+x)
        }, "json");//.get
        //Scroll事件


            });				
    </script>
</body>
</html>

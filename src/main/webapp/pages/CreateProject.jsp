<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增提案</title>
<!--套用jquery-->
<script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--套用css-->
<link rel="stylesheet" href="<c:url value="/component/css/base.css"/>">
<link rel="stylesheet" href="<c:url value="/component/css/layout.css"/>">
<link rel="stylesheet"
	href="<c:url value="/component/css/headerAndFooter.css"/>">
<style>
        .title-h1 {
            font-size: 50px;
        }

        hr {
            width: 400px;
            margin: auto;
            margin-bottom: 1em;
        }

        .text {
            width: 200px;
        }

        .body {
            text-align: center;
            border: 1.5px solid rgb(30, 31, 31);
            width: 700px;
            margin: auto;
        }

       .body-form {
            margin-top: 10%;
            margin-bottom: 5%;
        }

        .txt {
            font-size: 80%;
            margin-left: 0.5em;
            margin-bottom: 1em;
            width: 450px;
            color: gray;

        }

        .dialog,
        .dialog__overlay {
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }

        .dialog {
            position: fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            pointer-events: none;
        }

        .dialog__overlay {
            position: absolute;
            z-index: 1;
            background: rgba(55, 58, 71, 0.9);
            opacity: 0;
            transition: opacity 0.3s;
        }

        .dialog--open .dialog__overlay {
            opacity: 1;
            pointer-events: auto;
        }

        .dialog__content {
            width: 50%;
            max-width: 560px;
            min-width: 290px;
            background: #fff;
            padding: 4em;
            text-align: center;
            position: relative;
            z-index: 5;
            opacity: 0;
        }

        .dialog--open .dialog__content {
            pointer-events: auto;
        }

        /* Content */

        .dialog h2 {
            margin: 0;
            font-weight: 400;
            font-size: 2em;
            padding: 0 0 2em;
            margin: 0;
        }
    </style>
</head>
<body>
	<div class="wrapper">
		<%--include header.jsp --%>
		<%@include file="../partial/headerForProject.jsp"%>
		<%--網頁內容 --%>
		<div class="container">
			<form class="body-form" action="<c:url value="/ajaxproject.controller"/>" method="get">
                <div class="body">


                    <h1 class="title-h1">開始提案</h1>
                    <hr>
                    <label for="">輸入專案名稱:</label>
                    <input type="text" name="projname" placeholder="專案名稱" autocomplete="off" size="20" >
                    <span class="require">*必填</span>
                    <br>
                    <span class="txt">ex:《夢迴樂園 Wanderland》八仙塵燃傷者復健之路 紀錄片院線上映計畫</span>
                    <hr>
                    <label for="">專案圖片:</label>
                    <div style="margin-left:15em">
                    <input type="file" name="projimg" autocomplete="off" size="20" >
                    </div>
                    <span class="require">*必填</span>
                    <br>
                    <span class="txt">請將專案圖片上架</span>
                    <hr>
                    <label>專案發布時間:</label>
                    <input type="date" name="projt" placeholder="發布的日期" autocomplete="off" size="20" >
                    <span class="require">*必填</span>
                    <span class="txt"></span>
                    <br>
                    <span class="txt">ex:2016/01/01</span>
                    <hr>
                    <label>專案開始時間:</label>
                    <input type="date" name="projstartt" placeholder="開始募資日期" autocomplete="off" size="20" >
                    <span class="require">*必填</span>
                    <span class="txt"></span>
                    <br>
                    <span class="txt">ex:2016/01/01</span>
                    <hr>
                    <label>專案結束時間:</label>
                    <input type="date" name="projendt" placeholder="募資結束日期" autocomplete="off" size="20" >
                    <span class="require">*必填</span>
                    <span class="txt"></span>
                    <br>
                    <span class="txt">ex:2016/01/01</span>
                    <hr>
                    <label for="">專案目標預算:</label>
                    <input type="text" name="projbdg" placeholder="請輸入目標預算" autocomplete="off" size="20" >
                    <span class="require">*必填</span>
                    <br>
                    <span class="txt">ex:$500000</span>
                    <hr>
                    <label for="">募資方案1:</label>
                    <input type="text" name="projplan1" placeholder="請輸入回饋方案1內容說明" autocomplete="off" size="20" >
                    <span class="require">*必填</span>
                    <br>
                    <span class="txt">ex:限量50個小熊送給大家!</span>
                    <hr>
                    <label for="">募資方案1(價錢):</label>
                    <input type="text" name="projplan1price" placeholder="請輸入回饋方案1達標價錢" autocomplete="off" size="20" >
                    <span class="require">*必填</span>
                    <br>
                    <span class="txt">ex:$100</span>
                    <hr>
                    <label for="">募資方案1(數量):</label>
                    <input type="text" name="projplan1num" placeholder="請輸入回饋方案1數量" autocomplete="off" size="20" >
                    <span class="require">*必填</span>
                    <br>
                    <span class="txt">ex:100</span>
                    <hr>
                    <label for="">募資方案2:</label>
                    <input type="text" name="projplan2" placeholder="請輸入回饋方案2內容說明" autocomplete="off" size="20" >
                    <span class="require">*必填</span>
                    <br>
                    <span class="txt">ex:限量50個小熊送給大家!</span>
                    <hr>
                    <label for="">募資方案2(價錢):</label>
                    <input type="text" name="projplan2price" placeholder="請輸入回饋方案2達標價錢" autocomplete="off" size="20" >
                    <span class="require">*必填</span>
                    <br>
                    <span class="txt">ex:$300</span>
                    <hr>
                     <label for="">募資方案2(數量):</label>
                    <input type="text" name="projplan2num" placeholder="請輸入回饋方案2數量" autocomplete="off" size="20" >
                    <span class="require">*必填</span>
                    <br>
                    <span class="txt">ex:200</span>
                    <hr>
                    <label>募資內容：</label>
                    <label for="">募資方案3:</label>
                    <input type="text" name="projplan3" placeholder="請輸入回饋方案3內容說明" autocomplete="off" size="20" >
                    <span class="require">*必填</span>
                    <br>
                    <span class="txt">ex:限量50個小熊送給大家!</span>
                    <hr>
                    <label for="">募資方案3(價錢):</label>
                    <input type="text" name="projplan3price" placeholder="請輸入回饋方案達標價錢" autocomplete="off" size="20" >
                    <span class="require">*必填</span>
                    <br>
                    <span class="txt">ex:$800</span>
                    <hr>
                     <label for="">募資方案3(數量):</label>
                    <input type="text" name="projplan3num" placeholder="請輸入回饋方案3數量" autocomplete="off" size="20" >
                    <span class="require">*必填</span>
                    <br>
                    <span class="txt">ex:200</span>
                    <hr>
                    <label for="">專案影片(YouTube連結)</label>:</label>
                    <input type="text" name="projytube" placeholder="請輸入影片youtube連結" autocomplete="off" size="20" >
                    <span class="require">*必填</span>
                    <br>
                    <span class="txt">請按影片右下角分享>>>嵌入>>>複製>>>iframe xxxxxx /iframe </iframe>
                    </span>
                    <hr>
                    <textarea style="margin-left: 1em;" cols="40" rows="20" name="projcontent"></textarea>
                    <span class="require">*必填</span>
                    <br>
                    <span class="txt">ex:2015年6月27日晚上8點32分，一場在八仙樂園舉辦的彩色派對，因粉塵暴燃霎時間成為一片火海。這場震撼台灣的公安意外，當時台灣社會高度關注，陽光也旋即成立四個重建中心及一個住宿家園，並邀請曾以《粉墨登場》紀錄片入圍金馬獎的導演吳星螢用影像記錄下這群傷者的身心復健歷程。</span>
                    <hr>
					<input type="hidden" readonly="readonly" name="projstatus" value="審核中" >

                    <input style="margin-bottom:0.5em" type="submit" name="" id="" value="送出">

                </div>
                </form>
		</div>
		<%@ include file="../partial/footer.jsp"%>
	</div>

</body>
</html>
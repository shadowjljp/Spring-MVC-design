<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>募資-搜尋結果</title>
<!--套用jquery-->
    <script src="<c:url value="/component/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/component/css/bootstrap.min3.3.7.css"/>">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--套用Header Footer CSS-->
	<link rel="stylesheet" href="<c:url value="/component/css/base.css"/>">
	<link rel="stylesheet" href="<c:url value="/component/css/layout.css"/>">
	<link rel="stylesheet" href="<c:url value="/component/css/headerAndFooter.css"/>">
<style>
		
        .proj-img {
            width: 280px;
            height: 190px;
            border-radius: 13px;
        }
        .title-h1 {
            font: bold;
            font-size: 50px;
            margin-left: 2em;
        }

        .title-h2 {
            font: bold;
            font-size: 50px;
            margin-left: 2em;
            height: 100vh;
        }

        .projarea {
            border-radius: 15px;
            border: 1px solid rgb(28, 29, 29);
            width: 280px;
            height: 340px;
            margin-left: 1em;
            margin-top: 1em;
            overflow: hidden;
            float: left;
            color: black;
        }
        .projarea:hover{
        	border: 1.5px solid rgb(28, 29, 29);
        }

        .proj-line {
           	width:1190px;
            margin: auto;
        }

        .projtitle {
            font-weight: bold;
            font-size: 14px;
            margin-left: 0.3em;
            margin-right: 0.3em;
            height: 2em;
            overflow: hidden;
            color: black;
        }

        .projcontent {
            margin-top: -12px;
            line-height: 2em;
            height: 55px;
            font-size: 11px;
            overflow: hidden;
            color: black;
        }

        .button {
            width: 150px;
            height: 40px;
            margin-left: 1em;
        }

        .pagination>li>a,
        .pagination>li>span {
            border-radius: 50% !important;
            margin-bottom: 0 5px;
        }

        .buttompage {
            margin: auto;
            width: 250px;
            height: 38px;
        }

        .progress-bar {
            height: 13px;
            background-color: rgb(30, 30, 31);

        }

        .progress {
            border: 1px solid rgb(156, 154, 154);
            height: 14px;
        }

        .goaldiv {
            margin-top: -1.1em;
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

        /*---搜尋框ajax的css---*/

        #Search-div {
            margin-left: 0.7em;
            width: 160px;
            border-bottom: 1px solid gray;
            border-left: 1px solid gray;
            border-right: 1px solid gray;
            background-color: white;
            z-index: 1;
            position: fixed;
            overflow: hidden;
        }

        .Search-content {
            margin-top: 7px;
            margin-bottom: 2px;
            color: black;
            width: 160px;
            height: 30px; 
            font-size: 30px;
        }

        .Search-content:hover {
            background-color: rgb(206, 151, 132);
        }

        /*--------------------*/
    </style>
    <script>
    
    </script>
</head>
<body>
	<div class="wrapper">
		<%--include header.jsp --%>
		<%@include file="../partial/headerForProject.jsp"%>
		<%--網頁內容 --%>
		<div class="container">
			<c:choose>
				<c:when test="${resultCount ne '0'}">
                <h1 class="title-h1">關鍵字:${keyWord} ,共找到 ${resultCount} 筆資料</h1>
                </c:when>
                <c:otherwise>
                <h1 class="title-h2">很抱歉,找不到您要的專案</h1>
            	</c:otherwise>
            </c:choose>
            <c:forEach items="${resultList}" var="map">
				<div class="proj-line">
                    <div class="projarea">
            	<form id='${map.id}' name="${map.id}" action='<c:url value='/selectprojhome.controller'/>' method='get'>
           			 <input type="hidden" name="id" value="${map.id}">
           			 <button type="button" onclick="submit()">
                        <img class="proj-img" src="${map.projimg}"/>
                        <p class="projtitle">${map.projname}</p>

                        <p class="projcontent">${map.projcontent}</p>
                        </button>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${map.answer}%">

                            </div>
                        </div>
                 </form> 
                        <div class="goaldiv">
                            <span>$${map.projbdg}</span>
                                <span class="goalfinish">已完成${map.answer}%</span>
                                <span class="goalday">還剩下${map.projendt}天</span>
                        </div>
                    </div>                  
                </div> 
              </c:forEach>   
        </div>
        
		<%--Footer部分 --%>
		<%@ include file="../partial/footer.jsp"%>
	</div>
</body>
</html>
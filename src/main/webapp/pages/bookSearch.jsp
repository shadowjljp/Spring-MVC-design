<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/x-icon" href="<c:url value="/component/images/ReadShare.ico"/>">
<title>享讀</title>
		
	<link rel="stylesheet" href="<c:url value="/component/css/base.css"/>">
    <link rel="stylesheet" href="<c:url value="/component/css/layout.css"/>">
    <link rel="stylesheet" href="<c:url value="/component/css/headerAndFooter.css"/>">
    <!-- <link rel="stylesheet" href="../component/css/main.css"> -->
    <script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>


    <style>
        .divSearchInfo {
            height: 50px;
            line-height: 50px;

        }

        .divProductListRow {
            width: 90vw;
            height: 30vh;
            /* background-color: green; */
            margin-bottom: 10px;
        }

        .divProductImg>a>img {
            height: 30vh;
            /* width: 15vw; */
            position: absolute;
        }

        .divProductInfo {
            height: 30vh;
            width: 60vw;
            /* background-color: red; */
            position: absolute;
            left: 15vw;
            padding-left: 10px;
            overflow: hidden;

        }

        .divProductInfo>a>h5 {
            margin-top: 5px;
            margin-bottom: 5px;
        }

        .divProductInfo>a>h6 {
            margin-top: 0px;
            margin-bottom: 5px;
        }

        .divProductInfo>span {
            margin-top: 5px
        }

        .divProductInfo>p {
            margin-top: 5px;
            color: black;
            line-height: 25px;
        }

        .divListFn {
            height: 30vh;
            width: 15vw;
            /* background-color: blue; */
            position: absolute;
            right: 0px;
            background-color: rgb(233, 201, 192);
            text-align: center;
        }

        .divListFn img {

            height: 40px;
            display: block;
            margin: auto;
        }

        .divListFn>div {
            position: relative;
            top: 10%;
        }

        .divListFn>div+div {
            position: relative;
            top: 25%;
        }
      

        .divListFn>div>div {
            display: inline;

        }
    </style>
    
</head>

<body>

    <div class="wrapper">
	<%--include header.jsp --%>
		<%@ include file="../partial/header.jsp"%>
		
		<%--網頁內容 --%>
        <div class="container">
       
		<c:choose>
			<c:when test="${resultCount ne '0'}">
				<div class="divSearchInfo">
	                <span> 關鍵字 : ${keyWord} 共找到 ${resultCount} 筆資料</span>
	            </div>
			</c:when>
			<c:otherwise>
				<div class="divSearchInfo">
	                <span>很抱歉，找不到您要的書籍。</span>
	            </div>
			</c:otherwise>
		</c:choose>
		<c:forEach items="${resultsList}" var="map" >
            <div class="divProductListRow">
                <div class="divProductImg">
                    <a href="<c:url value='/book.controller'/>?id=${map.bookId}">
                        <img src="${map.bookImg}" alt="">
                    </a>
                </div>
                <div class="divProductInfo">
                    <a href="">
                        <h5>${map.bookName}</h5>
                    </a>
                    <a href="">
                        <h6>作者：${map.bookAuthor}</h6>
                    </a>

                    <span>出版社：${map.bookPub} 出版日期：${map.bookPubDate} 定價：${map.bookPrice}</span>
                    <p>${map.bookIntro}</p>
                </div>

                <div class="divListFn">

                    <div>
                        <div>願望清單</div>
                        <img src="<c:url value="/component/images/like.png"/>" alt="">
                    </div>

                    <div>
                        <div>加入購物車</div>
                        <img src="<c:url value="/component/images/cart_cargo.png"/>" alt="">
                    </div>
                </div>
<!-- 				row -->
            </div>
		</c:forEach>
            
            
<!--             container -->
        </div>
        
        
        <%@ include file="../partial/footer.jsp"%>
    </div>
    <script>

        $(
            $(".divListFn img[src$='like.png']").css({ "filter": "grayscale(100%)" })
                .click(
                    function () {
                        var tempObj1 = $(this);
                        // alert(tempObj1.attr('style'));
                        if (tempObj1.attr('style').indexOf("grayscale(100%)") != -1) {
                            $(this).css({ "filter": "grayscale(0%)" })
                        } else {
                            $(this).css({ "filter": "grayscale(100%)" })
                        }
                    })
        )
    </script>
</body>

</html>
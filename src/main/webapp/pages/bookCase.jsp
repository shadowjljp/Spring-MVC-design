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

    <link rel="stylesheet" href='<c:url value="/component/js/slick-1.8.1/slick/slick.css"></c:url>'>
    <link rel="stylesheet" href='<c:url value="/component/js/slick-1.8.1/slick/slick-theme.css"></c:url>'>

    <!--memberCenter 選單-->
    <link rel="stylesheet" href='<c:url value="/component/css/memberCenter.css"></c:url>'>
    <!---->

    <script src='<c:url value="/component/js/jquery-3.3.1.min.js"></c:url>'></script>
    <script src='<c:url value="/component/js/bootstrap.min.js"></c:url>'></script>
    <script src='<c:url value="/component/js/jquery-ui-effects.min.js"></c:url>'></script>

    <script src='<c:url value="/component/js/slick-1.8.1/slick/slick.min.js"></c:url>'></script>
<script type="text/javascript">

// $(document).ready(function () {
//     $(window).scroll(function () {
//         // if ($(document).scrollTop() <= 0) {
//         //     alert("滚动条已经到达顶部为0");
//         // }
//         if ($(document).scrollTop() >= $(document).height() - $(window).height()) {
//             // alert("滚动条已经到达底部为" + $(document).scrollTop());
//             alert("到底了");
//         }
//     });
// });

</script>
	<style>
        .body {
            background-color: #FFF9EF;
            font-family: 微軟正黑體;
        }

        .bookCase {
            margin: auto;
            width: 1200px;
            height: 1000px;
            background-color: #FFF9EF;
            margin-top: 10%;
        }

        .book {
            height: 200px;
            width: 140px;
        }
        .book-title{
            font-weight: bold;
            color: black;
            line-height: 2em;
            overflow: hidden;
        }

        .td {
            padding: 50px;
        }
       
    </style>

</head>
<body>
<div class="wrapper">
        <!-- wrapper start -->
        
	<%@ include file="../partial/header.jsp"%>

       <div class="container">
            <!-- container start -->
            <div class="bookCase">
            
<%--                 <form action='<c:url value="/pickbook.controller"></c:url>' method="post"> --%>
<!--                 <input name="bookid" type="text"> -->
<!--                 <input type="submit"> -->
<%--                 ${book.bkefile} --%>
<!--                 </form> -->

                <table class="table">
<!--                     <tr> -->
<!--                         <td class="td"> -->
<%--                             <a href='<c:url value="https://www.youtube.com/"></c:url>'> --%>
<%--                                 <img src='<c:url value="/component/images/BookCase/honorCity.jpg"></c:url>' alt="honorCity" class="book"> --%>
<!--                                 <p class="book-title">光榮城市,柯文哲的進步價值</p> -->
<!--                             </a> -->
<!--                         </td> -->
<!--                         <td class="td"> -->
<%--                             <a href='<c:url value=""></c:url>'> --%>
<%--                                 <img src='<c:url value="/component/images/BookCase/algorithm.jpg"></c:url>' alt="algorithm" class="book"> --%>
<!--                                 <p class="book-title">演算法圖鑑</p> -->
<!--                             </a> -->
<!--                         </td> -->
<!--                         <td class="td"> -->
<%--                             <a href='<c:url value=""></c:url>'> --%>
<%--                                 <img src='<c:url value="/component/images/BookCase/catcher.jpg"></c:url>' alt="catcher" class="book"> --%>
<!--                                 <p class="book-title">The Catcher in the Rye麥田捕手</p> -->
<!--                             </a> -->
<!--                         </td> -->
<!--                         <td class="td"> -->
<%--                             <a href='<c:url value=""></c:url>'> --%>
<%--                                 <img src='<c:url value="/component/images/BookCase/child.jpg"></c:url>' alt="child" class="book"> --%>
<!--                                 <p class="book-title">你的孩子不是你的孩子</p> -->
<!--                             </a> -->
<!--                         </td> -->
<!--                         <td class="td"> -->
<%--                             <a href='<c:url value=""></c:url>'> --%>
<%--                                 <img src='<c:url value="/component/images/BookCase/courage.jpg"></c:url>' alt="courage" class="book"> --%>
<!--                                 <p class="book-title">被討厭的勇氣</p> -->
<!--                             </a> -->
<!--                         </td> -->
<!--                     </tr> -->
<!--                     <tr> -->
<!--                         <td class="td"> -->
<%--                             <a href='<c:url value=""></c:url>'> --%>
<%--                                 <img src='<c:url value="/component/images/BookCase/america.jpg"></c:url>' alt="america" class="book"> --%>
<!--                                 <p class="book-title">美國的反制傳統</p> -->
<!--                             </a> -->
<!--                         </td> -->
<!--                         <td class="td"> -->
<%--                             <a href='<c:url value=""></c:url>'> --%>
<%--                                 <img src='<c:url value="/component/images/BookCase/orange.jpg"></c:url>' alt="orange" class="book"> --%>
<!--                                 <p class="book-title">蘋果橘子經濟學</p> -->
<!--                             </a> -->
<!--                         </td> -->
<!--                         <td class="td"> -->
<%--                             <a href='<c:url value=""></c:url>'> --%>
<%--                                 <img src='<c:url value="/component/images/BookCase/elaiza1.jpg"></c:url>' alt="elaiza1" class="book"> --%>
<!--                                 <p class="book-title">Jimmy,愛的AV女優</p> -->
<!--                             </a> -->
<!--                         </td> -->
<!--                         <td class="td"> -->
<%--                             <a href='<c:url value=""></c:url>'> --%>
<%--                                 <img src='<c:url value="/component/images/BookCase/erinamano.jpg"></c:url>' alt="erinamano" class="book"> --%>
<!--                                 <p class="book-title">Jimmy,愛的AV女優2</p> -->
<!--                             </a> -->
<!--                         </td> -->
<!--                         <td class="td"> -->
<%--                             <a href='<c:url value=""></c:url>'> --%>
<%--                                 <img src='<c:url value="/component/images/BookCase/nana.jpg"></c:url>' alt="nana" class="book"> --%>
<!--                                 <p class="book-title">Jimmy,愛的AV女優3</p> -->
<!--                             </a> -->
<!--                         </td> -->
<!--                     </tr> -->

						<tbody>
							<c:forEach var="bk" items="${book}">
								<c:url value="/pickbook.controller" var="link" scope="page">
									<c:param name="bkid" value="${bk[0]}"></c:param>
								</c:url>
								<tr>
								<td class="td">
								<a href="${link}">
								<img class="book" src='<c:url value="${bk[2]}"></c:url>'>
								<p class="book-title">${bk[1]}</p>
								</a>
								</td>
								</tr>
							</c:forEach>
						</tbody>
                </table>
            </div>
            <!-- container end -->
        </div>

    <%@ include file="../partial/memberCenter.jsp"%>

    <%@ include file="../partial/footer.jsp"%>

</div>

</body>
</html>
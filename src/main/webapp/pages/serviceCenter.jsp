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

<style type="text/css">
 .contactus{
        margin: auto;
        margin-top: 10%;
        margin-left: 20%;
        margin-bottom: 20%;
        width: 80%;
        height: 80vh;;
        background-color: #FFF9EF;
        font-family: 微軟正黑體;
    }
    .h3{

    }
    .h5{
    }
    .p{
        width: 80%;
    }
    .text{
        width: 100%;
        height: 100%;
    }
    .select{
        width: 15%;
        font-size: 1.5em;
    }
    .textarea{
        width: 80%;
        height: 80%;
        font-size: 1.5em;
    }
    .button{
        margin-top: 1.5em;
        font-size: 1.5em;
    }
</style>
</head>
<body>
     <div class="wrapper">
        <!-- wrapper start -->
         <%@ include file="../partial/header.jsp"%>  
         
                <div class="container">
                    <!-- container start -->
        

    <div class="contactus">
        <h3 class="h3">聯絡我們</h3>
        <h5 class="h5">填寫問題表單</h5>
        <p class="p">正確選擇問題種類，可加速問題判斷與處理時效，若您所需服務內容為退換貨，更改配送地址…等，與訂單相關之服務需求，
            建議您可以利用線上客服直接由專人為您服務。</p>
    <div class="text">
        <select name="problemChoose" id="" class="select">
            <option value="">商品詢問</option>
            <option value="">訂單詢問</option>
            <option value="">活動詢問</option>
            <option value="">募資詢問</option>
            <option value="">廣告詢問</option>
            <option value="">網站意見提供</option>
            <option value="">其他意見提供</option>
        </select>
        <br>
        <br>
        <textarea name="customerinsert" id="" class="textarea">
        </textarea>
        <br>
        <button class="button">送出</button>



    </div>


    </div>

            <!-- container end -->
        </div>    
 
      <%@ include file="../partial/footer.jsp"%>
      
              <!-- wrapper end -->
      
       </div>               
</body>
</html>
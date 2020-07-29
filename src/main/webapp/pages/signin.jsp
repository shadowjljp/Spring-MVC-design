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
	<script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
	<script src="<c:url value="/component/js/bootstrap.min.js"/>"></script>
  <style>
        .total-div {
            margin: auto;
            width: 450px;
            height: 410px;
            border: 1.5px solid rgb(83, 79, 77);
            border-radius: 3px;
        }

        .inside-div {
            margin-top: -5em;
            width: 405px;
            margin: auto;
        }

        .sigin-icon {
            margin-left: 32%;
            width: 150px;
            height: 150px;
            font-weight: bold;
            text-align: center;
        }

        .input-text-div {
            font-size: 20px;
        }

        .input-text {
            margin-top: 0.7em;
            width: 350px;
            height: 44px;
        }
        .label-div{
            margin-top: 0.7em;
        }
        .submit-button-div{
            margin-left: 12%;
        }
        .submit-button{
            background-color: rgb(196, 121, 60);
            border-radius: 6px;
            margin-top: 0.7em;
            width: 300px;
            height: 30px;
        }
        .submit-button:hover{
            background-color: rgb(179, 103, 41);
        }
    </style>
    
    <script type="text/javascript">

	$(document).ready(function(){
		
		$("#ac").on('blur',function(){
			var visitor =$('#ac').val();
// 			console.log(visitor);
			$.post('../checkVisitor.controller',{"admin":visitor},function(realadmin){
				if(realadmin!=true){
					$('#userbox').removeAttr('target');
				}
			});
		});
		
})
	
    
    </script>
    
</head>
<body>

 <div class="wrapper">
        <!-- wrapper start -->
                	<%@ include file="../partial/header.jsp"%>
                	
                	<%-- 	<c:if>${ user}!=null){} --%>
                	
           <div class="container">
            <!-- container start -->
  <div class="total-div">
        <div class="inside-div">   
                <img class="sigin-icon" src='<c:url value="/component/images/ReadShareLOGO.jpg"></c:url>' />
            <form id="userbox" action='<c:url value="/signin.controller"></c:url>' method="post" target="_blank">
                <div class="input-text-div">
                    	帳號:
                    	
                    <input id="ac" name="memac" type="text" class="input-text" placeholder="請輸入帳號">
                    <br> 密碼:
                    <input id="pw" name="mempw" type="password" class="input-text" placeholder="請輸入密碼">
                </div>
                <div class="label-div">
                    <label>
                        <input type="checkbox">記住帳號密碼
                    </label>
                </div>
                <div class="submit-button-div">
                <sub></sub>
                    <button class="submit-button" type="submit">登入</button>
                    <br>
                    <button class="submit-button" type="reset">清除</button>
<!--                     <button type="button" value="GetSessionData" onclick="GetSessionData()">test</button> -->
                </div>
            </form>
            <!-- /form -->
        </div>
    </div>
    <!-- /card-container -->
    <!-- container end -->
    </div>
     <%@ include file="../partial/footer.jsp"%>
</div>  
</body>
</html>
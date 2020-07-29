<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value="/component/css/bootstrap.min.css"/>"/>
<link rel="stylesheet" href="<c:url value="/component/css/jumbotron.css"/>"/>
<title>爬蟲的條件設定</title>

<style>
label{
font-size:2em;
}
h4{
	width: 250px;
	background-color: #EBA3A3;
	margin-bottom: 0px;
	border-radius: 5px;
	display: inline;
	padding: 5px 15px 3px 15px;

}
table{
margin-top:10px;
}
label{
    display: inline-block;
    float: left;
    clear: left;
    width: 250px;
    text-align: right;
    margin-right:20px;
     line-height: 90px;
}
input {
margin-top: 35px;
  display: inline-block;
  float: left;
  font-size:2em;
}
.output{
margin-left:300px;
}
.card-body{
 box-align: center;    
}
tr,td{
margin:50px;
height:50px;
text-align:center;

}
</style>
</head>
<body>
    <!--在本頁放搜尋條件-->
    <form action="">
    <div class="card-body">
      
        <h4>爬蟲的條件設定</h4>
        <table id="table1"
            class="table table-bordered table-striped table-hover">
        <tr><td><label>Product id:</label><input type="text" name="" /></td></tr>
        <tr><td><label>Product name:</label><input type="text" name="" /></td></tr>
        <tr><td><label>ISBN:</label><input type="text" name="" /></td></tr>
        <tr><td><label>Class Name:</label><input type="text" name="" /></td></tr>
        </table>
       
    </div>
    <div class="output"><input class="sendToAnalyze" type="button"   value="開始分析" /></div>
</form>
 	<script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
	<script src="<c:url value="/component/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/component/js/jquery-ui-effect.min.js"/>"></script>
</body>
</html>
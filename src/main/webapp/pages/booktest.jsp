<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>測試頁</title>
</head>
<body>


<h1>書籍名稱：${book.id }</h1>
<h1>書籍名稱：${book.bknamezh }</h1>
<h1>書籍介紹：${book.bkintro }</h1>
<img src="${book.bkimg}" style="max-height: 100px"/>
<form action='<c:url value="/buy.controller" />' method="get">
書籍ID：<input type="text" name="id" id="id" placeholder="請輸入書籍ID" value="${book.id}"><br>
紙本書：<input type="text" name="status" id="status" placeholder="請輸入A/B" value="a"><br>
價格：<input type="text" name="prodprice" id="prodprice" placeholder="請輸入書籍價格" value="${book.prodprice}"><br>
<input type="submit" name="submit" />
</form>
<form action='<c:url value="/buy.controller" />' method="get">
書籍ID：<input type="text" name="id" id="id" placeholder="請輸入書籍ID" value="${book.id}"><br>
電子書：<input type="text" name="status" id="status" placeholder="請輸入A/B" value="b"><br>
價格：<input type="text" name="prodprice" id="prodprice" placeholder="請輸入書籍價格" value="${book.epubprice}"><br>
<input type="submit" name="submit" />
</form>


</body>
</html>
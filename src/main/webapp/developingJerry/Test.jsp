<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
 <script type="text/javascript" src="<c:url value="/component/js/FileSaver.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/component/js/xlsx.core.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/component/js/jspdf.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/component/js/jspdf.plugin.autotable.js"/>"></script>
<script type="text/javascript" src="<c:url value="/component/js/es6-promise.auto.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/component/js/html2canvas.min.js"/>"></script>
 <script type="text/javascript" src="<c:url value="/component/js/tableexport.js"/>"></script> 
 	<script src="<c:url value="/component/js/bootstrap.min.js"/>"></script>
<title>Insert title here</title>
</head>
<body>
<table id="tables">
    <thead>
    <tr>
        <th>姓名</th>
        <th>性別</th>
        <th>年齡</th>
        <th>地址</th>
    </thead>
    <tbody>
    <tr>
        <td>張三</td>
        <td>男</td>
        <td>34</td>
        <td>湖北省武漢市</td>
    </tr>
    <tr>
        <td>張三</td>
        <td>男</td>
        <td>34</td>
        <td>湖北省武漢市</td>
    </tr>
    </tbody>
</table>

<input type="button" id="export" value="導出"/>
<script>
    $(document).ready(function(){
        $("#export").click(function(){
            //導出
            $("#tables").tableExport({type:"excel",escape:"false"});
        });
    });
</script>
</body>
</html>
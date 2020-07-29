<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享讀</title>
<style type="text/css">
    .body{
        background-color: #FFF9EF;
        font-size: 1.5em;
    }
    .backMember{
        background-color: #FFF9EF;
        font-family: 微軟正黑體;
        margin: auto;
        width: 80%;
        height: 80vh;
    }
    .typePlace{

    }
    .inputac{

    }
    .inputid{
        font-size: 1em;
    }
    .result{

    }
    .membertable{
        border: 3px solid black;
        border-collapse: collapse;
    }
    .searchbutton{
        font-size: 1em;
    }
    .tr{
        border: 1px solid gray;
    }
    .th{
        border: 1px solid gray;
    }
    .td{
        border: 1px solid gray;
    }
    .button{
        font-size: 1em;
    }
</style>
</head>
<body class="body">
   <div class="backMember">
        <div class="typePlace">
            會員搜尋:<input type="text" class="inputid" value="會員ID或帳號">
            <button class="searchbutton">搜尋</button>
        </div>
        <div class="result">
            <table class="membertable">
                <tr class="tr">
                    <th class="th">會員ID</th>
                    <th class="th">會員帳號</th>
                    <th class="th">狀態</th>
                </tr>
                <tr class="tr">
                    <td class="td">1</td>
                    <td class="td">jimmy</td>
                    <td class="td">
                    <button class="button">加入黑名單/取消黑名單</button>
                    </td>
                </tr>
            </table>
        </div>
        
    </div>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>募資編輯頁</title>
<link rel="stylesheet"
	href="<c:url value="/component/css/jquery-1.12.1-ui.css "/>">
<link rel="stylesheet"
	href="<c:url value="/component/css/bootstrap.min.css "/>">
<script src="<c:url value="/component/js/jquery-3.3.1.min.js "/>"></script>
<script src="<c:url value="/component/js/bootstrap.min.js "/>"></script>
</head>

<body style="background-color: rgb(255, 249, 239); font-family: 微軟正黑體">
	<div class="panel panel-default">
		<div class="panel-body" style="margin-left: 25px; margin-top: 50px">
			<div>
				<div style="width: 400px; float: left">
					<h5>編號：${t.id}</h5>
					<h3>《${t.projname}》</h3>
					<h5>提案人：${t.memname}</h5>
				</div>
				<table class="table table-striped"
					style="width: 450px; margin-left: auto; margin-right: auto; border: 3px #cccccc solid;">
					<tr>
						<th>專案建立時間</th>
						<th>專案開始時間</th>
						<th>專案結束時間</th>
					</tr>
					<tr>
						<td>${t.projt}</td>
						<td>${t.startt}</td>
						<td>${t.endt}</td>
					</tr>
				</table>
			</div>
			<h4>專案介紹</h4>
			<div>
				<div style="width: 600px; margin: auto; float: left">
					<p>${t.content}</p>
				</div>
				<div>
					<div style="width: 300px; float: left; margin-left: 20px">
						<table class="table table-striped"
							style="width: 300px; border: 3px #cccccc solid;">
							<tr>
								<th>方案</th>
								<th>募款金額</th>
								<th>限制人數</th>
							</tr>
							<tr>
								<td>${t.plan1}</td>
								<td>${t.plan1price}</td>
								<td>${t.plan1num}</td>
							</tr>
							<tr>
								<td>${t.plan2}</td>
								<td>${t.plan2price}</td>
								<td>${t.plan2num}</td>
							</tr>
							<tr>
								<td>${t.plan3}</td>
								<td>${t.plan3price}</td>
								<td>${t.plan3num}</td>
							</tr>
						</table>
						<div style="margin-left: auto; margin-right: auto; width: 190px">
							<form action='<c:url value='/changeprojstatus.controller'/>'
								method='post'>
								<input type='hidden' name='id' value="${t.id}">
								<button type='submit' style="font-size: 150%; color: green">審核通過</button>
								<button type="button" style="font-size: 150%; color: red"
									onclick="history.back()">取消</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<script>
		// 			$(document).ready(function() {
		// 				$.get("../selectproj.controller", { "id": 1}, function (productBeans) {
		// 			});//ready
	</script>
	</div>
</body>

</html>
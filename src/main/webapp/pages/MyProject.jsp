<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>募資-我的專案</title>
<!--套用jquery-->
<script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
<!--套用css-->
<link rel="stylesheet" href="<c:url value="/component/css/base.css"/>">
<link rel="stylesheet" href="<c:url value="/component/css/layout.css"/>">
<link rel="stylesheet" href="<c:url value="/component/css/headerAndFooter.css"/>">
<link rel="stylesheet" href="<c:url value="/component/css/style.css"/>">
<link rel="stylesheet" href="<c:url value="/component/css/search.css"/>">	

<style>
        .Button-div {
            height: 5em;
            width: 10em;
            margin: auto;
        }

        .BackButton {
            width: 5em;
            height: 3em;
            width: 8em;
            border: 0.5px solid #8B6257;
            border-radius: 15px;
            text-align: center;
        }

        .BackButton:hover {
            border: 1.5px solid #8B6257;
        }
    </style>
</head>
<body>
	<div class="wrapper">
		<%--include header.jsp --%>
		<%@include file="../partial/headerForProject.jsp"%>
		<%--網頁內容 --%>
		<div class="container">
			<div style="margin-top: 10%;margin-bottom: 10%;">
                <table id="example" class="display" style="width:100%">
                    <thead>
                        <tr>
                            <th>專案狀態</th>
                            <th>專案名稱</th>
                            <th>開始時間</th>
                            <th>結束時間</th>
                            <th>專案統計</th>
                            <th>功能</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>待審中</td>
                            <td>
                                <a href="project.html">Alternative pagination</a>
                            </td>
                            <td>2013-03-06</td>
                            <td>2014-06-06</td>
                            <td><a href="sponsor.html">贊助資訊</a></td>
                            <td><a href="CreateProject.html"><input type="button" value="編輯"></a></td>
                        </tr>

                        <tr>
                            <td>
                                <input type="submit" value="我要報名">
                            </td>
                            <td>
                                <a href="http://paco.tw/proj/">【2015】107-1 國際文化村 Intercultural Village (10月份)</a>
                            </td>
                            <td>2015-11-06</td>
                            <td>2016-12-06</td>

                        </tr>
                        <tr>
                            <td>已核准</td>
                            <td>
                                <a href="http://paco.tw/proj/">【2016】107-1 國際文化村 Intercultural Village (10月份)</a>
                            </td>
                            <td>2016-11-06</td>
                            <td>2017-12-06</td>
                        </tr>
                        <tr>
                            <td>募資中</td>
                            <td>
                                <a href="https://datatables.net/examples/basic_init/alt_pagination.html">Alternative pagination</a>
                            </td>
                            <td>2013-03-06</td>
                            <td>2014-06-06</td>

                        </tr>
                        <tr>
                            <td>
                                <input type="submit" value="我要報名">
                            </td>
                            <td>
                                <a href="http://paco.tw/proj/">【2015】107-1 國際文化村 Intercultural Village (10月份)</a>
                            </td>
                            <td>2015-11-06</td>
                            <td>2016-12-06</td>

                        </tr>
                        <tr>
                            <td>募資結束</td>
                            <td>
                                <a href="http://paco.tw/proj/">【2016】107-1 國際文化村 Intercultural Village (10月份)</a>
                            </td>
                            <td>2016-11-06</td>
                            <td>2017-12-06</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- container -->
            <div class="Button-div">
                <input class="BackButton" type="button" value="回到募資首頁" onclick="location.href='ProjectHome.html'">
            </div>
		</div>
		<%--include memberCenter.jsp --%>
		<%@ include file="../partial/memberCenter.jsp" %>
		<%--include Footer.jsp --%>
		<%@ include file="../partial/footer.jsp"%>
	</div>
	<!--Ajax瀑布流-->
	<script>
                    $(function () {
                        // 先取得 #terms 及其各種高度
                        // 判斷是否停用 $submit
                        var $terms = $('.wrapper'),
                            _height = $terms.height(),
                            _scrollHeight = $terms.prop('scrollHeight'),
                            _maxScrollHeight = _scrollHeight - _height - 20;
                        _least = 0.5  , // 距離底部多少就可以, 0 表示得完全到底部
                            $submit = $('#submit').attr('disabled', _maxScrollHeight > _least);

                        // 當 #terms 中捲軸捲動時
                        $('.wrapper').scroll(function () {
                            var $this = $(this);
                            // 如果高度已經達到指定的高度就啟用 $submit
                            if (_maxScrollHeight - $this.scrollTop() <= _least) {
                               //.................Jerry測試程式
              			 	$(document).ready(function() {
			 					 $.getJSON('/FinalProject/JerryForJQuery', {  }, function (data) {
	              			  		$('#table1>tbody').empty();
					 			 		$('#table1').DataTable( $.each(data.data, function (i, spider) {
	                 				   //console.log(product.ProductName);
	                 				  var cell1 = $("<span></span>").text(spider.id);
	                 			 	  var cell2 = $("<span></span>").text(spider.prodid);
	                  				  var cell3 = $("<span></span>").text(spider.price);
	                  
	                   	 var row = $('<div></div>').append([cell1, cell2, cell3]);
	                   	 $('.container').append(row);
	                	}));
	              
	          		  })
					})
                   }
                 });
                });
                </script>
</body>
</html>
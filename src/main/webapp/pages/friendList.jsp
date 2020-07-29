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
	
	<style type="text/css">
		.list {
            margin: auto;
            margin-top: 10%;
            width: 900px;
            height: 800px;
            background-color: #FFF9EF;
            /* border: 2px solid yellow;*/
        }

        .h5 {
            font-family: 微軟正黑體;
        }

        .img {
            width: 200px;
            height: 200px;
            border-radius: 100px 100px 100px 100px;
        }

        .left {
            margin-left: 3em;
            float: left;
            width: 400px;
            /* border: 2px solid black; */
        }

        .right {
            float: left;
            width: 400px;
            /* border: 2px solid red; */
        }

        .button {
            font-family: 微軟正黑體;
        }
	
	</style>    
    <script type="text/javascript">
    $(document).ready(function () {
        $(window).scroll(function () {
            // if ($(document).scrollTop() <= 0) {
            //     alert("滚动条已经到达顶部为0");
            // }
            if ($(document).scrollTop() >= $(document).height() - $(window).height()) {
                // alert("滚动条已经到达底部为" + $(document).scrollTop());
                alert("到底了");
//             test
        
         	$.post('../friends.controller',{"memid":"1","friendid":"3","jointime":"2018-02-20"},function(){
			});
            
//             test
                
            }
        });
    });
    </script>
</head>
<body>
    <div class="wrapper">
        <!-- wrapper start -->
        	<%@ include file="../partial/header.jsp"%>
        	        <div class="container">
            <!-- container start -->
            <div class="list">


                <div class="left">
                    <table>
                        <tr>
                            <th>
                                <h5 class="h5">劉安育（Jerry）</h5>
                                <img src='<c:url value="/component/images/ProfilePicture/nana.jpg"></c:url>' alt="nana" class="img">
                            </th>
                            <th>
                                <button class="button" onclick="shareBook">分享好書</button>
                                <br>
                                <br>
                                <button class="button" onclick="deleteFriend">刪除好友</button>
                            </th>
                        </tr>

                        <tr>
                            <th>
                                <h5 class="h5">吳浩澐 (Howard)</h5>
                                <img src='<c:url value="/component/images/ProfilePicture/maria.jpg"></c:url>' alt="maria" class="img">
                            </th>
                            <th>
                                <button class="button" onclick="shareBook">分享好書</button>
                                <br>
                                <br>
                                <button class="button" onclick="deleteFriend">刪除好友</button>
                            </th>
                        </tr>

                        <tr>
                            <th>
                                <h5 class="h5">林晉宇（Jimmy）</h5>
                                <img src='<c:url value="/component/images/ProfilePicture/erinamano2.jpg"></c:url>' alt="erinamano" class="img">
                            </th>
                            <th>
                                <button class="button" onclick="shareBook">分享好書</button>
                                <br>
                                <br>
                                <button class="button" onclick="deleteFriend">刪除好友</button>
                            </th>
                        </tr>
                    </table>
                </div>

                <div class="right">
                    <table>
                        <tr>
                            <th>
                                <h5 class="h5">鄭宇軒（Danny）</h5>
                                <img src='<c:url value="/component/images/ProfilePicture/sazanami.jpg"></c:url>' alt="sazanami" class="img">
                            </th>
                            <th>
                                <button class="button" onclick="shareBook">分享好書</button>
                                <br>
                                <br>
                                <button class="button" onclick="deleteFriend">刪除好友</button>
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <h5 class="h5">林偃秋（Ronnie）</h5>
                                <img src='<c:url value="/component/images/ProfilePicture/elaiza1.jpg"></c:url>' alt="elaiza1" class="img">
                            </th>
                            <th>
                                <button class="button" onclick="shareBook">分享好書</button>
                                <br>
                                <br>
                                <button class="button" onclick="deleteFriend">刪除好友</button>
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <h5 class="h5">歐松運（Paco）</h5>
                                <img src='<c:url value="../component/images/ProfilePicture/elaiza2.jpg"></c:url>' alt="elaiza2" class="img">
                            </th>
                            <th>
                                <button class="button" onclick="shareBook">分享好書</button>
                                <br>
                                <br>
                                <button class="button" onclick="deleteFriend">刪除好友</button>
                            </th>
                        </tr>
                    </table>
                </div>

            </div>
            <!-- container end -->
        </div>
        
        <%@ include file="../partial/footer.jsp"%>
        
</div>
        
    	<script>
//                     $(function () {
//                         // 先取得 #terms 及其各種高度
//                         // 判斷是否停用 $submit
//                         var $terms = $('.wrapper'),
//                             _height = $terms.height(),
//                             _scrollHeight = $terms.prop('scrollHeight'),
//                             _maxScrollHeight = _scrollHeight - _height - 20;
//                         _least = 0.5  , // 距離底部多少就可以, 0 表示得完全到底部
//                             $submit = $('#submit').attr('disabled', _maxScrollHeight > _least);
// //                      test
//                         $(document).read(function(){
//                         	$.post('../friends.controller',{"memid":"1","friendid":"1","jointime":"2018-02-20"})
//                         });
// //                         test
//                         // 當 #terms 中捲軸捲動時
//                         $('.wrapper').scroll(function () {
//                             var $this = $(this);

//                             // 如果高度已經達到指定的高度就啟用 $submit
//                             if (_maxScrollHeight - $this.scrollTop() <= _least) {
//                             	alert("hello");
//                                //.................Jerry測試程式
//               			 	$(document).ready(function() {
// 			 					 $.getJSON('/FinalProject/JerryForJQuery', {  }, function (data) {
// 	              			  		$('#table1>tbody').empty();
// 					 			 		$('#table1').DataTable( $.each(data.data, function (i, spider) {
// 	                 				   //console.log(product.ProductName);
// 	                 				  var cell1 = $("<span></span>").text(spider.id);
// 	                 			 	  var cell2 = $("<span></span>").text(spider.prodid);
// 	                  				  var cell3 = $("<span></span>").text(spider.price);
	                  
// 	                   	 var row = $('<div></div>').append([cell1, cell2, cell3]);
// 	                   	 $('.container').append(row);
// 	                	}));
	              
// 	          		  })
// 					})
//                    }
//                  });
//                 });      
</script>

</body>
</html>
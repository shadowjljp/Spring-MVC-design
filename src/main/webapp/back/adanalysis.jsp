<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../component/css/base.css">
<style>


.divBall {
	width: 10px;
	height: 10px;
	background-color: blue;
	border-radius: 50%;
	position: absolute;
	opacity: 0.1;
	/* top : 10px;
            left:20px; */
}

.iddiv{
 	width: 100vw; 
 	height: 5vh;  
 	border-bottom:solid 1px black;
}


iframe {
	width: 100vw;
 	height: 95vh; 
}
</style>


<script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>

<script>
        $(document).ready(function () {///////////////////////////////////////////////////////
            var beginDate, endDate;
            var xyAr = new Array();

            $('#bt1').on('click', function () {
                beginDate = $('#beginDate').val();
                endDate = $('#endDate').val();
                // console.log(beginDate + " " + endDate);
                if (beginDate == "" || endDate == "") {
                    $('#idSp').text("　請選擇日期區間!");
                } else {
                    $('#idSp').text("");
                    $.post('../clicks.controller', { "beginTime": beginDate, "endTime": endDate }, function (dataBeans) {
                        dataBeans.forEach(bean => {
                            xyAr.push(bean.adclickx + " " + bean.adclicky);
//               				console.log("x=" + bean.adclickx + "y=" + bean.adclicky);
                        });
                        $('#idSp').text("查詢完成!");
                    }, "json");
                }
            });


            $localContents = $(document);
            $('#f1').on('load', function () {////////////////////////////////////iframe 內
                var $iframe = $(this), $contents = $iframe.contents();
                $contents.find('a').removeAttr('href');
                $contents.find('form').removeAttr('action');
//                 $contents.find('.wrapper').append("<div id='idDivInIframe'></div>");
                $contentWrapper = $contents.find('.wrapper');
                
                $contents.find('head').append("<style> .divBall { width: 10px; height: 10px; background-color: blue; border-radius: 50%; position: absolute; opacity: 0.1; z-index: 99;} </style>");
                $contents.find('head').append("<style> .divBallHeader { width: 10px; height: 10px; background-color: red; border-radius: 50%; position: fixed; opacity: 0.1; z-index: 101;} </style>");
                
                $('#bt2').on('click', function () { 
                	//var $divInIframe = $contents.find('#idDivInIframe');
                    for (var i = 1; i <= xyAr.length; i++) {
                        let x = 0;
                        let y = 0;
                        tempAr = (xyAr[i - 1] + "").split(" ", 2);
                        x = Math.floor(tempAr[0]-5);
                        y = Math.floor(tempAr[1]-5);
                        
                        if (y<84){
                        	$contentWrapper.append("<div class='divBallHeader' style=top:"+ y +"px;left:"+ x +"px;></div>");
                        }else{
                        	$contentWrapper.append("<div class='divBall' style=top:"+ y +"px;left:"+ x +"px;></div>");
                        }
                       	
//                         $contents.find('.wrapper').append("<div class='divBall' style=top:"+ y +"px;left:"+ x +"px;></div>");
                        
//                         var tempDiv = document.createElement("div");
//                         tempDiv.style.top = y + "px";
//                         tempDiv.style.left = x + "px";
//                         tempDiv.setAttribute("class", "divBall");
//                         document.getElementById("iddiv").appendChild(tempDiv);
                        
//                         console.log("<div class='divBall' style='top:"+ y +"px;left:"+ x +"px;'></div>");
                    }
                });

            });//////////////////////////////////iframe內
        });////////////////////////////////////doc ready

    </script>

</head>
<body>
	<div id="iddiv" class="iddiv">
		<span>開始日期</span>
		<input type="date" name="beginDate" id="beginDate">
		<span>結束日期</span>
		<input type="date" name="endDate" id="endDate">
	
		<button id="bt1">開始</button>
		<button id="bt2">繪圖</button>
	
		<span id="idSp"></span>
		
	</div>
	
		<iframe id="f1" src="<c:url value="/index.jsp" />" frameborder="0"></iframe>
	
</body>
</html>
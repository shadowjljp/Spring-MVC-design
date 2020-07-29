<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 整個即時通元件都包覆在這裡 -->
    <div id="idMsgCompWrapper" class="msgCompWrapper">

        <!-- class="divMsgTitleBar2" -->
        <div id="idDivMsgTitleBar" class="divMsgCicle">
            <span>享</span>
        </div>

        <div id="idDivMsgBoxContent" class="divMsgBoxContent">
        
<!--         這邊以下都是訊息 -->
        
<!--             <div class="divMsgBoxContentSender"> -->
<!--                 <p>123</p> -->
<!--             </div> -->

<!--             <div class="divMsgBoxContentReceiver"> -->
<!--                 <p>我是一堆文字我是一堆文字我是一堆文字我是一堆文字</p> -->
<!--             </div> -->

        </div>


        <div id="idDivMsgInputRange" class="divMsgInputRange">

            <div id="idDivMsgInputBox" class="divMsgInputBox" contenteditable="true"></div>

        </div>

    </div>
    <script>
    
    	var memberId = ${user.id};
    	var memberName = '${user.memac}';


        $(function () {
        	////////////////////////////////////////////
        	
        	var today =  new Date(); 
//         	var lastMsgTime =  today.getFullYear() +"-"+  (today.getMonth()+1)  +"-" + today.getDate() ;
        	var lastMsgTime =  "Sep 20, 2018 00:00:00 AM";
        	//MMM dd, yyyy hh:mm:ss aa
        	console.log("初始化時間參數=" + lastMsgTime);
        	
        	$.get('messageGet.controller',{"adminid":"1","mbid":memberId},function(messageBeans){
        		messageBeans.forEach(function(bean){
        			
        			if( bean.sender == memberName ){//這邊要寫會員名
        				$('#idDivMsgBoxContent').append("<div class='divMsgBoxContentSender'><p>"+ bean.msg  +"</p></div>");
        			}else{
        				$('#idDivMsgBoxContent').append("<div class='divMsgBoxContentReceiver'><p>"+ bean.msg  +"</p></div>");
        			}
        			lastMsgTime = bean.sendtime;
        			console.log('lastMsgTime begin'+lastMsgTime);
//         			console.log(messageBeans);
        			console.log(bean.sendtime);
        		});
        	},"json");
///////////////////////////////////////監聽器
            
            var t = setInterval(fetchMsg,500);
            
            function fetchMsg(){
            	$.get('messageGetNew.controller',{"adminid":"1","mbid":memberId,"lastMsgTime":lastMsgTime,"receiver":"admin"},function(messageBeans){
            		messageBeans.forEach(function(bean){
            			
            			$('#idDivMsgBoxContent').append("<div class='divMsgBoxContentReceiver'><p>"+ bean.msg  +"</p></div>");
            			lastMsgTime = bean.sendtime;
            			
            			var div = document.getElementById('idDivMsgBoxContent'); 
                        div.scrollTop = div.scrollHeight; 
                        
                        
            		});
            	},"json");
            }
            

        	
        	///////////////////////////////////////////////////////////////////
            $('#idDivMsgInputBox').keydown(
                function (e) {
                    // alert(e.which);
                    if (e.which == 13) {
                        // alert('enter事件 後續觸發文字送出') 
//                         alert($(this).text());
                        var msg = $(this).text();

                        var fg = $(document.createDocumentFragment());

                        fg.append("<div class='divMsgBoxContentSender'><p>"+ msg  +"</p></div>");

                        $.post('message.controller',{"adminid":"1","mbid":memberId,"msg":msg,"sender":memberName},
                            function(){
                                $('#idDivMsgBoxContent').append(fg);
                                    var div = document.getElementById('idDivMsgBoxContent'); 
                                    div.scrollTop = div.scrollHeight; 
                                }
                        );
                        $(this).text("");
                    }
                }
            );
    
            $(document).on('mousemove',followLight);
    
            $('#idDivMsgTitleBar').mouseover(function () {
                $(document).off('mousemove');
                var currObj1 = $(this);
                if (currObj1.hasClass('divMsgCicle')) {
                    currObj1.text('享讀-即時客服')
                            .css({ "cursor": "pointer" ,"box-shadow": "" })
                            .switchClass('divMsgCicle', 'divMsgTitleBar2', 300)
                }
    
            });
            // .mouseout(function () {$(this).switchClass('divMsgTitleBar2','divMsgCicle',400)});
    
    
            $('#idDivMsgTitleBar').click(
                function () {
                	
                    var currObj2 = $(this);
                    // alert(123);
                    $('#idDivMsgBoxContent').toggle();
                    $('#idDivMsgInputRange').toggle();
                    
                    var div = document.getElementById('idDivMsgBoxContent'); 
                    div.scrollTop = div.scrollHeight; 
    
                    if (currObj2.hasClass('divMsgTitleBar')) {
                        // title bar下沉
                        currObj2.switchClass('divMsgTitleBar', 'divMsgTitleBar2', 400);
    
                        currObj2.html('<span>享</span>');
                        // 縮回球形
                        currObj2.switchClass('divMsgTitleBar2', 'divMsgCicle', 400)
    
                        //綁定陰影事件
                        $(document).on('mousemove',followLight);
    
                    } else {
                        // 長高
                        currObj2.switchClass('divMsgTitleBar2', 'divMsgTitleBar', 0);
                    }
                }
            );
    
            // handle屬性用來解決 div contenteditable="true" 被覆蓋的問題
            $('#idMsgCompWrapper').draggable({ handle: '#idDivMsgBoxContent' });
        });
    
        //物件陰影隨座標移動function
        function followLight(e) {
    
                var targetElement = $('.divMsgCicle');
    
                //fixed了 不需要管scroll座標
                // var sx = e.pageX + document.documentElement.scrollTop;
                // var sy = e.pageY + document.documentElement.scrollLeft;
                var sx = e.pageX;
                var sy = e.pageY;
                // console.log("-----------------------------------------");
                // console.log("sx,sy = " + sx + "," + sy);
                var targY = targetElement.offset().top + 25;
                var targX = targetElement.offset().left + 25;
                // console.log("targX,targY = " + targX + "," + targY);
    
                var dX = sx - targX;
                var dY = sy - targY;
                // console.log("dX,dY = " + dX + "," + dY);
    
                var tempAng = Math.atan2(dY, dX) * 180 / Math.PI;
                // console.log("tempAng = " + tempAng);
    
                var resultX = - 7 * Math.cos(tempAng * Math.PI / 180);
                var resultY = - 7 * Math.sin(tempAng * Math.PI / 180);
    
                var tempAttr = resultX + "px " + resultY + "px " + "7px " +  "1px rgba(20%, 20%, 40%, 0.5)";
    
                targetElement.css({ "box-shadow": tempAttr });
            }
    </script>
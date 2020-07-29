<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


	<link rel="stylesheet" href="<c:url value="/component/css/base.css"/>">
    <link rel="stylesheet" href="<c:url value="/component/css/layout.css"/>">

    <script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>

    <link rel="stylesheet" type="text/css" href="<c:url value="/component/css/jquery.dataTables.min.css"/>">
    <script type="text/javascript" charset="utf8" src="<c:url value="/component/js/jquery.dataTables.min.js"/>"></script>

    
    <style>
        .divMessageCollectionWrapper {
            /* background-color: red; */
            /* opacity: 0.3; */
            width: 100vw;
            height: 100vh;
            border-top: solid black 1px;
            border-bottom: solid black 1px;
            border-right: 1px solid black;
        }

        .divMessageBox {
            position: absolute;
            left: 0px;
            bottom: 0px;

            width: 100%;
            height: 20%;

            /* background-color: rgb(149, 149, 173); */
            border-right: solid black 1px;
        }

        .divOuterMessageEditor {
            /* position: absolute;
            bottom: 0px; */
            /* border-bottom-left-radius: 5px;
            border-bottom-right-radius: 10px; */
            border-top: solid 1px black;

            width: 100%;
            height: 100%;
            /* background-color: red; */
        }

        .divMessageEditor {
            position: absolute;
            top: 10%;
            left: 5%;

            border-radius: 10px;

            width: 80%;
            height: 80%;
            /* background-color: red; */
            border: solid 1px black;
            text-align: center;
            font-size: 2em;
            overflow: auto;

        }

        .divOuterMessageEditor>button {
            width: 10%;
            height: 80px;

            position: absolute;
            top: 13%;
            right: 4%;

            border-radius: 10px;

            font-size: 22px;
        }


        .divMessageOuterContainer {
            height: 100%;
            width: 70%;

            /* background-color: red; */
            border-right: 1px solid black;
        }

        .divMsgContainer {
            height: 80%;
            width: 100%;

            /* background-color: red; */
            overflow: auto;
        }

        .divMsgMemberBox {
            width: 50%;
        }

        .divMsgBoxContentMember {
            margin-top: 5px;
            margin-left: 55px;
            max-width: 100%;
            border-right-color: #8B6257;
            background-color: rgb(231, 193, 193);
            border-radius: 10px;
        }

        .divMsgBoxContentMember>p {
            font-size: 18px;
            color: black;
            padding: 12px;
            line-height: 26px;
        }

        .divMemberBoxImg img {
            position: absolute;

            bottom: 18px;
            left: 5px;

            border-radius: 50%;
            height: 50px;
        }

        .divMsgAdminBox {
            width: 50%;
            margin-left: 42%;
        }

        .divMsgBoxContentAdmin {
            margin-top: 5px;

            border-right-color: #8B6257;
            text-align: left;
            max-width: 100%;

        }

        .divMsgBoxContentAdmin>p {
            color: white;
            background-color: #8B6257;
            border-radius: 10px;
            font-size: 18px;
            padding: 12px;
            line-height: 26px;
        }

        .divAdminBoxImg {
            margin-left: 100%;
        }

        .divAdminBoxImg img {
            position: absolute;

            bottom: 18px;
            left: 5px;

            border-radius: 50%;
            height: 50px;
        }

        .divMemberList {

            position: absolute;
            top: 0px;
            right: 0px;

            width: 30%;
            height: 100%;
            /* background-color: green; */
        }

        .divMemberList td>img {
            /* position: absolute; */
            /* bottom: 18px;
            left: 5px; */
            border-radius: 50%;
            height: 30px;
        }






        /* scroll bar style begin */

        ::-webkit-scrollbar {
            width: 10px;
        }

        /* Track */

        ::-webkit-scrollbar-track {
            box-shadow: inset 0 0 5px grey;
            border-radius: 10px;
        }

        /* Handle */

        ::-webkit-scrollbar-thumb {
            background: rgb(182, 171, 171);
            border-radius: 10px;
        }

        /* Handle on hover */

        ::-webkit-scrollbar-thumb:hover {
            background: #e28686;
        }

        /* scroll bar style end */
    </style>
</head>

<body>

    <div class="wrapper">
        <div class="divMessageCollectionWrapper">



            <div class="divMessageOuterContainer">


                <div id="divMsgContainer" class="divMsgContainer">

<!--                     <div class="divMsgMemberBox"> -->

<!--                         <div class="divMsgBoxContentMember"> -->
<!--                             <p>我是一堆一堆文字我一堆文字我一堆文字我一堆文字我一堆文字我文字我是一文字我是一堆文字</p> -->
<!--                         </div> -->
<!--                         <div class="divMemberBoxImg"> -->
<!--                             <img src="../component/images/MemberPhoto/Howard.jpg" alt=""> -->
<!--                         </div> -->
<!--                     </div> -->

<!--                     <div class="divMsgAdminBox"> -->
<!--                         <div class="divMsgBoxContentAdmin"> -->
<!--                             <p>我是一堆文字我是一堆文字我是一堆文字我是一堆文字</p> -->
<!--                         </div> -->
<!--                         <div class="divAdminBoxImg"> -->
<!--                             <img src="../component/images/MemberPhoto/2018-08-18_213021.png" alt=""> -->
<!--                         </div> -->
<!--                     </div> -->

                </div>


                <div class="divMessageBox">
                    <div class="divOuterMessageEditor">
                        <div class="divMessageEditor" contenteditable="true">

                        </div>
                        <button>傳送</button>
                    </div>
                </div>

            </div>


            <div class="divMemberList">


                <table id="table_id" class="display">
                    <thead>

                        <th>暱稱</th>
                        <th>員編</th>
                        <th>訊息</th>
                        <th>狀態</th>
                        <th>功能</th>
                    </thead>

                    <tbody>
                        <tr>
                            <td>A</td>
                            <td>1</td>
                            <td>10</td>
                            <td>待處理</td>
                            <td><button>交談</button></td>
                        </tr>
                        <tr>
                            <td>howard</td>
                            <td>4</td>
                            <td>1111</td>
                            <td>處理中</td>
                            <td><button>交談</button></td>
                        </tr>
                        <tr>
                            <td>ABC</td>
                            <td>5</td>
                            <td>1111</td>
                            <td>已處理</td>
                            <td><button>交談</button></td>
                        </tr>
                        


                    </tbody>


                </table>
            </div>

        </div>
        <!-- wrapper -->
    </div>


    <script>
    ///全域變數初始化
    var mbid = 4;
	var receiver = "howard";
	var lastMsgTime = "Sep 20, 2018 00:00:00 AM";
	var timer;
    ///外部function定義
    	function bindBt(){
    		$("table td>button").on("click",function(){
    			if (typeof(timer)!=="undefined"){
    				clearInterval(timer);
    				console.log("stop"+timer);
    			}
    			console.log(timer);
    			receiver = $(this).parent().parent('tr').children('td').eq(0).text();
    			mbid = $(this).parent().parent('tr').children('td').eq(1).text();
    			initMsgById(mbid);
    		});
    	}
///////////////////////////////////////監聽器
        function fetchMsg(){
        	$.get('../messageGetNew.controller',{"adminid":"1","mbid":mbid,"lastMsgTime":lastMsgTime,"receiver":receiver},function(messageBeans){
        		messageBeans.forEach(function(bean){
        			$('.divMsgContainer').append("<div class='divMsgMemberBox'><div class='divMsgBoxContentMember'><p>"+ bean.msg +"</p></div><div class='divMemberBoxImg'><img src='../component/images/MemberPhoto/Howard.jpg'></div></div>");
        			lastMsgTime = bean.sendtime;
//         			console.log('lastMsgTime fetchMsg='+lastMsgTime);
        			var div = document.getElementById('divMsgContainer'); 
                    div.scrollTop = div.scrollHeight; 
        		});
        	},"json");
        }
        /////////////////////////指定對話紀錄帶入
        function initMsgById(id){
        	$.get('../messageGet.controller',{"adminid":"1","mbid":id},function(messageBeans){
        			
        		$('.divMsgContainer').html("");
        			
        		messageBeans.forEach(function(bean){
        			if( bean.sender == "admin" ){//這邊要寫管理員名
        				$('.divMsgContainer').append("<div class='divMsgAdminBox'><div class='divMsgBoxContentAdmin'><p>"+ bean.msg +"</p></div><div class='divAdminBoxImg'><img src='../component/images/MemberPhoto/AdminPhoto.png'></div></div>");
        			}else{
        				$('.divMsgContainer').append("<div class='divMsgMemberBox'><div class='divMsgBoxContentMember'><p>"+ bean.msg +"</p></div><div class='divMemberBoxImg'><img src='../component/images/MemberPhoto/Howard.jpg'></div></div>");
        			}
        			
        			lastMsgTime = bean.sendtime;
//         			alert(lastMsgTime);
        			console.log('lastMsgTime begin'+lastMsgTime);
        			var div = document.getElementById('divMsgContainer'); 
                    div.scrollTop = div.scrollHeight; 
        		});
        		//監聽器啟動器
                timer = setInterval(fetchMsg,500);
        	},"json");
        	
        }
    
    //////////////////////這裡開始Load DOM
        $(document).ready(function () { 
        	bindBt();
//////////////////////////////////////////data table
			$('#table_id').DataTable(); 
			//////////////////////////////////memmber and admin setting
			
			
/////////////////////////////////////////// ajax pre load 會員資料
			
        	
        	
        	
        
        
        
  ////////////////////////////////////////////////////////////////////ajax submit
        
        	$('.divOuterMessageEditor button').click(
                function (e) {
                    // alert(e.which);
                    
//                         alert($(this).text());
                        var msg = $('.divMessageEditor').text();
//                         alert(msg);

                        var fg = $(document.createDocumentFragment());

                        fg.append("<div class='divMsgAdminBox'><div class='divMsgBoxContentAdmin'><p>"+ msg +"</p></div><div class='divAdminBoxImg'><img src='../component/images/MemberPhoto/AdminPhoto.png'></div></div>");
                        
                        $.post('../message.controller',{"adminid":"1","mbid":mbid,"msg":msg,"sender":"admin"},
                            function(){
                                $('.divMsgContainer').append(fg);
                                    var div = document.getElementById('divMsgContainer'); 
                                    div.scrollTop = div.scrollHeight; 
                                }
                        );
                        $('.divMessageEditor').text("");
				}
                
            );
            
            
            
////////////////////////////////////////////
        });
    </script>

</body>

</html>
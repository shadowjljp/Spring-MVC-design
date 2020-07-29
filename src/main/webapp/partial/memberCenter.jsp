<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--memberCenter Link-->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" -->
<!-- 	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" -->
<!-- 	crossorigin="anonymous"> -->
<!--memberCenter Css-->
<%-- <link rel="stylesheet" href="<c:url value="/component/css/memberCenter.css"/>"> --%>
<style>
  /*----內縮設定------*/

  body {
    background-color: rgb(255, 249, 239);
}

/*--大標bar設定--*/

.sidebar-menu {
    position: absolute;
    margin-top: 5%;
    position: fixed;
    float: left;
    width: 250px;
    top: 0;
    left: 0;
    bottom: 0;
    color: black;
    font-family: 微軟正黑體;
    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.5);
    z-index: 1;
    /*-------*/
    /* background-color:#000000; */
    
    background: rgb(248, 247, 247,0.7);
    /* opacity: rgba(248,247,247, 0.7); */
    /* background-color: rgb(7, 8, 8); */
    /* background:rgba(0,0,0,0.7);  */
}

/*------bar內樣式------*/

.bar-icon-border {
    border-top: 1px solid rgba(69, 74, 84, 0.7);
}

#memberCenter-menu {
    list-style: none;
    margin: 0;
    padding: 0;
    margin-bottom: 20px;
}

#memberCenter-menu li {
    position: relative;
    margin: 0;
    font-size: 22px;
    border-bottom: 1px solid rgba(16, 17, 19, 0.7);
    padding: 0;
    
}

#memberCenter-menu li ul {
    opacity: 0;
    height: 0px;
}

#memberCenter-menu li a {
    font-style: normal;
    font-weight: bold;
    position: relative;
    display: block;
    padding: 10px 20px;
    color: #8B6257;
    white-space: nowrap;
    z-index: 2;
/*     text-decoration:none; */
}

#memberCenter-menu li a:hover {
    color: #ffffff;
    background-color: #caabab;
    transition: color 250ms ease-in-out, background-color 250ms ease-in-out;
}

#memberCenter-menu li.active>a {
    background-color: rgb(250, 239, 221);
    color: #202020;    
}

#memberCenter-menu ul li {
    background-color: rgb(243, 230, 209);
}

#memberCenter-menu ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

#memberCenter-menu li ul {
    position: absolute;
    visibility: hidden;
    left: 100%;
    top: -1px;
    background-color: rgb(250, 236, 211);
    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.5);
    opacity: 0;
    transition: opacity 0.5s linear;
    border-top: 1px solid rgba(69, 74, 84, 0.7);
}

#memberCenter-menu li:hover>ul {
    visibility: visible;
    opacity: 1;
}

#memberCenter-menu li li ul {
    left: 100%;
    visibility: hidden;
    top: -1px;
    opacity: 0;
    transition: opacity 0.5s linear;
}

#memberCenter-menu li li:hover ul {
    visibility: visible;
    opacity: 1;
}

#memberCenter-menu .fa {
    margin-right: 5px;
}
/* #memberCenter-a{ */
/* 	text-decoration: none; */
/* } */
.memberlogo {
    width: 100%;
    height: 6em;
    padding: 21px;
    box-sizing: border-box;
}

.sidebar-icon {
    width: 20px;
    height: 20px;
    position: relative;
    float: right;
    /* margin-top: 24px;
    text-align: center;
    line-height: 1;
    font-size: 30px; */
  
    margin-top:1.5em;
    margin-left: 10em;
    margin-bottom: -1em;
 
}

.fa-html5 {
    color: rgb(29, 28, 28);
    margin-left: 50px;
}

/*------------------------*/

a:hover {
    transition: all 200ms ease-in-out;
}

.page-container {
    /* min-width: 1260px; */
/*     position: absolute;  */
    /* top: 0;
    left: 0; */
    /* right: 0; */
/*     bottom: 0;  */
/*     width: 100%; */
/*     height: 100%; */
/*     margin: 0px auto; */
    z-index: 1;
}

.content {
    max-width: 800px;
    min-width: 600px;
    display: block;
    padding: 50px;
    margin: 50px auto;
    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
    background-color: #ffffff;
    overflow: hidden;
}

.page-container.sidebar-collapsed {
	width:0px;
    padding-right: 65px;
    transition: all 100ms linear;
    transition-delay: 300ms;
}

.page-container.sidebar-collapsed-back {
/*     padding-right: 280px; */
	float:left;
    transition: all 100ms linear;
}

.page-container.sidebar-collapsed .sidebar-menu {
    width: 65px;
    transition: all 100ms ease-in-out;
    transition-delay: 300ms;
}

.page-container.sidebar-collapsed-back .sidebar-menu {
    width: 280px;
    transition: all 100ms ease-in-out;
}

.page-container.sidebar-collapsed .sidebar-icon {
    transform: rotate(90deg);
    transition: all 500ms ease-in-out;
}

.page-container.sidebar-collapsed-back .sidebar-icon {
    transform: rotate(0deg);
    transition: all 500ms ease-in-out;
}

.page-container.sidebar-collapsed .logo {
    padding: 21px;
    height: 136px;
    box-sizing: border-box;
    transition: all 100ms ease-in-out;
    transition-delay: 300ms;
}

.page-container.sidebar-collapsed-back .logo {
    width: 100%;
    padding: 21px;
    height: 136px;
    box-sizing: border-box;
    transition: all 100ms ease-in-out;
}

.page-container.sidebar-collapsed #logo {
    opacity: 0;
    transition: all 200ms ease-in-out;
}

.page-container.sidebar-collapsed-back #logo {
    opacity: 1;
    transition: all 200ms ease-in-out;
    transition-delay: 300ms;
}

.page-container.sidebar-collapsed #memberCenter-menu span {
    opacity: 0;
    transition: all 50ms linear;
}

.page-container.sidebar-collapsed-back #memberCenter-menu span {
    opacity: 1;
    transition: all 200ms linear;
    transition-delay: 100ms;
}
/*------------------------------------------*/
#memberCenter-menu img{
    /* text-align:center; */
    width: 30px;
    height: 30px;
    /* background-color: red; */
    margin:0px auto;
}

#memberCenter-img,#memberCenter-a,#memberCenter-span {
	text-decoration: none;
	vertical-align: middle;
}

</style>
<script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
<body>
<!--memberCenter 選單-->
         <div class="page-container sidebar-collapsed">
            <div class="sidebar-menu">
                <div class="memberlogo">
                    <!--Header內為內縮圖區-->
                    <a id="memberCenter-a" href="#" class="sidebar-icon">
                        <img id="memberCenter-img" src="<c:url value="/component/images/MemberCenter-icon/bars-solid.svg"/>" alt="">
                    </a>
                    <!-- <a href="#">
                    <span id="memberlogo" class="fa fa-html5 fa-5x"></span>
                </a> -->
                </div>
                <div class="bar-icon-border"></div>
                <div class="MCmenu">
                    <ul id="memberCenter-menu">
                        <li id="menu-home">
                            <a href="../../index.jsp" id="memberCenter-a" style="text-decoration: none">
                            	<img id="memberCenter-img" src="<c:url value="/component/images/MemberCenter-icon/home-solid.svg"/>" alt="">
                                <span id="memberCenter-span">回首頁</span>
                            </a>
                        </li>
                        <li>
                            <a id="memberCenter-a" href="#">
                                <img id="memberCenter-img" src="<c:url value="/component/images/MemberCenter-icon/user-circle-solid.svg"/>" alt="">
                                <span id="memberCenter-span">個人資料修改</span>
<!--                                 <span class="fa fa-angle-right" style="float: right"></span> -->
                            </a>
<!--                             <ul> -->
<!--                                 <li> -->
<!--                                     <a href="MyProject.html"> -->
<!--                                          資料修改1</a> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <a href="#"> -->
<!--                                          資料修改2</a> -->
<!--                                 </li> -->
<!--                             </ul> -->
                        </li>
                        <li id="menu-academico">
                            <a id="memberCenter-a" href="">
                                <img id="memberCenter-img" src="<c:url value="/component/images/MemberCenter-icon/users-solid.svg"/>">
                                <span id="memberCenter-span">好友功能</span>
                            </a>
<!--                             <ul id="menu-academico-sub"> -->
<!--                                 <li id="menu-academico-avaliacoes"> -->
<!--                                     <a href="friendList.html">好友清單</a> -->
<!--                                 </li> -->
<!--                                 <li id="menu-academico-boletim"> -->
<!--                                     <a href="#">好友列表2</a> -->
<!--                                 </li> -->
<!--                             </ul> -->
                        </li>
                        <li id="menu-academico">
                            <a id="memberCenter-a" href="#">
                                <img id="memberCenter-img" src="<c:url value="/component/images/MemberCenter-icon/book-open-solid.svg"/>" alt="">
                                <span id="memberCenter-span">我的書櫃</span>
                            </a>
                        </li>
                        <li id="menu-academico">
                            <a id="memberCenter-a" href="#">
                                <img id="memberCenter-img" src="<c:url value="/component/images/MemberCenter-icon/list-solid.svg"/>" alt="">
                                <span id="memberCenter-span">訂單查詢</span>
                            </a>
                        </li>
                        <li id="menu-academico">
                            <a id="memberCenter-a" href="hopeList.jsp">
                                <img id="memberCenter-img" src="<c:url value="/component/images/MemberCenter-icon/h-square-solid.svg"/>" alt="">
                                <span id="memberCenter-span">願望清單</span>
                            </a>
                        </li>
                        <li style="text-decoration:none" id="menu-academico">
                            <a id="memberCenter-a" href="MyProject.jsp">
                                <img id="memberCenter-img" src="<c:url value="/component/images/MemberCenter-icon/funnel-dollar-solid.svg"/>" alt="">
                                <span id="memberCenter-span">我的募資</span>
                            </a>
                        </li>
                        <li id="menu-academico">
                            <a id="memberCenter-a" href="#">
                                <img id="memberCenter-img" src="<c:url value="/component/images/MemberCenter-icon/smile-beam-solid.svg"/>" alt="">
                                <span id="memberCenter-span">活動列表</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--memberCenter 選單-end-->
</body>
<!--Script-->
<script src="<c:url value="http://code.jquery.com/jquery-2.1.1.min.js"/>"></script>
    <script>
            var toggle = false;

            $(".sidebar-icon").click(function () {
                if (toggle) {
                    $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
                    $("#menu span").css({ "position": "absolute" });
                }
                else {
                    $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
                    setTimeout(function () {
                        $("#menu span").css({ "position": "relative" });
                    }, 400);
                }

                toggle = !toggle;
            });
        </script>
        <script type="text/javascript">

            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-36251023-1']);
            _gaq.push(['_setDomainName', 'jqueryscript.net']);
            _gaq.push(['_trackPageview']);

            (function () {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();

        </script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%
		String  member = "Howard";
		boolean check = true;
		int shopping = 0;
	%>
	
<style>
	/*---搜尋框ajax的css---*/

        #Search-div {
            margin-left: 0.7em;
            width: 160px;
            border-bottom: 1px solid gray;
            border-left: 1px solid gray;
            border-right: 1px solid gray;
            background-color: white;
            z-index: 1;
            position: fixed;
            overflow: hidden;
        }

        .Search-content {
            margin-top: 7px;
            margin-bottom: 2px;
            color: black;
            width: 160px;
            height: 30px; 
            font-size: 30px;
        }

        .Search-content:hover {
            background-color: rgb(206, 151, 132);
        }

        /*--------------------*/
</style>
	 <header>
            <nav>

                <ul class="menu">
                    <div class="logo">
                        <a href="<c:url value="/index.jsp"/>">
                            <img src="<c:url value="/component/images/ReadShareLOGO.png"/>" alt="">
                        </a>
                    </div>
                    <a href="c:url value='index.jsp'/>">
                        <div class="logoSp">享讀</div>
                    </a>
                    <div class="divSerch">
                        <form action='<c:url value="/projectSearchResult.controller" />' method="get">
                            <span>
                                <input id="Search-bar" class="search-txt" type="text" name="keyWord" value="${keyWord}" placeholder="  搜尋募資專案名稱" autocomplete="off">

                                <!-- <input type="submit" name="" id="" value="搜尋"> -->
                                <!-- <span>書名</span> -->
                                <!--<input type="radio" name="tag" id="bookName" value="bookName" checked="true">
                                        <label for="bookName">書名</label>-->
                                <!-- <span>作者</span> -->
                                <!--<input type="radio" name="tag" id="authorName" value="authorName">
                                        <label for="authorName">作者</label>
                                        <span>ISBN</span> -->
                                <!-- <input type="radio" name="tag" id="bookISBN" value="bookISBN">
                                        <label for="bookISBN">ISBN</label>-->

                            </span>
                            <div id="Search-div">
                                <a href="">
                                    <span id="Search-content"></span>
                                </a>                            
                            </div>
                            <button class="search-btn" type="submit">
                                <img src="<c:url value="/component/images/searchBT.png"/>" alt="">
                            </button>
                            
                            <!--搜尋框 Ajax區-->
                            <script>
                                    $(document).ready(function () {
                                        $("#Search-div").hide();
                                        $("#Search-bar").focus(function () {
                                            $("#Search-div").show();
                                            /*----用keydown事件讀取值,填入Search-content----*/
                                            $("#Search-bar").keydown(function () {
                                                var text = $("#Search-bar").val();
                                                $("#Search-content").text(text);
                                            /*--------*/
                                            });
                                        });
                                        $("#Search-bar").blur(function () {
                                            $("#Search-div").hide();
                                        });
                                    });
                                </script>
                                <!---->
                        </form>
                    </div>

						<c:if test="${user.id ne null}">
                    	<img src="${userImg}" alt="">
						</c:if>

                    <li>
                        <a href="pages/ShoppingCart.jsp">
                            <img src="<c:url value="/component/images/cart_enpty.png"/>" alt="">
                            <span>(0)</span>
                        </a>
                    </li>
                    <!--                     danny -->
                    <c:choose> 
                    	<c:when test="${user.id ne null}">
	                    	<li>
	                        <!-- <a href="pages/signin.jsp">登入</a> --> 
<!-- 	                        <a href="pages/signin.jsp">登出</a> -->
<%-- 							<form action='<c:url value="/signout.controller"></c:url>' method="post"> --%>
<!-- 							<input type="submit"> -->
<!-- 							</form> -->
	                        <a href='<c:url value="/signout.controller"></c:url>'>登出</a>
		                    </li>
		                    <li>
		                        <!-- <a href="pages/Member.jsp">註冊</a> -->
		                        <a href='<c:url value="/bookcase.controller"></c:url>'>個人書櫃</a>
		                    </li>
		                 
                    	</c:when>
                    	<c:otherwise>
                    		<li>
	                        <a href='<c:url value="pages/signin.jsp"></c:url>'>登入</a> 
<!-- 	                        <a href="pages/signin.jsp">登出</a> -->
		                    </li>
		                    <li>
		                        <a href="pages/Member.jsp">註冊</a>
<!-- 		                        <a href="pages/Member.jsp">個人書櫃</a> -->
		                    </li>
                    	
                    	</c:otherwise>
                    </c:choose>
                    <!--                     danny -->



                </ul>

                <ul class="menu2">
                    <li>
                        <a href="#">電子書</a>
                    </li>
                    <li>
                        <a href="#">以書易書</a>
                    </li>
                    <li>
                        <a href="<c:url value="/pages/ProjectHome.jsp"></c:url>">募資</a>
                    </li>
                    <li>
                        <a href="#">活動</a>
                    </li>
                    <li>
                        <a href="#">全站分類</a>
                    </li>
                    <li>
                        <a href="#">排行榜</a>
                    </li>

                       <!--                     danny -->
                    
                    <c:choose>
                    	<c:when test="${user.id ne null}">
                    		<span class="spSolgan">嗨，${user.memname}，歡迎光臨享讀！</span>
                    	</c:when>
                    	<c:otherwise>
                    		<span class="spSolgan">享讀，與世界分享你的視界。</span> 
                    	</c:otherwise>
                    </c:choose>
                    
<!--                     danny -->

                </ul>

            </nav>
            <div class="divHeaderSkew"></div>
        </header>

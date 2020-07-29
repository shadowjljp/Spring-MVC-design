	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<header>
            <nav>
<%-- 			${requestScope.user} --%>
                <ul class="menu">
                    <div class="logo">
                        <a href="<c:url value="/index.jsp"/>">
                            <img src="<c:url value="/component/images/ReadShareLOGO.png"/>" alt="">
                        </a>
                    </div>
                    <a href="<c:url value="/index.jsp"/>">
                        <div class="logoSp">享讀</div>
                    </a>
                    <div class="divSerch">
                        <form action='<c:url value="/bookSearchResult.controller" />' method="get">
                            <span>
                                <input class="search-txt" type="text" name="keyWord" value="${keyWord}" placeholder="  搜尋書名/作者/ISBN">
                                <!-- <input type="submit" name="" id="" value="搜尋"> -->
                                <!-- <span>書名</span> -->
                                <input type="radio" name="tag" id="bookName" value="bookName" checked="true">
                                <label for="bookName">書名</label>
                                <!-- <span>作者</span> -->
                                <input type="radio" name="tag" id="authorName" value="authorName">
                                <label for="authorName">作者</label>
                                <!-- <span>ISBN</span> -->
                                <input type="radio" name="tag" id="bookISBN" value="bookISBN">
                                <label for="bookISBN">ISBN</label>
                            </span>

                            <button class="search-btn" type="submit" >
                                <img src="<c:url value="/component/images/searchBT.png"/>" alt="">
                            </button>
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
<!--                     <li><a href="pages/signin.jsp">會員中心</a></li> -->
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
					
                    
                    
                    <c:choose>
                    	<c:when test="${user.id ne null}">
                    		<span class="spSolgan">嗨，${user.memname}，歡迎光臨享讀！</span>
                    	</c:when>
                    	<c:otherwise>
                    		<span class="spSolgan">享讀，與世界分享你的視界。</span> 
                    	</c:otherwise>
                    </c:choose>
                    

                </ul>

            </nav>
            <div class="divHeaderSkew"></div>
    </header>




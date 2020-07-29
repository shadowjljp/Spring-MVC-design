<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>書籍列表</title>
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <style>
                .booktitle {
                    color: #8b6257
                }

                tr:hover {
                    background-color: #deb887;
                    color: #00f
                }

                td:hover {
                    text-decoration: underline;
                    color: #00f
                }

                table {
                    border: 1;
                    margin-left: auto;
                    margin-right: auto;
                    text-align: center
                }

                .eventtitle {
                    width: 900px
                }

                table td,
                th {
                    height: 50px;
                    width: 200px;
                    vertical-align: middle
                }
            </style>
            <script>

            </script>
        </head>

        <body>
            <div class="wrapper">
<!--                 <div style="font-size: 150%;align-items: center"> -->
                    <%--                     <form action='<c:url value="/bookSearchResult.controller" />' method="get"> --%>
<!--                         <input id="Searchbar" style="vertical-align:top;" type="text" name="keyWord" placeholder=" 請輸入書名"> -->
                        <!--                     </form> -->
<!--                 </div> -->
                <table class="display" style="width:100%">
                    <thead>
                        <tr>
                            <th>產品編號</th>
                            <th>書名</th>
                            <th>出版日期</th>
                            <th>作者</th>
                            <th>ISBN</th>
                            <th>編輯</th>
                        </tr>

                    </thead>
                    <tbody id="newtr"></tbody>
                </table>
            </div>
            <script src="<c:url value='/component/js/jquery-3.3.1.min.js'/>"></script>
            <script>
                //瀑布流
                $(document).ready(function () {
                    var i = 0;
                    $.get("../backprod.controller", { "times": i }, function (productBeans) {
                        productBeans.forEach(function (bean) {
                            $('#newtr').append("<tr><td>" + bean[0] + "</td><td>" + bean[1] + "</td><td>" + bean[3] + "</td><td>" + bean[2] + "</td><td>" + bean[4] + "</td><td><form action='<c:url value='/selectprod.controller'/>' method='get'><input type='hidden' name='id' value="+bean[0]+"><button type='submit'>編輯</button></form></td></tr>");
                            console.log(bean);
                        });//forEach
                        i = 10;
                        $("button").on('click', function () {
                            var bookid = $(this).val();
                            $.get("../prodedit.controller", { "bookid": bookid }, function (productBeans) {
                            }, "json")//get
                        });//button click
                    }, "json")//.get

                    $(window).scroll(function () {
                        //判斷滾動條高度
                        var readheight = 1.4 * $(window).height();
                        //判斷滾動條高度-end
                        if ($(document).scrollTop() >= $(document).height() - readheight) {
                            $.get("../backprod.controller", { "times": i }, function (productBeans) {
                                productBeans.forEach(function (bean) {
                                    $('#newtr').append("<tr><td>" + bean[0] + "</td><td>" + bean[1] + "</td><td>" + bean[3] + "</td><td>" + bean[2] + "</td><td>" + bean[4] + "</td><td><form action='<c:url value='/selectprod.controller'/>' method='get'><input type='hidden' name='id' value="+bean[0]+"><button type='submit'>編輯</button></form></td></tr>");
                                });//forEach
                                $("button").on('click', function () {
                                    var bookid = $(this).val();
                                    $.get("../prodedit.controller", { "bookid": bookid }, function (productBeans) {
                                    }, "json")//get
                                });//button click
                            }, "json")//get
                            i = (i + 2);
                        }//if
                    })//scroll

                    $("#Searchbar").keyup(function () {
                        var text = $(this).val();
                        console.log(text);
                        $('#newtr').html("<br>");
                        $.post("../backprod.controller", { "getkeyname": text }, function (productBeans) {
                        	console.log("YOOOOOOOOOOOOOOOOOOOOO~~");
                        	productBeans.forEach(function (bean) {
                                console.log("Hello~~");
                                $('#newtr').append("<tr><td>" + bean[0] + "</td><td>" + bean[1] + "</td><td>" + bean[3] + "</td><td>" + bean[2] + "</td><td>" + bean[4] + "</td><td><form action='<c:url value='/selectprod.controller'/>' method='get'><input type='hidden' name='id' value="+bean[0]+"><button type='submit'>編輯</button></form></td></tr>");
                            });//foreach
                            $("button").on('click', function () {
                                var bookid = $(this).val();
                                $.get("../prodedit.controller", { "bookid": bookid }, function (productBeans) {
                                })//get
                            });//button click
                        }, "json");//.post
                })//keyup

                    //                     $("#Searchbar").keyup(function () {
                    //                         var text = $(this).val();
                    //                         console.log(text);
                    //                         $('#newtr').html();
                    //                         $.post("../backprod.controller", { "getkeyname": text }, function (productBeans) {
                    //                             productBeans.forEach(function (bean) {
                    //                                 console.log(bean.id);
                    //                                 
                    //                             });//forEach
                    //                         }, "json")//post
                    //                     })//keyup
                })//ready
            </script>

        </body>

        </html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享讀 - 所有專案</title>
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
</head>
<body>
<div class="wrapper">
        <section>
            <table id="example" class="display" style="width:100%">
                <thead>
                    <tr>
                        <th>狀態</th>
                        <th>專案名稱</th>
                        <th>編號</th>
                        <th>開始日期</th>
                        <th>結束日期</th>
                    </tr>
                </thead>
                <tbody id="newtr"></tbody>
            </table>
        </section>
    </div>
<script src="<c:url value="/component/js/jquery-3.3.1.min.js "/>"></script>
            <script>
                //瀑布流       

                $(document).ready(function () {
                    var i = 0;
                    $.get("../backproj.controller", { "times": i}, function (projectBeans) {
                        projectBeans.forEach(function (bean) {
                        	if(bean[4]!="審核中"){
                                $('#newtr').append("<tr><td>" + bean[4] + "</td><td>" + bean[3] + "</td><td>" + bean[0] + "</td><td>" + bean[1] + "</td><td>" + bean[2] + "</td></tr>");
                        	}
                        });//forEach
//                         $("button").on('click',function() {
//                         	var projid = $(this).val(); 
//                         $.get("../selectproj.controller", {"id": projid});//get
//                         });//button click
                        i =  15;
                    }, "json")//.get
	
                    $(window).scroll(function () {
                        //判斷滾動條高度
                        var readheight = 1.4 * $(window).height();
                        //判斷滾動條高度-end
                        if ($(document).scrollTop() >= $(document).height() - readheight) {
                            $.get("../backproj.controller", { "times": i}, function (projectBeans) {
                            	projectBeans.forEach(function (bean) {
                            		if(bean[4]!="審核中"){
                                        $('#newtr').append("<tr><td>" + bean[4] + "</td><td>" + bean[3] + "</td><td>" + bean[0] + "</td><td>" + bean[1] + "</td><td>" + bean[2] + "</td></tr>");
                                	}                                	});//forEach
//                                 $("button").on('click',function() {
//                                 	var projid = $(this).val(); 
//                                 $.get("../selectproj.controller", {"id": projid});//get
//                                 });//button click
                            }, "json")//get
                            i = (i+2);
                        }//if
                    })//scroll
                })//ready
                            </script>
        
        </body>

        </html>
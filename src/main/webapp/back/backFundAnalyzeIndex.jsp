<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>募資編輯頁</title>
<link rel="stylesheet" href="<c:url value="/component/css/jquery-1.12.1-ui.css"/>">
    <script charset="utf-8" src="<c:url value="/component/js/editor/kindeditor-all-min.js"/>"></script>
    <script charset="utf-8" src="<c:url value="/component/js/editor/lang/zh-TW.js"/>"></script>
    <script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
    <script>
        KindEditor.ready(function (K) {
            window.editor = K.create('#proj_content');
        });
    </script>
</head>
<body>
<div>
        <form>
            <section>
                專案標題：
                <input type="text" name="projname" />
                </br>
                提案人：
                <input type="text" name="memid" />
                </br>
                開始時間：
                <input type="date" name="projstartt" />
                </br>
                結束時間：
                <input type="datetime-local" name="projendt" />
                </br>
                目標金額：
                <input type="text" name="projbdg" />
                </br>
            </section>
            <section style="width:800px;height:200px">
                專案內容：
                <textarea id="proj_content" name="projcontent" style="width:800px;height:300px;"></textarea>
                </br>
                <div>
                    贊助方案1：
                    <br>金額：
                    <input type="text" name="projplan1price" />；回饋品：
                    <input type="text" name="projplan1content" />
                    </br>
                </div>
                </br>
                <div>
                    贊助方案2：
                    <br>金額：
                    <input type="text" name="projplan2price" />；回饋品：
                    <input type="text" name="projplan2content" />
                    </br>
                </div>
                </br>
                <div>
                    贊助方案3：
                    <br>金額：
                    <input type="text" name="projplan3price" />；回饋品：
                    <input type="text" name="projplan3content" />
                    </br>
                </div>
                </br>
                <input type="submit" name="proddisc" />
            </section>
        </form>
    </div>
</body>
</html>
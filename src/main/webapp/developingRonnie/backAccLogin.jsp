<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/component/css/jquery.dataTables.min.css" />">
</head>
<style>
    .AccHomeTielt {
        text-align: center;
        font-size: 50px;
        color: black
    }

     .button{
            text-align: center;
            margin-top: 90px;
            width: 80px; height: 30px;
        }
</style>

<body>
    <h2>
        <p class="AccHomeTielt">
            <font face="fantasy">財務統計系統</font>
        </p>

    </h2>
    <form action="AccLogin" style="text-align: center; margin-top: 80px; ">
        <div>
            <p>請輸入權限密碼：</p>
            <p>
                <input type="password" style="border-radius: 6px; height: 30px; width: 200px">
            </p>
            <input type="submit" onclick="pws()" value="驗證" class="button">
            <span id="pwsr"></span>
        </div>
    </form>


</body>

</html>
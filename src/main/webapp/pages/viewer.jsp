<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>享讀</title>
<script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/component/js/bootstrap.min.js"/>"></script>
<style type="text/css">
	.allpage {
		height: 100vh;
		width: 100vw;
		border: solid 3px red;
	}

	.leftpage {
		font-size: 18px;
		position: absolute;
		left: 0px;
		top: 0px;
		height: 100vh;
		width: 40vw;
		padding: 3em 3em 3em 3em;
		border: solid 1px black;
	}

	.rightpage {
		font-size: 18px;
		position: absolute;
		right: 0px;
		top: 0px;
		height: 100vh;
		width: 40vw;
		padding: 3em 3em 3em 3em;
		border: solid 1px black;
	}
</style>

<script type="text/javascript">

	$(document).ready(function(){
	
		var text='${text}';
		
		console.log(text.length);
		
		
	})
	
	

	// $(document).ready(function(){
	// 	var content='${file.translintro}';
	// 	var a=content.substr(0,100);
	// 	console.log(a);
	// 	$('#div').html(content);
	// 	var array=content.split("#");
	// 	console.log(array);
	// 	for(var i=0;i<array.length;i++){
	// 	$('#div').html(i+"="+array[i]);
	// 	}
	// })
</script>

</head>
<body>

	<div class="allpage">

		<div id="leftpage" class="leftpage">
			<%-- ${file.id} --%>

			${text}

		</div>

		<div id="rightpage" class="rightpage">
		
			${text}
		
		</div>

	</div>

</body>
</html>
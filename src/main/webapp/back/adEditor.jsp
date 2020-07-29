<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<c:url value="/component/css/base.css"/>">
<link rel="stylesheet" href="<c:url value="/component/css/layout.css"/>">

<script src="<c:url value="/component/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/component/js/jquery-ui-dropable.min.js"/>"></script>

<!-- <script src="../component/js/jquery-ui-effects.min.js"></script>
    <script src="../component/js/jquery-ui-Interactions.min.js"></script> -->
<style>
.adEdLeftWrapper {
	/* width: 634px; */
	width: 70vw;
	height: 70vh;
	/* background-color: red; */
}

.adEdLeftWrapper>iframe {
	border: 3px solid black;
	/* border-bottom: rgb(48, 24, 24) sloid 5px; */
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100vw;
	height: 100vh;
	transform: scale(0.7);
	transform-origin: 0 0;
}

/*右編輯區*/
.adEdRightWrapperDefault {
	position: fixed;
	right: 0px;
	top: 0px;
	width: 30vw;
	height: 100vh;
	background-color: rgba(117, 117, 117, 0.116);
}

/* .adEdRightWrapperDefaultHide {
            display: none;
        } */

/*右側預設狀態css結束*/
.adEdRightWrapperModel1Hide {
	display: none;
}

.adEdRightWrapperModel2Hide {
	display: none;
}

.adEdRightWrapperModel1 {
	position: fixed;
	right: 0px;
	top: 0px;
	width: 30vw;
	height: 75vh;
	background-color: rgba(117, 117, 117, 0.116);
	/* opacity: 0.5; */
	/* display: none; */
}

.adEdRightWrapperModel2 {
	position: fixed;
	right: 0px;
	top: 0px;
	width: 30vw;
	height: 75vh;
	background-color: rgba(117, 117, 117, 0.116);
}

.slideEditDefault {
	text-align: center;
}

.slideEditMode1 {
	/* display: none; */
	position: fixed;
	top: 10vh;
	right: 0px;
	height: 65vh;
	width: 30vw;
	overflow: scroll;
}

.slideEditMode1>div>img {
	width: 90%;
	
}

.slideUnit {
	margin-top: 5px;
	text-align: center;
}

.slideUnit:hover {
	/* background-color: rgb(187, 255, 0); */
	cursor: pointer;
	filter: drop-shadow(15px 15px 20px black);
	z-index: 5;
}

.uploadFunction {
	position: fixed;
	bottom: 0px;
	right: 0px;
	width: 30vw;
	text-align: center;
	height: 25vh;
	font-size: 18px;
	background-color: rgb(202, 226, 192);
	/* z-index: 10; */
}

.uploadFunction>form>div {
	margin-top: 5px;
	text-align: center;
}

.uploadFunction>form>div>input {
	font-size: 15px;
	width: 20vw;
}

.adEditSubmit {
	font-size: 15px;
	width: 50px;
	margin-top: 8px;
}

.titleForAd {
	position: fixed;
	top: 0px;
	right: 0px;
	width: 30vw;
	height: 10vh;
	text-align: center;
	font-size: 20px;
	line-height: 50px;
	background-color: rgb(202, 226, 192);
	background-color: #454135;
	/* background-color: rgba(117, 117, 117, 0.226); */
}

.titleForAd>div {
	color: white;
	background-color: #454135;
	border-radius: 10px;
	width: 80%;
	position: absolute;
	left: 10%;
	top: 5%;
}

/*底部編輯區*/
.adEdBottomWrapper {
	position: fixed;
	left: 0px;
	bottom: 0px;
	width: 70vw;
	height: 30vh;
	background-color: rgba(231, 220, 117, 0.205);
	/* opacity: 0.5; */
}

.bookEditDefault {
	text-align: center;
	/* display: none; */
}

.bookEditModeImg {
	height: 30vh;
	width: 12vw;
	position: absolute;
	left: 0px;
}

.bookEditMode img {
/* 	height: 100%; */
	width: 100%;
	
}

.bookEditModeRs {
	position: absolute;
	left: 12vw;
	height: 30vh;
	width: 40vw;
	overflow: auto;
	/* color: black; */
	/* background-color: blue; */
	border-left: solid black 1px;
}

.bookEditModeForm {
	position: absolute;
	right: 0px;
	height: 30vh;
	width: 18vw;
	border-left: solid black 1px;
	border-right: 1px black solid;
}

.bookEditModeFormUp {
	/* background-color: green; */
	width: 100%;
	height: 50%;
	border-bottom: solid 1px black;
}

.bookEditorTitle {
	background-color: rgba(41, 37, 28, 0.863);
	text-align: center;
	height: 25%;
	color: white;
	font-size: 130%;
}

.bookEditModeFormDown {
	position: absolute;
	bottom: 0px;
	/* background-color: blue; */
	width: 100%;
	height: 50%;
}

.searchBook {
	height: 30%;
	width: 80%;
	background-color: white;
	border: solid black 1px;
	text-align: center;
	border-radius: 10px;
	position: absolute;
	top: 35%;
	left: 10%;
}

.bookEditModeBt {
	width: 35%;
	height: 25%;
	background-color: rgb(230, 173, 89);
	border-radius: 10px;
	text-align: center;
	padding: 1%;
	cursor: pointer;
	position: absolute;
	left: 33%;
	bottom: 5%;
	filter: drop-shadow(5px 5px 5px rgba(0, 0, 0, 0.651));
}

.bookEditorSelect {
	margin-top: 5%;
	text-align: center;
}

.bookEditorSelect select {
	width: 20%;
	height: 20%;
}

.bookEditModeRs table, th, tr, td {
	border: solid black 1px;
}

.bookEditModeRs table {
	width: 100%;
	/* height: 100%; */
}

#thBook {
	width: 8vw;
}

#thAuthor {
	width: 8vw;
}

#thISBN {
	width: 8vw;
}

tr>td>div {
	height: 15px;
	overflow: hidden;
	cursor: pointer;
}
</style>


</head>

<body>


	<div class="wrapper">
		<div class="adEdLeftWrapper">
			<!-- IndexContent -->
			
			<iframe id="f1" src="<c:url value="/index.jsp"/>"
				frameborder="0"></iframe>

			<!--<iframe id="f1" src="../developingHoward/IndexContent.html" frameborder="0"></iframe>-->
		</div>


		<div id="adEdRightDefault" class="adEdRightWrapperDefault">
			<div class="slideEditDefault">
				<h3>Banner Editor</h3>
				<h4>點選區塊開始</h4>
			</div>
		</div>

		<div id="adEdRightModel1" class="adEdRightWrapperModel1Hide">

			<div class="slideEditMode1">
				<div class="titleForAd">
					<div>編輯模式 區塊1 解析度1440*300</div>
				</div>
				<div class="uploadFunction">
					<form action="<c:url value="/uploadNewAdBySubmit.controller"/>"
						method="POST">
						<div>
							<span>上傳 </span> <input type="file" name="adImg" /> <input
								type="hidden" name="zone" value="1">
						</div>

						<div>
							<span>連結 </span> <input type="text" name="adUrl" />
						</div>
						<div>
							<span>上架日</span> <input type="date" name="beginDate">
						</div>
						<div>
							<span>下架日</span> <input type="date" name="endDate">
						</div>

						<button id="adEditSubmit1" class="adEditSubmit" value="送出"
							name="1">送出</button>

					</form>

				</div>

				<!-- 只要一個就好 用for 開始 -->
				<!-- id要放廣告資料表的id select by 目前未過期時間及 order by adorder-->
				<!--                 <div id="1002" class="slideUnit"> -->
				<!--                     <img src="../component/images/BannerZone1/1.jpg" alt=""> -->
				<!--                 </div> -->
				<!-- 只要一個就好 用for 結束 -->

			</div>
		</div>

		<!-- right model2 -->
		<div id="adEdRightModel2" class="adEdRightWrapperModel2Hide">

			<div class="slideEditMode1">
				<div class="titleForAd">
					<div>編輯模式 區塊2 解析度540*300</div>
				</div>
				<div class="uploadFunction">
					<form action="<c:url value="/uploadNewAdBySubmit.controller"/>"
						method="POST">
						<div>
							<span>上傳 </span> <input type="file" name="adImg" /> <input
								type="hidden" name="zone" value="2">
						</div>

						<div>
							<span>連結 </span> <input type="text" name="adUrl" />
						</div>
						<div>
							<span>上架日</span> <input type="date" name="beginDate">
						</div>
						<div>
							<span>下架日</span> <input type="date" name="endDate">
						</div>

						<input class="adEditSubmit" type="submit" value="送出" name="1">

					</form>

				</div>

				<!-- 重複html結構 只要一個就好 用for 開始 -->
				<!--                 <div class="slideUnit"> -->
				<!--                     <img src="../component/images/BannerZone2/1.jpeg" alt=""> -->
				<!--                 </div> -->
				<!-- 只要一個就好 用for 結束 -->

			</div>
		</div>
		<!-- right model2 end -->

		<div class="adEdBottomWrapper">
			<div id="bookEditDefault" class="bookEditDefault">
				<h2>首頁書籍編輯區</h2>
				<h4>點選書籍開始</h4>
			</div>

			<div id="bookEditMode" class="bookEditMode" style="display: none">
				<!-- 底部左 start -->
				<div class="bookEditModeImg">
					<!-- 					<img src="../component/images/book/01.jpg" alt="封皮"> -->
				</div>
				<!-- 底部左 end -->

				<!-- 底部中間 start-->
				<div class="bookEditModeRs">
					<table>
						<thead>
							<th id="thBook">書名</th>
							<th id="thAuthor">作者</th>
							<th id="thISBN">ISBN</th>
							<th id="thIntro">簡介</th>
						</thead>
						<tbody>
							<!-- 這一個就好 用for -->

							<!-- <tr id="1">
								<td>
									<div>是書名我是書名我是書名我是書名我是書名我是書名</div>
								</td>
								<td><a href="">我是作者</a></td>
								<td><a href="">ISBN</a></td>
								<td><a href="">簡介</a></td>
							</tr> -->

							<!-- 這一個就好 -->

						</tbody>
					</table>
				</div>
				<!-- 底部中間 end-->

				<!-- 底部右 start-->
				<div class="bookEditModeForm">
					<div class="bookEditModeFormUp">
						<div class="bookEditorTitle">搜尋書籍</div>

						<div class="searchBook" contenteditable="true">請輸入關鍵字</div>
						<div class="bookEditModeBt">搜尋</div>

					</div>

					<div class="bookEditModeFormDown">
						<div class="bookEditorTitle">選擇順位</div>
						<div class="bookEditorSelect">

							<!-- 							區塊: <select name="y" id="y"> -->
							<!-- 								<option value="1">1</option> -->
							<!-- 								<option value="2">2</option> -->
							</select> 位置: <select name="bookIndexOrder" id="bookIndexOrder">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>

						</div>
						<div class="bookEditModeBt">確定</div>
					</div>
				</div>
				<!-- 底部右 end-->
			</div>



		</div>

	</div>


	<script>
		$(document).ready(function () {

			//////////ajax 去資料庫撈廣告資料
			var today = new Date();
			var todayForm = today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
			$.post("../loadAfterDocZone.controller", { "date": todayForm, "zone": 1 }, function (beans) {
				beans.forEach(bean => {
					// 					console.log('zone1='+bean.id);
					$(".adEdRightWrapperModel1Hide>.slideEditMode1").append("<div id=" + bean.id + " class='slideUnit'><img src=" + bean.adimg + "  alt=" + bean.adurl + "></div>");

				});
				$('.slideUnit').draggable();
				initDroppableForSlideUnit($('.slideUnit'));
			}, "json");

			$.post("../loadAfterDocZone.controller", { "date": todayForm, "zone": 2 }, function (beans) {
				beans.forEach(bean => {
					// 					console.log('zone2='+bean.id);
					$(".adEdRightWrapperModel2Hide>.slideEditMode1").append("<div id=" + bean.id + " class='slideUnit'><img src=" + bean.adimg + "  alt=" + bean.adurl + "></div>");

				});
				$('.slideUnit').draggable();
				initDroppableForSlideUnit($('.slideUnit'));

			}, "json");


			////////////////////////////////搜尋書籍功能
			$(".searchBook").on("focus", function () {
				$(".searchBook").text("");//click清空預設文字
			});

			let keyWord;
			let bkImg = new Array;
			let bookShowOrder = new Array;
			let arrayMaping;
			$(".searchBook+.bookEditModeBt").on("click", function () {
				keyWord = $(".searchBook").text();

				//             	let bookId,bookName,bookIsbn,bookIntro,bookImg,bookAuthor;
				$.post("../selectBookByKeyWord.controller", { "keyWord": keyWord, "tag": "模糊搜尋" }, function (beans) {
					$('tbody').html("");//清空畫面
					bkImg.length = 0;
					arrayMaping=0;
					beans.forEach(bean => {
						console.log('bookId=' + bean.id);
						console.log('bookName=' + bean.bookName);
						//     					console.log('bookIsbn='+bean.bookIsbn);
						//     					console.log('bookIntro='+bean.bookIntro);
						//     					console.log('bookImg='+bean.bookImg);
						//     					console.log('bookAuthor='+bean.bookAuthor);
						$('tbody').append("<tr id='" + arrayMaping++ + "'><td><div>" + bean.bookName + "</div></td><td><div>" + bean.bookAuthor + "</div></td><td><div>" + bean.bookIsbn + "</div></td><td><div>" + bean.bookIntro + "</div></td></tr>");
						bkImg.push(bean.bookImg);
						bookShowOrder.push(bean.bookShowOrder);
					});
					$("td").on("click", function () {
						// alert($(this).parent("tr").attr("id"));
						$("#bookIndexOrder").val(bookShowOrder[$(this).parent("tr").attr("id")]);
						
						$(".bookEditModeImg").html("<img src=" + bkImg[$(this).parent("tr").attr("id")] + " >");
					});

				}, "json");

				//             	alert(keyWord);
			});

			//////////////////////////////新書上首頁功能

			let bookIndexOrder;

			$(".bookEditorSelect+.bookEditModeBt").on("click", function () {
// 				zoneX = $("#x").val();
				bookIndexOrder = $("#bookIndexOrder").val();
				alert(bookIndexOrder);
			});

			/////////////////////////////////廣告檔案上傳功能
			$('input:file').on('change', function () {
				$this = $(this);
				$this.val(this.files[0].name);
			});
			
			
			//////
// 			setTimeout(function(){
				
// 				alert("開始");
			
// 			var $iframe, $contents;
// 			/////////////////////////////////iframe內部事件綁定
// 			$localContents = $(document);
// 			$('#f1').on('click',loadIframe());////////load iframe
			
// 			},3000);//////

			scanIframeAndBindEvent();
			
		});//load doc
		///////function不用doc readay
// 		setTimeout(loadIframe,3000);	
		
		function scanIframeAndBindEvent(){
			var timer = setInterval(function() {
				if($('#f1').contents().find('.section3 li').length>0){
					loadIframe();
					clearInterval(timer);
				}
			}, 1000);
		}
		
		
		function loadIframe(){
		$contents = $('#f1').contents();
			
				//產生section1元素遮罩
				$contents.find('.section1').on('mouseover', function () {
					$(this).addClass('mouseOverSectionCover');
				});
				$contents.find('.section1').on('mouseout', function () {
					$(this).removeClass('mouseOverSectionCover');
				});
				$contents.find('.section1').on('click', function () {
					$('#adEdRightDefault').css({ "display": "none" });

					if ($('#adEdRightModel2').hasClass('adEdRightWrapperModel2')) {
						$('#adEdRightModel2').addClass('adEdRightWrapperModel2Hide');
					}
					// $localContents.find('#adEdRightModel2').removeClass('adEdRightWrapperModel2');
					$('#adEdRightModel1').removeClass('adEdRightWrapperModel1Hide');
					$('#adEdRightModel1').addClass('adEdRightWrapperModel1');
				});

				//產生section2元素遮罩
				$contents.find('.section2').on('mouseover', function () {
					$(this).addClass('mouseOverSectionCover');
				});
				$contents.find('.section2').on('mouseout', function () {
					$(this).removeClass('mouseOverSectionCover');
				});
				$contents.find('.section2').on('click', function () {
					// $localContents.find('#adEdRightDefault').css({ "display": "none" });
					$('#adEdRightDefault').css({ "display": "none" });

					if ($('#adEdRightModel1').hasClass('adEdRightWrapperModel1')) {
						$('#adEdRightModel1').addClass('adEdRightWrapperModel1Hide');
					}

					$('#adEdRightModel2').removeClass('adEdRightWrapperModel2Hide');
					$('#adEdRightModel2').addClass('adEdRightWrapperModel2');

				});

				//產生section3元素遮罩
				$contents.find('.section3').on('mouseover', function () {
					$(this).addClass('mouseOverSectionCover');
				});
				$contents.find('.section3').on('mouseout', function () {
					$(this).removeClass('mouseOverSectionCover');
				});

				//產生section li元素遮罩
				$contents.find('.section3 ul li').on('mouseover', function () {
					$(this).addClass('mouseOverSectionLiCover');
				});
				$contents.find('.section3 ul li').on('mouseout', function () {
					$(this).removeClass('mouseOverSectionLiCover');
				});
				$contents.find('.section3 ul').on('click', function () {
					$('#bookEditDefault').css({ "display": "none" });
					$('#bookEditMode').removeAttr('style');
				});	
				$contents.find('section li').on('click', function () {
// 					$('#bookEditDefault').css({ "display": "none" });
// 					$('#bookEditMode').removeAttr('style');
					
					/////////一個ajax事件 把li的id拿去select 書的資料回來
					let selectId = $(this).attr("id");
					
					$.get("../adEditorSelectBookById.controller",{"id":selectId},function(bean){
						console.log("bean="+bean.bookName);
						$("#bookIndexOrder").val(bean.bookShowOrder);
						
						$(".bookEditModeImg").html("<img src=" + bean.bookImg + " >");
						$('tbody').html("<tr id='" + bean.bookId + "'><td><div>" + bean.bookName + "</div></td><td><div>" + bean.bookAuthor + "</div></td><td><div>" + bean.bookIsbn + "</div></td><td><div>" + bean.bookIntro + "</div></td></tr>");
						
						
					},"json");
				});

				//產生section div元素遮罩
				$contents.find('.section2>div').on('mouseover', function () {
					$(this).addClass('mouseOverSection2DivCover');
				});
				$contents.find('.section2>div').on('mouseout', function () {
					$(this).removeClass('mouseOverSection2DivCover');
				});
				//////////////////////////dragable 綁定
				$contents.find('section li').draggable();
				//                 $('.slideUnit').draggable();

				/////////////////////////drapable 綁定 for slideUnit
				//                 initDroppableForSlideUnit($('.slideUnit'));

				/////////////////////////
				initDroppable($contents.find('section li'));
				function initDroppable($elements) {
					$elements.droppable({
						// activeClass: "ui-state-default",
						// hoverClass: "ui-drop-hover",
						accept: "section li",

						over: function (event, ui) {
							var $this = $(this);
						},
						drop: function (event, ui) {
							var $this = $(this);
							var li1 = $('<li>' + ui.draggable.html() + '</li>')
							var linew1 = $(this).after(li1);

							var li2 = $('<li>' + $(this).html() + '</li>')
							var linew2 = $(ui.draggable).after(li2);
							
							var aId = ui.draggable.attr('id');
							var bId = $this.attr('id');

							$(ui.draggable).remove();
							$(this).remove();
							
							$.post("../swapBookWhileDrop.controller", { "aId": aId, "bId": bId });

							initDroppable($contents.find('section li'));
							$contents.find('section li').draggable({ revert: "invalid" })
								.on('mouseover', function () {
									$(this).addClass('mouseOverSectionLiCover');
								})
								.on('mouseout', function () {
									$(this).removeClass('mouseOverSectionLiCover');
								});
						}
					});
				}


				//////////////////////////////
				$contents.find('a').removeAttr('href');

		}
		
		
		///////////////////////////
		function initDroppableForSlideUnit($elements) {
			$elements.droppable({
				// activeClass: "ui-state-default",
				// hoverClass: "ui-drop-hover",
				accept: ".slideUnit",

				over: function (event, ui) {
					var $this = $(this);
				},
				drop: function (event, ui) {
					var $this = $(this);
					// var div1 = $('<div id="'+ $this.attr('id')+'" class="slideUnit">' + ui.draggable.html() + '</div>')//drag
					var div1 = $('<div id="' + ui.draggable.attr('id') + '" class="slideUnit">' + ui.draggable.html() + '</div>')
					var divNew1 = $this.after(div1);
					// alert(ui.draggable.attr('id'))
					// alert('dropId=' + $this.attr('id'));
					var aId = ui.draggable.attr('id');
					var bId = $this.attr('id');

					var div2 = $('<div id="' + $this.attr('id') + '" class="slideUnit">' + $this.html() + '</div>')
					var divNew2 = $(ui.draggable).after(div2);

					$(ui.draggable).remove();
					$this.remove();

					//ajax呼叫controller去model更換兩張圖片的順序欄位
					$.post("../swapAdOrderWhileDrop.controller", { "aId": aId, "bId": bId }, function () {
						
						$('#f1').attr('src', $('#f1').attr('src'));
						scanIframeAndBindEvent();
				
					});
					
					
// 					scanIframeAndBindEvent();

					initDroppableForSlideUnit($('.slideUnit'));
					$('.slideUnit').draggable({
						revert: "invalid"
					});
				}
			});
		}
		
		
	</script>
</body>
</html>
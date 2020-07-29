<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<html>

		<head>
			<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
			<title>產品編輯頁</title>
			<link rel="stylesheet" href="<c:url value=" /component/css/jquery-1.12.1-ui.css "/>">
			<link rel="stylesheet" href="<c:url value=" /component/css/bootstrap.min.css "/>">

			<!-- /FinalProject/src/main/webapp/component/js/kindeditor/simple.css -->
			<link rel="stylesheet" href="<c:url value=" /component/js/kindeditor/simple.css "/>">
			<!-- <link rel="stylesheet" href="../component/js/kindeditor/simple.css"> -->
			<style>
				.section1 {
					height: 1200px;
					width: 1250px;
					margin-left: 30px;
					
				}

				.div1 {
					float: left;
					width: 385px;
					height: 500px;
					margin-left: 15px;
				}

				.div2 {
					float: left;
					width: 385px;
					height: 500px;
					margin-left: 20px;
					
				}

				.div3 {
					float: left;
					width: 385px;
					height: 500px;
					margin-left: 30px;
				}

				.textareadiv {
					width: 600px;
					height: 450px;
					float: left;
					margin-left: 15px;
				}

				textarea {
					width: 580px;
					height: 350px;
					
				}

				.buttons {
					margin-left: auto;
					margin-right: auto;
					width: 190px
				}

				@media only screen and (max-width: 1280px) {

					.section1 {
						height: 1200px;
						width: 1200px;
						margin-left: 20px;
						
					}

					.div1 {
						float: left;
						width: 380px;
						height: 400px;
						margin-left: 0px;
						
					}

					.div2 {
						float: left;
						width: 380px;
						height: 400px;
						margin-left: 0px;
						
					}

					.div3 {
						float: left;
						width: 380px;
						height: 400px;
						margin-left: 0px;
					}

					.textareadiv {
						width: 580px;
						height: 440px;
						float: left;
						margin-left: 0px;
					}

					textarea {
						width: 570px;
						height: 350px;						
					}

				}


				@media only screen and (max-width: 1024px) {
					.section1 {
						height: 1200px;
						width: 950px;
						margin-left: 20px;						
					}

					.div1 {
						float: left;
						width: 300px;
						height: 400px;
						margin-left: 0px;						
					}

					.div2 {
						float: left;
						width: 280px;
						height: 400px;
						margin-left: 20px;
						
					}

					.div3 {
						float: left;
						width: 280px;
						height: 400px;
						margin-left: 20px;
					}

					.textareadiv {
						width: 450px;
						height: 440px;
						float: left;						
						margin-left: 0px;
					}

					textarea {
						width: 440px;
						height: 350px;						
					}
				}
			</style>

			<script src="<c:url value=" /component/js/jquery-3.3.1.min.js "/>"></script>
			<script src="<c:url value=" /component/js/bootstrap.min.js "/>"></script>

			<!-- /FinalProject/src/main/webapp/component/js/kindeditor/kindeditor-all-min.js -->
			<script charset="utf-8" src="<c:url value=" /component/js/kindeditor/kindeditor-all-min.js "/>"></script>
			<!-- <script charset="utf-8" src="../component/js/kindeditor/kindeditor-all-min.js"></script> -->

			<!-- /FinalProject/src/main/webapp/component/js/kindeditor/kindeditor-zh-TW.js -->
			<script charset="utf-8" src="<c:url value=" /component/js/kindeditor/kindeditor-zh-TW.js "/>"></script>

		</head>

		<body>
			<div>
				<form action="<c:url value='/backprodedit.controller'/>" method="post" class="form-inline" style="font-family: 微軟正黑體; width: 95%;">
					<section class="section1">
						<div class="div1">
							<h3>基本資料</h3>
							<div class="form-group">
								<label for="bknamezh">中文書名：</label>
								<input type="text" id="bknamezh" name="bknamezh" class="form-control mx-sm-3" placeholder="請輸入中文書名" autocomplete="off" value="${book.bknamezh}">
							</div>
							<br>
							<div class="form-group">
								<label for="bknameen">英文書名：</label>
								<input type="text" class="form-control mx-sm-3" name="bknameen" id="bknameen" placeholder="請輸入英文書名" autocomplete="off" value="${book.bknameen}">
							</div>
							</br>
							<div class="form-group">
								<label for="bkisbn">ISBN：</label>
								<input type="text" class="form-control" name="bkisbn" id="bkisbn" placeholder="請輸入ISBN" autocomplete="off" value="${book.bkisbn}"
								/>
							</div>
							</br>
							<div class="form-group">
								<label for="authorname">作者全名：</label>
								<input type="text" class="form-control" name="authorname" id="authorname" placeholder="請輸入作者全名" autocomplete="off" value="${book.authornameen}"
								/>
							</div>
							</br>
							<div class="form-group">
								<label for="transname">譯者全名：</label>
								<input type="text" class="form-control" name="transname" id="transname" placeholder="譯者全名" autocomplete="off" value="${book.transid}"
								/>
							</div>
							</br>
							<div class="form-group">
								<label for="bkpubdate">出版日期：</label>
								<input type="date" class="form-control" name="bkpubdate" id="bkpubdate" placeholder="請輸入出版日期" autocomplete="off" value="${book.bkpubdate}"
								/>
							</div>
							</br>
							<div class="form-group">
								<label for="bkpublisher">出版社：</label>
								<input type="text" class="form-control" name="bkpublisher" id="bkpublisher" placeholder="請輸入出版社" autocomplete="off" value="${book.bkpublisher}"
								/>
							</div>
						</div>
						<div class="div2">
							<h3>進階資料</h3>
							<div class="form-group">
								<label for="bkseries">書籍系列：</label>
								<input type="text" id="bkseries" name="bkseries" class="form-control mx-sm-3" placeholder="請輸入書籍系列" autocomplete="off" value="${book.bkseries}">
							</div>
							</br>
							<div class="form-group">
								<select id="bklang" class="custom-select" name="bklang">
									<option>請選擇語言</option>
									<option value="中文">中文</option>
									<option value="英文">英文</option>
								</select>
							</div>
							</br>
							<div class="form-group">
								<select id="classid" class="custom-select" name="classid">
									<option>請選擇書籍分類</option>
									<option value="8">【社會科學】政治</option>
									<option value="9">【社會科學】經濟</option>
									<option value="10">【社會科學】法律</option>
									<option value="11">【電腦程式】程式語言</option>
									<option value="12">【電腦程式】檢定認證</option>
									<option value="13">【電腦程式】應用軟體</option>
									<option value="14">【商業】投資理財</option>
									<option value="15">【商業】市場行銷</option>
									<option value="16">【商業】經營管理</option>
									<option value="17">【旅遊】台灣</option>
									<option value="18">【旅遊】中國</option>
									<option value="19">【旅遊】拉丁美洲</option>
									<option value="23">【旅遊】東南亞</option>
									<option value="20">【文學】古典文學</option>
									<option value="21">【文學】翻譯小說</option>
									<option value="22">【文學】輕小說</option>
								</select>
							</div>
							</br>
							<div class="form-group">
								<label for="bkpage">書籍頁數：</label>
								<input type="text" id="bkpage" name="bkpage" class="form-control mx-sm-3" placeholder="請輸入書籍頁數" autocomplete="off" value="${book.bkpages}">
							</div>
							</br>
							<div class="form-group">
								<label for="bkver">書籍版本：</label>
								<input type="text" id="bkver" name="bkver" class="form-control mx-sm-3" placeholder="請輸入書籍版本" autocomplete="off" value="${book.bkver}">
							</div>
							</br>
							<div class="form-group">
								<label for="bksize">書籍尺寸：</label>
								<input type="text" id="bksize" name="bksize" class="form-control mx-sm-3" placeholder="請輸入書籍尺寸" autocomplete="off" value="${book.bksize}">
							</div>
							</br>

							<div class="input-group mb-3">
								<label for="bksize">書籍重量：</label>
								<input type="text" class="form-control" name="bkwgt" id="bkwgt" placeholder="請輸入書籍重量" aria-label="請輸入書籍重量" aria-describedby="bkwgt"
								 autocomplete="off" value="${book.bkwgt}">
								<div class="input-group-append">
									<span class="input-group-text">公克(g)</span>
								</div>
							</div>
							<div class="form-group">
								<label for="bkskin">書籍封腰：</label>
								<input type="text" id="bkskin" name="bkskin" class="form-control mx-sm-3" placeholder="請輸入書籍封腰" autocomplete="off" value="${book.bkskin}">
							</div>
						</div>
						<div class="div3">
							<h3>庫存管理</h3>
							<div class="form-group">
								<select id="flag" class="custom-select" name="flag">
									<option>請選擇產品種類</option>
									<option value="C">紙本/電子皆有</option>
									<option value="A">僅紙本書</option>
									<option value="B">僅電子書</option>
								</select>
							</div>
							</br>
							<div class="form-group">
								<label for="prodstock">庫存數量：</label>
								<input type="text" id="prodstock" name="prodstock" class="form-control mx-sm-3" placeholder="請輸入庫存數量" autocomplete="off"
								 value="${book.prodstock}">
							</div>
							</br>
							<div class="form-group">
								<label for="prodcost">進貨成本：</label>
								<input type="text" id="prodcost" name="prodcost" class="form-control mx-sm-3" placeholder="請輸入進貨成本" autocomplete="off" value="${book.prodcost}">
							</div>
							</br>
							<div class="form-group">
								<label for="prodprice">書籍售價：</label>
								<input type="text" id="prodprice" name="prodprice" class="form-control mx-sm-3" placeholder="請輸入書籍售價" autocomplete="off"
								 value="${book.prodprice}">
							</div>
							</br>
							<div class="form-group">
								<label for="proddisc">電子書折扣：</label>
								<input type="text" id="proddisc" name="proddisc" class="form-control mx-sm-3" placeholder="請輸入電子書折扣" autocomplete="off" value="${book.proddisc}">
							</div>
							</br>

							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">上傳電子書檔案</span>
								</div>
								</br>
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="bkefile" name="bkefile">
									<label class="custom-file-label" for="bkefile"></label>
								</div>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">上傳書籍圖片</span>
								</div>
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="prodimg" name="prodimg">
									<label class="custom-file-label" for="prodimg"></label>
								</div>
							</div>
						</div>
						<div class="textareadiv">
							<h3>書籍目錄</h3>
							<textarea id="bkmenu" name="bkmenu" value="${book.bkmenu}"></textarea>
							</br>
						</div>
						<div class="textareadiv">
							<h3>書籍簡介</h3>
							<textarea id="bkintro" name="bkintro" value="${book.bkintro}"></textarea>
							</br>
							</br>
						</div>
						<div class="buttons">
							<button type='submit' style="font-size: 120%; color: green">確認送出</button>
							<button type="button" style="font-size: 120%; color: red" onclick="history.back()">取消</button>
						</div>
					</section>
				</form>
				<script>
					$(document).ready(function () {
						//設定兩個編輯器
						KindEditor.ready(function (K) {
							K.create('textarea[name="bkmenu"]', {
								width: '700px',
								langType: 'zh-TW',
								themeType: 'simple',
								afterCreate: function () {
									this.sync();
								},
								afterBlur: function () {
									this.sync();
								}
							});
							K.create('textarea[name="bkintro"]', {
								width: '700px',
								langType: 'zh-TW',
								themeType: 'simple',
								afterCreate: function () {
									this.sync();
								},
								afterBlur: function () {
									this.sync();
								}
							});
						});
						/////////////////////////////////檔案上傳功能
						$('input:file').on('change', function () {
							$this = $(this);
							$this.val(this.files[0].name);
							alert($this.val(this.files[0].name))
						});
					});
				</script>
			</div>
		</body>

		</html>
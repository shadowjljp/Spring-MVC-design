<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>預覽 - $@我是一本書-享讀</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<script>
			$(function () {
				$("#tabs").tabs({
					event: "mouseover"
				});
			});
		</script>
		<style>
			.sc1 {
				width: 1000px;
				/* padding-top: 5%; */
				margin: 20px auto auto auto;
			}

			.booktitle {
				padding-top: 5%;
				color: #8B6257;
			}

			.list {
				list-style: square;
				color: #8B6257;
			}

			.bookimg {
				float: left;
				width: 230px;
				height: 320px;
			}

			.bookimg img {
				max-height: 300px;
				max-width: 210px;
				margin: 10px
			}

			.sc2 {
				float: left;
				margin: 0 10% 10% 10%;
			}

			.sc2 h4 {
				color: #8B6257;
				font-weight: bold;
			}

			.content {
				margin-left: 5%;
			}

			.content p {
				color: #8B6257;
			}

			input {
				padding: 5px 15px;
				background: #8B6257;
				color: white;
				border: 0 none;
				cursor: pointer;
				-webkit-border-radius: 5px;
				border-radius: 5px;
			}
		</style>
	</head>

	<body>
		<div style="text-align:center;">
			<h3 style="background-color: red;color: white">注意！這是預覽頁面，請檢查後送出。</h1>
		</div>
		<div class="container">
			<section class="sc1">
				<div>
					<div class="booktitle">
						<h3 name="bookNameZh">
							$@我是一本書
						</h3>
						<h4 name="bookNameOri">
							$@I am a book
						</h4>
					</div>
					<hr>
					<div class="bookimg">
						<img name="bookImg" src="<c:url value=" /component/images/book/01.jpg "/>">
					</div>

					<div style="float: left; width: 300px; margin: 40px 0 0 50px;">
						<div>
							<ul>
								<li class="list" name="authorZh">作者： $@俺作者
								</li>
								<li class="list" name="authorOri">出版社： $@我是出版社
								</li>
								<li class="list" name="bookLang">語言： $@我是語言
								</li>
								<li class="list" name="bookPublishDate">出版日期： $@我是出版日期
								</li>
								<li class="list" name="bookPrice">定價： $@元
								</li>
								<li class="list" name="bookPrice">電子書： $@元
								</li>
							</ul>

						</div>
					</div>
					<div style="float: right; width: 200px; height: 320px; margin-right: 5%;">
						<span>庫存數量： $@</span>
						<br>
						<br>
						<br>
						<input type="submit" value="購買紙本書">
						<br>
						<br>
						<input type="submit" value="購買電子書">
					</div>
				</div>
			</section>
			<section style="float: left;margin:100px 10% 10% 10%;">
				<div id="tabs" style="width: 1000px;height: 4000px;">
					<ul>
						<li>
							<a href="#tabs-1">內容簡介book_intro</a>
						</li>
						<li>
							<a href="#tabs-2">作者介紹</a>
						</li>
						<li>
							<a href="#tabs-3">目錄</a>
						</li>
						<li>
							<a href="#tabs-4">詳細資料</a>
						</li>
					</ul>
					<div id="tabs-1" class="content">
						<div style="text-align: center;">
							<strong>比爾‧蓋茲2018年度選書
								<br /> 「我所讀過最重要的書之一，帶領你清晰思考世界的必備指南。」──比爾‧蓋茲</strong>
						</div>
						<p>
							<br /> 　　★出版即登上各國暢銷榜，Amazon非文學類書籍第１名
							<br /> 　　★十度登上TED大會演說，知名公共教育家漢斯．羅斯林的唯一著作
							<br /> 　　★一本讓比爾蓋茲從此不再使用「開發中國家」名詞的書，送給全美大學生的畢業禮物
							<br /> 　　★嚴長壽、謝金河、王文靜、劉軒、葉丙成、馮勃翰、林明仁、許毓仁　熱情推薦
							<br />
							<br /> 　　「我窮盡畢生之力抵抗全球的無知，傳播基於事實的世界觀。
							<br /> 　　這本書是我的最後一役，是我設法影響世界的最後努力。」──漢斯．羅斯林
							<br />
							<br /> 　　有些事儘管牴觸我們的直覺認知，儘管顯得絕無可能，卻仍然真確。
							<br /> 　　這本書在談世界，在談世界真正的樣子，
							<br /> 　　也是在談你，以及你該如何真確思考，基於事實行動。
							<br />
							<br /> 　　我們總希望可以客觀看待事情，針對世界現狀的簡單問題，例如「全球有多少人口享有電力」「有多少一歲孩童接種疫苗」「有多少比例的女孩讀完小學」，也希望能提出正確的觀察。
							<br />
							<br /> 　　但事實上，我們一再地給出錯誤的結論，而且錯得離譜，連隨機亂答的黑猩猩，正確率都贏過老師、記者、投資銀行家和諾貝爾獎得主。這到底是怎麼一回事？
							<br />
							<br /> 　　在這本書裡，全球公衛教授和公共教育家漢斯．羅斯林，提出為什麼會發生這種事的新解釋──原來問題在於人們對自己的無知毫無頭緒，我們的思考往往受到不自覺且可預期的直覺偏誤所影響。
							<br />
							<br /> 　　漢斯致力運用活潑的數據實證，改變人們的思維方式。
							<br />
							<br /> 　　他舉出十個扭曲認知的直覺，如何造成我們誤解身處的世界，例如：我們有傾向把世界分成兩個陣營的「二分化直覺」（通常是某種版本的「我們」和「他們」），我們吸收訊息的方式深受「恐懼型直覺」主宰（災害新聞空前常見，偏偏世界空前安全）、對於進步的認知容易受「負面型直覺」牽引（相信多數事情正變得更糟，忽視逐漸的進步），並提出一個個明確可執行的思考工具，告訴大家如何扭轉根深柢固的偏見。
							<br />
							<br /> 　　這是一本深具啟發性的書，足以改變你看世界的方式，帶領你建立新的思維習慣。基於真實認知的世界觀，國際組織能把有限的資源，運用得更有效率，企業能運籌帷幄，找出未來的商機，我們也能懷抱更少擔憂，看見更多希望。
							<br />
							<br />
							<strong>各界好評</strong>
							<br />
							<br />
							<strong>　來自各界的熱情推薦！</strong>
							<br />
							<br /> 　　嚴長壽（公益平臺文化基金會董事長，台東均一實驗高中董事長）
							<br /> 　　謝金河（財訊傳媒集團董事長）
							<br /> 　　王文靜（商周集團執行長）
							<br /> 　　劉　軒（跨界創意工作者、暢銷作家）
							<br /> 　　葉丙成（臺灣大學電機系教授、PaGamO/BoniO執行長）
							<br /> 　　林明仁（臺灣大學經濟系教授兼系主任）
							<br /> 　　馮勃翰（臺灣大學經濟系副教授）
							<br /> 　　許毓仁（TEDxTaipei共同創辦人、立法委員）──熱情推薦
							<br />
							<br /> 　　「漢斯對人性有深入的瞭解，說故事的技巧媲美他解析數據的方法，我希望他的書能夠讓更多人懷抱好奇心和開放的態度面對世界，就跟他本人一樣。」──比爾．蓋茲
							<br />
							<br /> 　　「漢斯．羅斯林在談『人類所默默取得宛若奇蹟的重大進展』，也只有他談得了，但這本書遠遠不只如此，還解釋了各種進展為何通常不為人知，讀者又該如何看得更加清楚。」──梅琳達．蓋茲
							<br />
							<br /> 　　「《真確》將徹底改變你的觀點。想要真正了解這個世界，現在就閱讀它！」──魯爾夫．杜伯里，哲學博士，暢銷書《思考的藝術》《行為的藝術》作者
							<br />
							<br /> 　　「我預料這會是一本好書，但它完全超乎我的期待，而且鼓舞人心。漢斯．羅斯林太會說故事了！」──提姆．哈福特，《金融時報》主筆，「臥底經濟學家」專欄作者
							<br />
							<br /> 　　「探討戰爭、恐攻，癌症和滅絕的書獲頒大獎肯定，為我們病態的好奇心提供了事情可能出錯的可怕方式。然而有一個未被重視的書籍類型，敘述人類進展的事實。這樣的理性樂觀主義激發了優雅機智的敘事，並為啟蒙運動理念的熱情辯護，即知識和憐憫可以改善人類處境&hellip;&hellip;已故TED明星漢斯．羅斯林的《真確》就是這樣的一本書。」──史蒂芬．平克，《衛報》書評
							<br />
							<br /> 　　「精彩絕倫！一本充滿熱情關懷和豐富智識之作，更因為作者來不及親眼見證它的發光，顯得更加動人&hellip;&hellip;漢斯．羅斯林說故事的魅力，和詮釋數據的高超技巧在每一頁展露無遺。還有誰會選用『人均吉他數』作為人類進步的指標呢？──《金融時報》
							<br />
							<br /> 　　「在漢斯．羅斯林的手中，數據會唱歌，健康與經濟的趨勢變得栩栩如生，全球整體發展（包括有些出乎意料的好消息）變得清清楚楚。」──TED
							<br /> 　　「和漢斯．羅斯林聊三分鐘，會改變你對世界的想法。」──《自然》（Nature）</p>
					</div>
					<div id="tabs-2" class="content">
						<p>
							<strong>漢斯．羅斯林&nbsp; Hans Rosling</strong>
							<br />
							<br /> 　　臨床醫師、數據學家、全球公衛教授及世界級公共教育家，曾擔任世界衛生組織（WHO）與聯合國兒童基金會（UNICEF）的顧問，共同創辦無國界醫生的瑞典分部，也是世界經濟論壇（WEF）全球議程網路的成員。
							<br />
							<br /> 　　2005年，漢斯和兒子奧拉與媳婦安娜共同創辦蓋普曼德基金會（Gapminder Foundation），以立基事實的認知，對抗廣泛的無知，協助人們了解這個世界。
							<br />
							<br /> 　　他經常獲邀至企業、國際機構與非政府組織講學，更史無前例十度登上TED大會，演講影片瀏覽數超過3,500萬次。
							<br /> 漢斯的研究貢獻，使他獲得《時代》雜誌選為全球百大影響力人物，美國《外交政策》雜誌選為全球百大思想家，商業雜誌Fast Company選為年度百大創意人物。
							<br />
							<br /> 　　他自詡為認真的「可能性主義者」──既不抱持無端的希望，也不抱持無端的恐懼，持續抗拒過度誇大的世界觀。不是無可救藥的樂觀，而是對現實有清楚的認識，相信未來會持續進步。
							<br />
							<br /> 　　2017年因胰臟癌辭世，把人生的最後時光用在撰寫本書。
							<br />
							<br />
							<strong>奧拉．羅斯林 Ola Rosling
								<br />
								<br /> 安娜．羅朗德 Anna Rosling R&ouml;nnlund</strong>
							<br />
							<br /> 　　奧拉和安娜是漢斯的兒子和媳婦，和他共同創辦蓋普曼德基金會。奧拉從2010年起擔任會長至今。
							<br />
							<br /> 　　安娜和奧拉開發的氣泡圖軟體Trendalyzer被Google買下之後，奧拉成為Google公共數據團隊的負責人，安娜則是團隊裡的用戶體驗資深設計師，兩人都靠開發成果贏得不少國際獎項。
							<br />
							<br />
							<strong>譯者簡介
								<br />
								<br /> 林力敏</strong>
							<br />
							<br /> 　　專職譯者，輔仁大學翻譯所畢業，曾獲聯合報文學獎、梁實秋文學獎、林榮三文學獎等國內重要文學獎項，曾任聯合報〈繽紛版〉專欄作家。
							<br />
							<br /> 　　愛騎車兜風，持續探索各類新知、探究文學與人生。譯有《原力思辨》《人生問題的有益答案》《房間裡最有智慧的人》《康乃爾最經典的思考邏輯課》等。</p>
					</div>
					<div id="tabs-3" class="content">
						<p>作者的話
							<br /> 前　言　讓我的數據改變你的心智
							<br /> &nbsp;
							<br />
							<strong>Chapter 1</strong>
							<strong>　二分化直覺偏誤&nbsp;&nbsp;&nbsp;&nbsp; </strong>
							<br /> ◎一切的開端
							<br /> ◎認為「世界分成兩塊」的大誤解
							<br /> ◎這類印象哪裡不對？
							<br /> ◎逮住誤解的怪獸
							<br /> ◎天啊，多數人去哪了！
							<br /> ◎新的分類方式：四個所得等級
							<br /> ◎二分化直覺
							<br /> ◎如何扭轉二分化直覺偏誤？
							<br /> &nbsp;
							<br />
							<strong>Chapter 2</strong>
							<strong>　負面型直覺偏誤</strong>
							<br /> ◎脫離水溝
							<br /> ◎認為「世界正變得更糟」的大誤解
							<br /> ◎數據如同一種療癒
							<br /> ◎我彷彿生於埃及
							<br /> ◎關於進步的震撼教育
							<br /> ◎負面型直覺
							<br /> ◎如何扭轉負面型直覺偏誤？
							<br /> ◎我想感謝這個社會
							<br /> &nbsp;
							<br />
							<strong>Chapter 3</strong>
							<strong>　直線型直覺偏誤</strong>
							<br /> ◎我所看過最嚇人的圖表
							<br /> ◎認為「地球人口只會持續增加」的大誤解
							<br /> ◎直線型直覺
							<br /> ◎人口曲線的形狀
							<br /> ◎如何扭轉直線型直覺偏誤？
							<br /> ◎你看到了一條線的多少部分？
							<br /> &nbsp;
							<br />
							<strong>Chapter 4</strong>
							<strong>　恐懼型直覺偏誤</strong>
							<br /> ◎滿地的鮮血
							<br /> ◎注意力的過濾器
							<br /> ◎恐懼型直覺
							<br /> ◎天災：在這種時候，你想的是什麼？
							<br /> ◎看不見的4000萬個航班
							<br /> ◎戰亂與衝突
							<br /> ◎汙染
							<br /> ◎恐攻
							<br /> ◎害怕對的事物
							<br /> &nbsp;
							<br />
							<strong>Chapter 5</strong>
							<strong>　失真型直覺偏誤</strong>
							<br /> ◎不在我眼前的死者
							<br /> ◎失真型直覺
							<br /> ◎如何扭轉失真型直覺偏誤？
							<br /> ◎80/20法則
							<br /> ◎善用除法
							<br /> ◎比對與除法
							<br /> &nbsp;
							<br />
							<strong>Chapter 6</strong>
							<strong>　概括型直覺偏誤</strong>
							<br /> ◎獻上晚餐
							<br /> ◎概括型直覺
							<br /> ◎撞上現實
							<br /> ◎尋找更好的分類
							<br /> ◎質疑你的分類
							<br /> &nbsp;
							<br />
							<strong>Chapter 7</strong>
							<strong>　宿命型直覺偏誤</strong>
							<br /> ◎地獄的雪球
							<br /> ◎宿命型直覺
							<br /> ◎石頭怎麼動？
							<br /> ◎如何克制宿命型直覺偏誤？
							<br /> ◎沒有願景的人
							<br /> &nbsp;
							<br />
							<strong>Chapter 8</strong>
							<strong>　單一觀點直覺偏誤</strong>
							<br /> ◎我們能相信誰？
							<br /> ◎單一觀點直覺
							<br /> ◎專家與社運人士
							<br /> ◎槌子與釘子
							<br /> ◎狂熱的意識形態擁護者
							<br /> &nbsp;
							<br />
							<strong>Chapter 9</strong>
							<strong>　怪罪型直覺偏誤</strong>
							<br /> ◎去揍奶奶吧
							<br /> ◎怪罪型直覺
							<br /> ◎怪罪遊戲
							<br /> ◎更可能的英雄
							<br /> ◎忍住尋找代罪羔羊
							<br /> &nbsp;
							<br />
							<strong>Chapter 10</strong>
							<strong>　急迫型直覺偏誤</strong>
							<br /> ◎路障與心障
							<br /> ◎急迫型直覺
							<br /> ◎學著控制急迫型直覺偏誤
							<br /> ◎我們「應該」擔心的五個全球危機
							<br /> &nbsp;
							<br />
							<strong>Chapter 11</strong>
							<strong>　求真習慣的實際運用</strong>
							<br /> ◎求真習慣是怎麼救了我一命？
							<br /> ◎求真習慣的實際運用
							<br /> ◎最後的話
							<br /> &nbsp;
							<br /> 後　記
							<br /> 致　謝
							<br /> 附　錄</p>
					</div>
					<div id="tabs-4">
						<ul>
							<li class="list" name="authorZhOri">作者： $@我是作者($@我是原名))
							</li>
							<li class="list" name="translatorZhOri">譯者： $@我是譯者($@我是原名))
							</li>
							<li class="list" name="bookPublisher">出版社： $@我是出版社
							</li>
							<li class="list" name="bookSeries">書籍系列： $@我是書籍系列
							</li>
							<li class="list" name="bookPublishDate">出版日期： $@我是出版日期
							</li>
							<li class="list" name="bookPages">頁數： $@我是頁數
							</li>
							<li class="list" name="bookVersion">書籍版次： $@我是書籍版次
							</li>
							<li class="list" name="bookSize">書本大小： $@我是書本大小
							</li>
							<li class="list" name="bookSkin">裝訂方法： $@我是裝訂方法
							</li>
							<li class="list" name="bookWeight">書籍重量： $@我是公克
							</li>
							<li class="list" name="bookIsbn">ISBN： $@我是ISBN
							</li>
						</ul>
					</div>
				</div>
			</section>
		</div>
	</body>

	</html>
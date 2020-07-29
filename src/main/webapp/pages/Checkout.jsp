<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/component/css/base.css"/>" />
<link rel="stylesheet" href="<c:url value="/component/css/layout.css"/>">
<link rel="stylesheet" href="<c:url value="/component/css/headerAndFooter.css"/>">

<title>結帳頁面</title>
<style>

td {
	display: table-cell;
}
.store input[type="text"]{
	width:100px;
	min-height: 42px;
	max-height: 42px;
	border-radius: 4px;
	border: 1px solid #ececec;
	padding: 8px;
	margin-left: 50px;
	margin-bottom: 5px;
	cursor:arrow;
}
.store *{
font-size:1.1em;
}
.store select{
	width:200px;
}
.underline {
	margin-top: 100px;
	border-bottom: solid 2px #EBA3A3;
}
.underline1{
	margin-top: 120px;
	border-bottom: solid 2px #EBA3A3;
}
.othersAlsoBuy {
	width: 250px;
	background-color: #EBA3A3;
	margin-bottom: 0px;
	border-radius: 5px;
	display: inline;
	padding: 5px 15px 3px 15px;
}

.centralized {
	margin-top:20px;
	margin-top: 100px;
	width: 1200px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.option li {
	background-color: #DBD7D7;
	line-height: 1.3;
	padding: 10px 5px 10px 10px;
	border-radius: 4px;
}

.option {
	margin-top: 1em;
}

.seperate {
	border-bottom: 1px solid black;
}

.map {
	background-color: #e4e4e4;
	border-radius: 4px;
	margin-bottom: 16px;
	font-size: 15px;
	height: 45px;
	padding: 10px;
	line-height: 35px;
	text-align: center;
	box-shadow: 0px 0px 1px #b3b3b3;
	cursor: pointer;
}

.store {
	margin-top: 5px;
}

.info {
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 15px;
	text-align: left;
}

.info1 {
	border: solid #E0E0E0 1px;
	padding: 10px;
	margin-top: 3px;
}

input[type="radio"], label {
	cursor: pointer;
}

input[type="text"] {
	min-height: 42px;
	max-height: 42px;
	border-radius: 4px;
	border: 1px solid #ececec;
	padding: 8px;
	margin-left: 50px;
	margin-bottom: 5px;
}

#copy_member_check {
	margin: 20px;
	margin-left: 52px;
}

.almostEnd {
	float: right;
	margin-top: 30px;
	margin-left: 80px;
}

.lastStep_buttom {
	border-radius: 4px;
	margin-bottom: 16px;
	color: black;
	font-size: 16px;
	height: 45px;
	padding: 10px;
	line-height: 45px;
	text-align: center;
	box-shadow: 0px 1px 2px #a4a4a4;
	border: none;
	background-color: #e4e4e4;
	padding: 10px;
}

.nextStep_buttom {
	background-color: #EBA3A3;
	border-radius: 4px;
	margin-bottom: 16px;
	font-size: 16px;
	height: 45px;
	padding: 10px;
	line-height: 45px;
	text-align: center;
	box-shadow: 0px 1px 2px #a4a4a4;
	border: none;
	cursor: pointer;
}

.table_buttom {
	border-collapse: separate;
	border-spacing: 20px;
	margin-bottom: 20px;
}

#b2 {
	color: #330000;
	font-weight: bolder;
	font-size: 1.5em;
	width:100px;
}
.paragh6a{
	width:50%;
	position:relative;
display:inline;
	display: inline-block;
	float:right;
}
.paragh1a {
	width:50%;
	position:relative;
	display:inline;
	display: inline-block
}
.paragh1b{
	width:50%;
	position:relative;
	display:inline;
	display: inline-block
}
      #s1{
          
           height:25%;
           width:100%;
             display:inline-block;
            border:indianred 3px solid;
            padding-bottom:0px;
        }
        
        #s2{
           
            float:right;
            border:rgb(100, 92, 205) 3px dashed;
            margin-bottom:250px;
  }
  #testTable td{
 border:rgb(100, 92, 205) 3px dashed;
  	width:500px;
  }
</style>
</head>
<body>
	<div class="wrapper">
		<c:import url="/partial/header.jsp"></c:import>
		<%-- 	<%@ include file="../partial/header.jsp"%> --%>
		<div class="centralized">
		<form action='<c:url value="/checkout.controller" />' method="post">
			<div class="paragh1" id="one">
			<div class="underline1">
				<h4 class="othersAlsoBuy">選擇配送方式</h4>
			</div>
			<ul class="option">
				<li class="seperate"><label><input type="radio"
						name="shipping" id="7-11" value="7-11取貨">7-11取貨</label></li>
				<li><label><input type="radio" name="shipping"
						id="home" value="宅配到府">宅配到府</label></li>
			</ul>
			</div>
			<!--  第一段結束-------------------------------------------------------- -->
			<div id="two">
			<div class="temporary">
				<div class="underline">
					<h4 class="othersAlsoBuy">選擇7-11取貨門市</h4>
				</div>
				<div class="store">
					<a class="map">依地圖選擇</a><a>選擇常用門市</a>
				</div>

			</div>
			</div>
				<!--  第八段結束-------------------------------------------------------- -->
			<div id="eight">
			<div class="temporary2">
				<div class="underline">
					<h4 class="othersAlsoBuy">輸入地址</h4>
				</div>
				<div class="store">
				 <span id="pageOneUpdatePanel">       
            <br />
              
                    <td id="addressSelectionContainer">
                            <div id="selectionInputContainer">
				<select name="ddlZipCode" style="color:Gray;">
		<option selected="selected" value="(郵遞區號)">(郵遞區號)</option>
		<option value="100">100</option>
		<option value="103">103</option>
		<option value="104">104</option>
		<option value="105">105</option>
		<option value="106">106</option>
		<option value="108">108</option>
		<option value="110">110</option>
		<option value="111">111</option>
		<option value="112">112</option>
		<option value="114">114</option>
		<option value="115">115</option>
		<option value="116">116</option>
		<option value="200">200</option>
		<option value="201">201</option>
		<option value="202">202</option>
		<option value="203">203</option>
		<option value="204">204</option>
		<option value="205">205</option>
		<option value="206">206</option>
		<option value="207">207</option>
		<option value="208">208</option>
		<option value="209">209</option>
		<option value="210">210</option>
		<option value="211">211</option>
		<option value="212">212</option>
		<option value="220">220</option>
		<option value="221">221</option>
		<option value="222">222</option>
		<option value="223">223</option>
		<option value="224">224</option>
		<option value="226">226</option>
		<option value="227">227</option>
		<option value="228">228</option>
		<option value="231">231</option>
		<option value="232">232</option>
		<option value="233">233</option>
		<option value="234">234</option>
		<option value="235">235</option>
		<option value="236">236</option>
		<option value="237">237</option>
		<option value="238">238</option>
		<option value="239">239</option>
		<option value="241">241</option>
		<option value="242">242</option>
		<option value="243">243</option>
		<option value="244">244</option>
		<option value="247">247</option>
		<option value="248">248</option>
		<option value="249">249</option>
		<option value="251">251</option>
		<option value="252">252</option>
		<option value="253">253</option>
		<option value="260">260</option>
		<option value="261">261</option>
		<option value="262">262</option>
		<option value="263">263</option>
		<option value="264">264</option>
		<option value="265">265</option>
		<option value="266">266</option>
		<option value="267">267</option>
		<option value="268">268</option>
		<option value="269">269</option>
		<option value="270">270</option>
		<option value="272">272</option>
		<option value="290">290</option>
		<option value="300">300</option>
		<option value="302">302</option>
		<option value="303">303</option>
		<option value="304">304</option>
		<option value="305">305</option>
		<option value="306">306</option>
		<option value="307">307</option>
		<option value="308">308</option>
		<option value="310">310</option>
		<option value="311">311</option>
		<option value="312">312</option>
		<option value="313">313</option>
		<option value="314">314</option>
		<option value="315">315</option>
		<option value="320">320</option>
		<option value="324">324</option>
		<option value="325">325</option>
		<option value="326">326</option>
		<option value="327">327</option>
		<option value="328">328</option>
		<option value="330">330</option>
		<option value="333">333</option>
		<option value="334">334</option>
		<option value="335">335</option>
		<option value="336">336</option>
		<option value="337">337</option>
		<option value="338">338</option>
		<option value="350">350</option>
		<option value="351">351</option>
		<option value="352">352</option>
		<option value="353">353</option>
		<option value="354">354</option>
		<option value="356">356</option>
		<option value="357">357</option>
		<option value="358">358</option>
		<option value="360">360</option>
		<option value="361">361</option>
		<option value="362">362</option>
		<option value="363">363</option>
		<option value="364">364</option>
		<option value="365">365</option>
		<option value="366">366</option>
		<option value="367">367</option>
		<option value="368">368</option>
		<option value="369">369</option>
		<option value="400">400</option>
		<option value="401">401</option>
		<option value="402">402</option>
		<option value="403">403</option>
		<option value="404">404</option>
		<option value="406">406</option>
		<option value="407">407</option>
		<option value="408">408</option>
		<option value="411">411</option>
		<option value="412">412</option>
		<option value="413">413</option>
		<option value="414">414</option>
		<option value="420">420</option>
		<option value="421">421</option>
		<option value="422">422</option>
		<option value="423">423</option>
		<option value="424">424</option>
		<option value="426">426</option>
		<option value="427">427</option>
		<option value="428">428</option>
		<option value="429">429</option>
		<option value="432">432</option>
		<option value="433">433</option>
		<option value="434">434</option>
		<option value="435">435</option>
		<option value="436">436</option>
		<option value="437">437</option>
		<option value="438">438</option>
		<option value="439">439</option>
		<option value="500">500</option>
		<option value="502">502</option>
		<option value="503">503</option>
		<option value="504">504</option>
		<option value="505">505</option>
		<option value="506">506</option>
		<option value="507">507</option>
		<option value="508">508</option>
		<option value="509">509</option>
		<option value="510">510</option>
		<option value="511">511</option>
		<option value="512">512</option>
		<option value="513">513</option>
		<option value="514">514</option>
		<option value="515">515</option>
		<option value="516">516</option>
		<option value="520">520</option>
		<option value="521">521</option>
		<option value="522">522</option>
		<option value="523">523</option>
		<option value="524">524</option>
		<option value="525">525</option>
		<option value="526">526</option>
		<option value="527">527</option>
		<option value="528">528</option>
		<option value="530">530</option>
		<option value="540">540</option>
		<option value="541">541</option>
		<option value="542">542</option>
		<option value="544">544</option>
		<option value="545">545</option>
		<option value="546">546</option>
		<option value="551">551</option>
		<option value="552">552</option>
		<option value="553">553</option>
		<option value="555">555</option>
		<option value="556">556</option>
		<option value="557">557</option>
		<option value="558">558</option>
		<option value="600">600</option>
		<option value="602">602</option>
		<option value="603">603</option>
		<option value="604">604</option>
		<option value="605">605</option>
		<option value="606">606</option>
		<option value="607">607</option>
		<option value="608">608</option>
		<option value="611">611</option>
		<option value="612">612</option>
		<option value="613">613</option>
		<option value="614">614</option>
		<option value="615">615</option>
		<option value="616">616</option>
		<option value="621">621</option>
		<option value="622">622</option>
		<option value="623">623</option>
		<option value="624">624</option>
		<option value="625">625</option>
		<option value="630">630</option>
		<option value="631">631</option>
		<option value="632">632</option>
		<option value="633">633</option>
		<option value="634">634</option>
		<option value="635">635</option>
		<option value="636">636</option>
		<option value="637">637</option>
		<option value="638">638</option>
		<option value="640">640</option>
		<option value="643">643</option>
		<option value="646">646</option>
		<option value="647">647</option>
		<option value="648">648</option>
		<option value="649">649</option>
		<option value="651">651</option>
		<option value="652">652</option>
		<option value="653">653</option>
		<option value="654">654</option>
		<option value="655">655</option>
		<option value="700">700</option>
		<option value="701">701</option>
		<option value="702">702</option>
		<option value="703">703</option>
		<option value="704">704</option>
		<option value="708">708</option>
		<option value="709">709</option>
		<option value="710">710</option>
		<option value="711">711</option>
		<option value="712">712</option>
		<option value="713">713</option>
		<option value="714">714</option>
		<option value="715">715</option>
		<option value="716">716</option>
		<option value="717">717</option>
		<option value="718">718</option>
		<option value="719">719</option>
		<option value="720">720</option>
		<option value="721">721</option>
		<option value="722">722</option>
		<option value="723">723</option>
		<option value="724">724</option>
		<option value="725">725</option>
		<option value="726">726</option>
		<option value="727">727</option>
		<option value="730">730</option>
		<option value="731">731</option>
		<option value="732">732</option>
		<option value="733">733</option>
		<option value="734">734</option>
		<option value="735">735</option>
		<option value="736">736</option>
		<option value="737">737</option>
		<option value="741">741</option>
		<option value="742">742</option>
		<option value="743">743</option>
		<option value="744">744</option>
		<option value="745">745</option>
		<option value="800">800</option>
		<option value="801">801</option>
		<option value="802">802</option>
		<option value="803">803</option>
		<option value="804">804</option>
		<option value="805">805</option>
		<option value="806">806</option>
		<option value="807">807</option>
		<option value="811">811</option>
		<option value="812">812</option>
		<option value="813">813</option>
		<option value="814">814</option>
		<option value="815">815</option>
		<option value="817">817</option>
		<option value="819">819</option>
		<option value="820">820</option>
		<option value="821">821</option>
		<option value="822">822</option>
		<option value="823">823</option>
		<option value="824">824</option>
		<option value="825">825</option>
		<option value="826">826</option>
		<option value="827">827</option>
		<option value="828">828</option>
		<option value="829">829</option>
		<option value="830">830</option>
		<option value="831">831</option>
		<option value="832">832</option>
		<option value="833">833</option>
		<option value="840">840</option>
		<option value="842">842</option>
		<option value="843">843</option>
		<option value="844">844</option>
		<option value="845">845</option>
		<option value="846">846</option>
		<option value="847">847</option>
		<option value="848">848</option>
		<option value="849">849</option>
		<option value="851">851</option>
		<option value="852">852</option>
		<option value="880">880</option>
		<option value="881">881</option>
		<option value="882">882</option>
		<option value="883">883</option>
		<option value="884">884</option>
		<option value="885">885</option>
		<option value="890">890</option>
		<option value="891">891</option>
		<option value="892">892</option>
		<option value="893">893</option>
		<option value="894">894</option>
		<option value="896">896</option>
		<option value="900">900</option>
		<option value="901">901</option>
		<option value="902">902</option>
		<option value="903">903</option>
		<option value="904">904</option>
		<option value="905">905</option>
		<option value="906">906</option>
		<option value="907">907</option>
		<option value="908">908</option>
		<option value="909">909</option>
		<option value="911">911</option>
		<option value="912">912</option>
		<option value="913">913</option>
		<option value="920">920</option>
		<option value="921">921</option>
		<option value="922">922</option>
		<option value="923">923</option>
		<option value="924">924</option>
		<option value="925">925</option>
		<option value="926">926</option>
		<option value="927">927</option>
		<option value="928">928</option>
		<option value="929">929</option>
		<option value="931">931</option>
		<option value="932">932</option>
		<option value="940">940</option>
		<option value="941">941</option>
		<option value="942">942</option>
		<option value="943">943</option>
		<option value="944">944</option>
		<option value="945">945</option>
		<option value="946">946</option>
		<option value="947">947</option>
		<option value="950">950</option>
		<option value="951">951</option>
		<option value="952">952</option>
		<option value="953">953</option>
		<option value="954">954</option>
		<option value="955">955</option>
		<option value="956">956</option>
		<option value="957">957</option>
		<option value="958">958</option>
		<option value="959">959</option>
		<option value="961">961</option>
		<option value="962">962</option>
		<option value="963">963</option>
		<option value="964">964</option>
		<option value="965">965</option>
		<option value="966">966</option>
		<option value="970">970</option>
		<option value="971">971</option>
		<option value="972">972</option>
		<option value="973">973</option>
		<option value="974">974</option>
		<option value="975">975</option>
		<option value="976">976</option>
		<option value="977">977</option>
		<option value="978">978</option>
		<option value="979">979</option>
		<option value="981">981</option>
		<option value="982">982</option>
		<option value="983">983</option>

	</select>
				<select name="ddlCity" id="ddlCity" style="color:Black;">
		<option value="臺北市">臺北市</option>
		<option value="新北市">新北市</option>
		<option selected="selected" value="基隆市">基隆市</option>
		<option value="宜蘭縣">宜蘭縣</option>
		<option value="桃園市">桃園市</option>
		<option value="新竹市">新竹市</option>
		<option value="新竹縣">新竹縣</option>
		<option value="苗栗縣">苗栗縣</option>
		<option value="臺中市">臺中市</option>
		<option value="彰化縣">彰化縣</option>
		<option value="南投縣">南投縣</option>
		<option value="雲林縣">雲林縣</option>
		<option value="嘉義市">嘉義市</option>
		<option value="嘉義縣">嘉義縣</option>
		<option value="臺南市">臺南市</option>
		<option value="高雄市">高雄市</option>
		<option value="屏東縣">屏東縣</option>
		<option value="臺東縣">臺東縣</option>
		<option value="花蓮縣">花蓮縣</option>
		<option value="澎湖縣">澎湖縣</option>
		<option value="金門縣">金門縣</option>
		<option value="連江縣">連江縣</option>
		<option value="南海島">南海島</option>

	</select>	

     <input type="text" name="ddlRoadStreet" id="ddlRoadStreet" style="color:Gray;width:30%;"placeholder="(路 \ 街 \ 道 )">
      <label>(路 \ 街 \ 道 )</label>
                                
                                <select name="ddlSS" id="ddlSS" >
		<option value=""></option>
		<option value="1">一</option>
		<option value="2">二</option>
		<option value="3">三</option>
		<option value="4">四</option>
		<option value="5">五</option>
		<option value="6">六</option>
		<option value="7">七</option>
		<option value="8">八</option>
		<option value="9">九</option>

	</select>
                                段
                                <br />
                              
                                <input name="txtLL" type="text" maxlength="4" id="txtLLLLL"  />
                                巷
                                <input name="txtAA" type="text" maxlength="5" id="txtAAAAA"  />
                                弄
                               
                                <input name="txtNN" type="text" maxlength="4" id="txtNNNN"  />
                                號之
                                <input name="txtEE" type="text" maxlength="3" id="txtEEE"  />
                                ，
                                <br />
                                <input name="txtFF" type="text" maxlength="3" id="txtFFF"  />
                                樓之
                                <input name="txtDD" type="text" maxlength="3" id="txtDDD" />
                                ，
                                <input name="txtRR" type="text" maxlength="4" id="txtRRRR"  />
                                室
</div>
                                <div style='font-size:22px;color:#660000; padding-left:20px'>
                                註：若您的地址為8-2號，則請輸入8號之2。
                                </div>
                    </td>
                </tr>
                           
                    
                      
                        </table>
             
               
     
        </span>
				</div>

			</div>
			</div>
			<!--  第二段結束---------------------------------------- -->
		<div id="three">
				<div class="underline">
					<h4 class="othersAlsoBuy">選擇付款方式</h4>
				</div>
				<ul class="option">
					<li class="seperate"><input type="radio" name="payment"
						id="cash" value="7-11代碼付款"><label for="cash">7-11代碼付款</label></li>
					<li class="seperate"><input type="radio" name="payment"
						id="eWallet" value="wallet"><label for="eWallet">電子錢包</label></li>
				
					<li class="seperate"><input type="radio" name="payment"
						id="OF" value="歐付寶"><label for="OF">歐付寶</label></li>
				
					<li class="seperate"><input type="radio" name="payment"
						id="creditCard" value="信用卡"><label for="creditCard">信用卡</label></li>
				
					<li><input type="radio" name="payment" id="ATM" value="ATM"><label
						for="ATM轉帳" >ATM轉帳</label></li>
				</ul>
			</div>
			<!--  第三段結束---------------------------------------- -->
		<div id="four">
				<div class="underline">
					<h4 class="othersAlsoBuy">選擇優惠方式</h4>
				</div>
				<ul class="option">
					<li><label>使用折價券:</label><input type="text" name="coupon">
				</ul>
			</div>
			<!--  第四段結束---------------------------------------- -->

			<div id="five">
				<div class="underline">
					<h4 class="othersAlsoBuy">訂購人資訊</h4>
				</div>
				<ul class="info">
					<li>
						<div class="info1">
							<table>
								<tr>
									<td><label>姓名</label></td>
									<td><input type="text" name="member_name" 
										id="mname" /></td>
									<td></td>
								</tr>
								<tr>
									<td>聯絡電話</td>
									<td><input type="text" name="member_mobile" 
										id="mobile" /></td>
								</tr>
								<tr>
									<td>E-mail</td>
									<td><input type="text" name="member_email" 
										id="mail" /></td>
								</tr>
							
								</li>
								</ul>
							</table>
						</div>
			</div>
			<!--  第五段結束---------------------------------------- -->
			<div class="paragh6" id="six">
			<div id="test1">
				<div class="underline">
					<h4 class="othersAlsoBuy">收件人資訊</h4>
				</div>
				<ul class="info">
					<li>
						<div class="info1">
							<table>
								<tr>
									<td></td>
									<td><input type="checkbox" name="copy_member" value="Y" id="copy_member_check" class="customcheckbox02">
										<label	class="asd" for="copy_member_check">同訂購人資料</label></td>
								</tr>
								<tr>
									<td>收件人</td>
									<td><input type="text" name="receiver_name" 
										id="mname1" /></td>
									<td></td>
								</tr>
								<tr>
									<td>聯絡電話</td>
									<td><input type="text" name="receiver_mobile" 
										id="mobile1" /></td>
								</tr>
								<tr>
									<td>E-mail</td>
									<td><input type="text" name="receiver_email" 
										id="mail1" /></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								</li>
								</ul>
							</table>
							
						</div>
						</div>
			</div>
			<!--  第六段結束---------------------------------------- -->
			<div id="seven">
				<div class="underline" >
					<h4 class="othersAlsoBuy">發票資訊</h4>
				</div>
				<ul class="option">
					<li class="seperate"><label><input id="donate"
							type="radio" name="invoice" value="捐贈發票">捐贈發票</label></li>
					<li class="seperate"><label><input type="radio"
							name="invoice" value="二聯電子發票">二聯電子發票</label></li>
					<li><label><input type="radio" name="invoice" value="三聯電子發票">三聯電子發票</label>
					</li>
				</ul>
				<input type="hidden" name="memberId" value="${user.id }"/>
			</div>
			<!--  第七段結束---------------------------------------- -->

			<div class="almostEnd">
				<table class="table_buttom">
					<tr>
						<td colspan="9"></td>
						<td class="lastStep_buttom"><a class="b1" href="">上一步</a></td>
						<td class="nextStep_buttom">
						 <button class="search-btn" type="submit" id="b2">
									下一步 </button>
									</td>
<!-- 						<td><input class="test" type="checkbox"></td> -->
					</tr>
				</table>
			</div>
			<!-- 第八段結束-------------------------------------------- -->
			
			<!-- 測試段開始------------------------------------------ -->
<!-- 			<div id="s1"> -->
			
<!-- 			</div> -->
<!-- 		<div  id="s2"> -->
		
<!-- 		</div> -->
<!-- <table id="testTable"> -->
<!-- <tr><td><dl><dt  id="d1"></dt><dd  id="d2"></dd></dl></td></tr> -->
<!-- <tr><td><dl><dt id="d3"></dt><dd  id="d4"></dd></dl></td></tr> -->
<!-- <tr><td><dl><dt id="d5"></dt><dd  id="d6"></dd></dl></td></tr> -->
<!-- <tr><td><dl><dt id="d7"></dt><dd  id="d8"></dd></dl></td></tr> -->
<!-- </table> -->
			<!-- 測試段結束------------------------------------------ -->
			</form>
		</div>

		<%@include file="../partial/memberCenter.jsp"%>
		<%@ include file="../partial/footer.jsp"%>
	</div>
</body>
<script>
	$(function() {
		
	
		$(".temporary").hide()

		$("#7-11").click(function() {
			$(".temporary").show("slow", function() {
				$('#eight').hide("slow",function(){
					
				})
			})
		})
		
		$('#eight').hide()
		$("#home").click(function() {
			$(".temporary").hide("slow", function() {
				$('#eight').show("slow",function(){
					
				})
			})
		})

//----------以下為按了會變色----------------------------------------------------
		$("input:radio").on('click',function(){
			
			$('input:radio:checked').parents('li').css("background-color", "#ffd2d2")
			$('input:radio:not(:checked)').parents('li').css("background-color", "")
		})
//----------以上為按了會變色----------------------------------------------------		
//----------以下為按了會自動填資料----------------------------------------------------
		$('.customcheckbox02').on('click',function(){
			var name=$('#mname').val()
			var mobile = $('#mobile').val()
			var email = $('#mail').val()
			 $('#mname1').val(name)
			 $('#mobile1').val(mobile)
			 $('#mail1').val(email)
		})	
//----------以上為按了會自動填資料------------------------------------------------
$('#b1').click(function(){
	 parent.history.back();
     return false;
						})

//--------以上為按了會回到上一頁----------------------------------------------
	$('.test').on('click',function(){
		$('#one').toggleClass('paragh1a');
		$('#two').toggleClass('paragh1a');
		$('#three').toggleClass('paragh1a');
		$('#four').toggleClass('paragh1b');
		$('#five').toggleClass('paragh1a');
		$('#six').toggleClass('paragh6a');
		$('#seven').toggleClass('paragh1a');
		
		
		$('#two').appendTo('#d2')
		$('#three').appendTo('#d3')
		$('#one').appendTo('#d4')
		$('#four').appendTo('#d5')
		$('#five').appendTo('#d6')
		$('#six').appendTo('#d7')
		$('#seven').appendTo('#d8')
		
	})
	

	}) //---------------到底啦----------------

	//將member center 的side bar預設改為收起

	// 	$(document).ready(function() {
	// 		//想法: 該區域radio被選取的會變色
	// 		$()
	// 	})
</script>
</html>
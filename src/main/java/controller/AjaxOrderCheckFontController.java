package controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.Period;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.dao.OrdersDaoHibernate;
import readshare.util.BinaryProcessor;

@Controller
public class AjaxOrderCheckFontController {
	
	@Autowired
	private OrdersDaoHibernate ODH;

	@Autowired
	private BinaryProcessor bp;
	
	@RequestMapping(path = {"/fontOrderCheck.controller"},method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String processGet(@RequestParam(name = "time") String time, @RequestParam(name = "category") String category, @RequestParam(name = "memid") Integer memid) throws ParseException {
		String flag = null;
		// 接收資料
		System.out.println("time= " + time + " category= " + category+" memid= " + memid);
		
		// 資料轉型
		LocalDateTime currentTime = LocalDateTime.now();
		Period period = Period.of(0, 3, 0);
		LocalDateTime ThreeMonth = currentTime.minus(period);
//		 System.out.println("ThreeMonth="+ThreeMonth);
		 SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");
			long time1 = simpledate.parse(ThreeMonth.toString()).getTime();
			Date dayStart1 = new Date(time1);
//			 System.out.println("dayStart1="+dayStart1); dayStart1是已經減去3個月的時間
			// -------------轉flag開始------------------------------
		if (category.equals("solid")) {
			flag = "a";
		} else if (category.equals("electric")) {
			flag = "b";
		} else if (category.equals("all")) {
			flag = "c";
		} // -------------轉flag結束------------------------------
		System.out.println("flag= "+flag);
//--------------------搜尋分流開始-----------------------------------
		List<Object[]> result =null;
		if(time.equals("three")) {
			result =ODH.selectFrontOrderCheckOrder(dayStart1, flag,memid);
		}else if(time.equals("longer")) {
			result =ODH.selectFrontOrderCheckOrderLonger(dayStart1, flag,memid);
		}else if(time.equals("unlimited")) {
			result =ODH.selectFrontOrderCheckOrderUnlimited(flag,memid);
		}
//--------------------搜尋分流結束-----------------------------------
//// 呼叫model +資料接收處理--------------------------------------
		
		LinkedList<Map<String, Object>> resultsList = new LinkedList<Map<String, Object>>();
		for (Object[] temp : result) {
			HashMap<String, Object> resultMap = new HashMap<String, Object>(); // 一定要new 新的，否則會被之前的取代掉，最後只輸出了一組data
			resultMap.put("bknamezh", (temp[0]));
			resultMap.put("prodimg", bp.BinaryToBase64((byte[]) temp[1]));
			resultMap.put("orderamount", (temp[2]));
			resultMap.put("shippingstate", (temp[3]));
			resultMap.put("orderdate", (temp[4]));
			resultMap.put("invoicenum", (temp[5]));
			resultsList.add(resultMap);
//			System.out.println("This is controller: " + temp[0]);
//			System.out.println(temp[1]);
//			System.out.println(temp[2]);
//			System.out.println(temp[3]);
//			System.out.println(temp[4]);
//			System.out.println("This is controller: " + temp[5]);
		}

		Gson gson = new Gson();
		return gson.toJson(resultsList);

	}
	
}

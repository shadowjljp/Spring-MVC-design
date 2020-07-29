package controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.dao.OrdersDaoHibernate;
import readshare.util.BinaryProcessor;

@Controller
public class BackOrderCheckController {

	@Autowired
	private OrdersDaoHibernate ODH;

	@Autowired
	private BinaryProcessor bp;

	@RequestMapping(path = {"/backOrderCheck_page.controller"},method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String processGet(@RequestParam(name = "dayStart") String dayStart,
			@RequestParam(name = "dayEnd") String dayEnd, @RequestParam(name = "category") String category,
			@RequestParam(name = "orderID") Integer orderID, @RequestParam(name = "memberPhone") String memberPhone)
			throws ParseException {
		String flag = null;

		// 接收資料
		System.out.println("dayStart= " + dayStart + " dayEnd= " + dayEnd + " category= " + category + " orderID= "
				+ orderID + " memberPhone= " + memberPhone);

		// 資料轉型
		Date dayStart1 = null;
		Date dayEnd1 = null;
		if ((!"".equals(dayStart)) && (!"".equals(dayEnd))) {
			SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");

			long time = simpledate.parse(dayStart).getTime();
			long time2 = simpledate.parse(dayEnd).getTime();
			dayStart1 = new Date(time);
			dayEnd1 = new Date(time2);

		} // -------------日期轉型結束-------------------------
			// -------------轉flag開始------------------------------
		if (category.equals("solid")) {
			flag = "a";
		} else if (category.equals("electric")) {
			flag = "b";
		} else if (category.equals("all")) {
			flag = "c";
		} // -------------轉flag結束------------------------------

		// -------------memberPhone轉member ID開始------------------------------
		List<Integer> MemberID = ODH.selectFromMemberPhoneToMemID(memberPhone);
		Integer memID = null;
		if (MemberID.size() != 0) {
			memID = MemberID.get(0);
		}

		System.out.println("member id =" + memID);
		// -------------memberPhone轉member ID結束------------------------------
		// 呼叫model
		List<Object[]> result = null;

		result = ODH.selectBackOrderCheckOrder(dayStart1, dayEnd1, flag, orderID, memID);
		LinkedList<Map<String, Object>> resultsList = new LinkedList<Map<String, Object>>();
		System.out.println("TEST is HERE controller");
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

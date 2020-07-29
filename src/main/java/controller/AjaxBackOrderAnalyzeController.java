package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import model.MemberBean;
import model.OrdersBean;
import model.dao.MemberDaoHibernate;
import model.dao.OrdersDaoHibernate;

@Controller
public class AjaxBackOrderAnalyzeController {
	@Autowired
	private OrdersDaoHibernate orderDao;
	@Autowired
	private OrdersBean orderbean;
	
	@Autowired
	private MemberDaoHibernate memberDao;
	@Autowired
	private MemberBean memberBean;
	
//	public static void main(String[] args) {
//		AjaxBackOrderAnalyze j = new AjaxBackOrderAnalyze();
//		String result = j.selectOrderMember();
//		
//		Gson gson = new GsonBuilder().setPrettyPrinting().create();
//		JsonParser jp = new JsonParser();
//		JsonElement je = jp.parse(result);
//		String prettyJsonString = gson.toJson(je);
//		
//		System.out.println(prettyJsonString);
//	}

	@RequestMapping(path= {"/backOrderAnalyzeSelectAll.controller"},method=RequestMethod.POST,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String selectOrderMember() {
		 List<Object[]> order = orderDao.selectOrderMember();
		//System.out.println("test="+orderDao.selectOrderMember());
	
		LinkedList<Map<String,Object>> resultsList = new LinkedList<Map<String,Object>>();
//		for(Object[] x:order) {
//			for(Object y: x) {
//				System.out.println(y);
//			}
//			System.out.println(x[0]);
//			System.out.println(x[1]);
//			System.out.println(x[2]);
//			System.out.println(x[3]);
//			System.out.println(x[4]);
//			System.out.println(x[5]);
//			System.out.println(x[6]);
//		}
		for(Object[] temp:order) {
			HashMap<String,Object> resultMap = new HashMap<String,Object>(); //一定要new 新的，否則會被之前的取代掉，最後只輸出了一組data
			resultMap.put("orderdate", (temp[0]));
			resultMap.put("paymenttype", temp[1]);
			resultMap.put("orderamount", (temp[2]));
			resultMap.put("memgen", (temp[3]));
			resultMap.put("membirth", (temp[4]));
			resultMap.put("memadd", (temp[5]));
			resultMap.put("orderstate", (temp[6]));
			resultsList.add(resultMap);
//			System.out.println(temp[0]);
//			System.out.println(temp[1]);
//			System.out.println(temp[2]);
//			System.out.println(temp[3]);
//			System.out.println(temp[4]);
//			System.out.println(temp[5]);
//			System.out.println(temp[6]);
		}
		
		
		Gson gson = new Gson();
		return gson.toJson(resultsList);
		
	}
}

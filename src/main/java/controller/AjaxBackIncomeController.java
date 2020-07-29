package controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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

import antlr.ParserSharedInputState;
import model.dao.AdvertisementDaoHibernate;
import model.dao.OrdersDaoHibernate;

@Controller
public class AjaxBackIncomeController {

	@Autowired
	private OrdersDaoHibernate ordersDao;
	
	@Autowired
	private AdvertisementDaoHibernate advertDao;

	//日期欄位選擇後帶入
	//銷售收入
	@RequestMapping(path = { "/backIncome.controller" }, method = RequestMethod.POST)
	@ResponseBody
	public String OrdersPost(@RequestParam(name = "orderdate") String newDate,
						  	 @RequestParam(name = "orderdate2") String newDate2) {
		//System.out.println("backIncome.controller開始~~~");
		//System.out.println("orderdate=" + newDate + "orderdate2=" + newDate2);

		SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");

		Date date = null;
		Date date2 = null;
		try {
			date = new java.sql.Date(simpledate.parse(newDate).getTime());
			date2 = new java.sql.Date(simpledate.parse(newDate2).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// System.out.println(ordersDao.selectOrderamount(date, date2));
		//銷售收入陣列
		List<Integer> IncomeTatol = ordersDao.selectOrderamount(date, date2);
		
		
		//銷售收入合計
		Integer sum = 0;
		for (Integer incomeTatol : IncomeTatol) {
//			System.out.println(incomeTatol);
			sum += incomeTatol;
		}
//		System.out.println(sum);	
//		Gson gson = new Gson();
		//System.out.println("backIncome.controller結束~~~");
		return sum.toString();
	}
	
	
	//銷售退回
	@RequestMapping(path = { "/backIncome1.controller" }, method = RequestMethod.POST)
	@ResponseBody
	public String OrdersPost1(@RequestParam(name = "orderdate") String newDate,
						  	 @RequestParam(name = "orderdate2") String newDate2) {

		System.out.println("orderdate=" + newDate + "orderdate2=" + newDate2);
		//System.out.println("backIncome1.controller開始~~~");
		SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");

		Date date = null;
		Date date2 = null;
		try {
			date = new java.sql.Date(simpledate.parse(newDate).getTime());
			date2 = new java.sql.Date(simpledate.parse(newDate2).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// System.out.println(ordersDao.selectOrderamount(date, date2));

		//銷售退回陣列
		List<Integer> SalesReturnTatol = ordersDao.selectOrderamountMinus(date, date2);
		
		
		
		//銷售退回合計
		Integer salesReturnSum = 0;
		for (Integer salesReturnTatol : SalesReturnTatol) {
//			System.out.println(salesReturnTatol);
			salesReturnSum += salesReturnTatol;
		}
		//System.out.println("backIncome1.controller結束~~~");
//		System.out.println(salesReturnSum);
		return salesReturnSum.toString();
	}
	
	
	//廣告收入
	@RequestMapping(path = { "/backIncomeAdvert.controller" }, method = RequestMethod.POST)
	@ResponseBody
	public String OrdersPostAdvert(@RequestParam(name = "launchtime1") String newDate,
						  	       @RequestParam(name = "launchtime2") String newDate2){
		//System.out.println("backIncomeAdvert.controller開始~~~");
		System.out.println("launchtime1=" + newDate + "launchtime2=" + newDate2);

		SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");

		Date date = null;
		Date date2 = null;
		try {
			date = new java.sql.Date(simpledate.parse(newDate).getTime());
			date2 = new java.sql.Date(simpledate.parse(newDate2).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<Integer> advertRevTatol = advertDao.selectAdrevenue(date,date2);
		
		//廣告收入合計
		Integer advertSum = 0;
		for (Integer AdvertRevTatol : advertRevTatol) {
			System.out.println(AdvertRevTatol);
			advertSum += AdvertRevTatol;
		}
		System.out.println(advertSum);	
		
		//System.out.println("backIncomeAdvert.controller結束~~~");
		return advertSum.toString();

			
		}
	
	
	//首頁圖表 今年
	@RequestMapping(path = { "/backIncomeFirst.controller" }, method = RequestMethod.POST,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String OrdersPost4() throws ParseException {
		//System.out.println("backIncomeFirst.controller開始~~~");
		Calendar cal = Calendar.getInstance();
	    int Year = cal.get(Calendar.YEAR);
	    
	    String currentYear0101 = Year+"-01-01";
	    String currentYear1231 = Year+"-12-31";
	    
	    SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");

	    long time1 = simpledate.parse(currentYear0101).getTime();
		long time2 = simpledate.parse(currentYear1231).getTime();
		Date startTime = new Date(time1);
		Date endTime = new Date(time2);


		Map<String, Integer> MonthlyIncome = ordersDao.selectOrderAmountYears(startTime, endTime);
		
		
		
			
		
//		System.out.println("result="+MonthlyIncome.toString());
		

//		SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");
//
//		Date date = null;
//		Date date2 = null;
//		try {
//			date = new java.sql.Date(simpledate.parse(newDate).getTime());
//			date2 = new java.sql.Date(simpledate.parse(newDate2).getTime());
//		} catch (ParseException e) {
//
//			e.printStackTrace();
//		}
		// System.out.println(ordersDao.selectOrderamount(date, date2));
		//銷售收入陣列
//		Map<String, Integer>  IncomeEveryMonth = ordersDao.selectOrderAmountYears(date, date2);
		
//		System.out.println();
		//銷售收入合計
		//Integer sum = 0;
//		for (Integer IncomeEveryMonth : IncomeEveryMonth) {
//			System.out.println(incomeTatol);
//			sum += incomeTatol;
//		}
//		System.out.println(sum);	
		//System.out.println("backIncomeFirst.controller結束~~~");
		Gson gson = new Gson();
		return gson.toJson(MonthlyIncome);
	}
	
	
	//首頁圖表 去年
	@RequestMapping(path = { "/backIncomeFirstLastY.controller" }, method = RequestMethod.POST,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String OrdersPost5() throws ParseException {
		//System.out.println("backIncomeFirstLastY.controller開始~~~");
		Calendar cal = Calendar.getInstance();
	    int Year = cal.get(Calendar.YEAR);
	    
	    int year1 = Year-1;
	    
	    String currentYear0101 = year1+"-01-01";
	    String currentYear1231 = year1+"-12-31";
	    
	    //System.out.println(currentYear0101.toString());
	    
	    SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");

	    long time1 = simpledate.parse(currentYear0101).getTime();
		long time2 = simpledate.parse(currentYear1231).getTime();
		Date startTime = new Date(time1);
		Date endTime = new Date(time2);


		Map<String, Integer> MonthlyIncome = ordersDao.selectOrderAmountYears(startTime, endTime);
		
		//System.out.println("backIncomeFirstLastY.controller開始~~~");
		Gson gson = new Gson();
		return gson.toJson(MonthlyIncome);
	}
	
	
	//首頁圖表 前年
	@RequestMapping(path = { "/backIncomeFirstbeforeY.controller" }, method = RequestMethod.POST,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String OrdersPost6() throws ParseException {
		//System.out.println("backIncomeFirstbeforeY.controller開始~~~");
		Calendar cal = Calendar.getInstance();
	    int Year = cal.get(Calendar.YEAR);
	    
	    int year1 = Year-2;
	    
	    String currentYear0101 = year1+"-01-01";
	    String currentYear1231 = year1+"-12-31";
	    
	    System.out.println(currentYear0101.toString());
	    
	    SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");

	    long time1 = simpledate.parse(currentYear0101).getTime();
		long time2 = simpledate.parse(currentYear1231).getTime();
		Date startTime = new Date(time1);
		Date endTime = new Date(time2);


		Map<String, Integer> MonthlyIncome = ordersDao.selectOrderAmountYears(startTime, endTime);
		
		//System.out.println("backIncomeFirstbeforeY.controller結束~~~");
		Gson gson = new Gson();
		return gson.toJson(MonthlyIncome);
	}
	
}

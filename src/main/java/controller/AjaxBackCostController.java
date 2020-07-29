package controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.dao.OrdersDaoHibernate;

@Controller
public class AjaxBackCostController {


	@Autowired
	private OrdersDaoHibernate ordersDao;
	
	///成本合計
	@RequestMapping(path = {"/backCost.controller"  }, method = RequestMethod.POST)
	@ResponseBody
	public String costPost(@RequestParam(name = "orderdate3") String newDate, 
							 @RequestParam(name = "orderdate4") String newDate2){
							
		SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-mm-dd"); 
		
		Date date = null;
		Date date2 = null;
		try {
			date = new java.sql.Date(simpledate.parse(newDate).getTime());
			date2 = new java.sql.Date(simpledate.parse(newDate2).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(date+" date2= "+date2);
		List<Integer> CostTatol = ordersDao.selectCost(date, date2);
		Integer cost = 0;
		System.out.println("CostTatol.get="+CostTatol.get(0));
		for (Integer costTatop : CostTatol) {
			System.out.println("costTatol="+costTatop);
			cost += costTatop;
			
		}
		System.out.println("cost="+cost);
		return cost.toString();
	}
		
}

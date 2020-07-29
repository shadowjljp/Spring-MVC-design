package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.LogisticsBean;
import model.dao.LogisticDAOHibernate;

@Controller
public class AjaxBackLogisticsAnalyze {

	@Autowired
	private LogisticDAOHibernate logistics;

	@Autowired
	private LogisticsBean bean;

	@RequestMapping(path = { "/backLogistics.controller" }, method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String processPost(@RequestParam(name = "compname") String compname) {
		// System.out.println("compname="+compname);

		bean.setCompname(compname);
		List<LogisticsBean> logistic = logistics.select(bean);
		System.out.println(logistics.select(bean));

		Gson gson = new Gson();
		return gson.toJson(logistic);
	}
	
	@RequestMapping(path = { "/logisticSelectAll.controller" }, method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String processPost() {	
		
		List<LogisticsBean> logistic = logistics.selectAll();
		System.out.println(logistics.selectAll());

		Gson gson = new Gson();
		return gson.toJson(logistic);
	}
}

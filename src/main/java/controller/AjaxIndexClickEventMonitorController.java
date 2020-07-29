package controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.AdanalysisBean;
import model.MessageBean;
import model.dao.AdanalysisDaoHibernate;

@Controller
public class AjaxIndexClickEventMonitorController {

	@Autowired
	private AdanalysisDaoHibernate AdanalysisDao;

	@Autowired
	private AdanalysisBean bean;

	@RequestMapping(path = { "/indexClickEventMonitor.controller" }, method = RequestMethod.POST)
	@ResponseBody
	public void processPost(@RequestParam(name = "bsx") Double bsx, @RequestParam(name = "bsy") Double bsy,
			@RequestParam(name = "page") String page) {

		System.out.println("bsx=" + bsx + ",bsy=" + bsy);

		bean.setAdclickx(bsx);
		bean.setAdclicky(bsy);
		bean.setPage(page);
		
		AdanalysisDao.insertCordinateWhileClick(bean);
		System.out.println("AdanalysisDao.insertCordinateWhileClick(bean)");

	}

	@RequestMapping(path = { "/clicks.controller" }, method = RequestMethod.POST)
	@ResponseBody
	public String getClicks(@RequestParam(name = "beginTime") String beginTime,
			@RequestParam(name = "endTime") String endTime) throws ParseException {

		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);// "Sep 11, 2018

		Date date1 = new java.sql.Date(date.parse(beginTime).getTime());
		Date date2 = new java.sql.Date(date.parse(endTime).getTime());

		List<AdanalysisBean> beans = AdanalysisDao.selectcCordinateByTime(date1, date2);

		String jsonBean = new Gson().toJson(beans);
		System.out.println(jsonBean);

		return jsonBean;
	}

	@RequestMapping(path = {"/getBookWhileDocLoaded.controller"}, method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getBookWhileDocLoaded() {
		
		System.out.println(123);
		return "";
	}

}

package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.MemberBean;
import model.MemberProjectBean;
import model.ProjectBean;
import model.dao.MemberDaoHibernate;
import model.dao.MemberProjectDaoHibernate;
import model.dao.ProjectDaoHibernate;

@Controller
@SessionAttributes(names= {"bean"})
public class SelectProjHomeController {

	@Autowired
	private ProjectDaoHibernate projectDao;

	@Autowired
	private MemberProjectDaoHibernate memberProjectDao;

	@Autowired
	private MemberBean membean;

	@Autowired
	private MemberDaoHibernate memberDao;

	@RequestMapping(path = {
			"/selectprojhome.controller" }, method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String processGet(@RequestParam(name = "id") Integer id, Model model) {
		// 以id來搜尋專案
		ProjectBean projectBeans = projectDao.selectAllById(id);

		membean.setId(projectBeans.getMemid());

		// 將memid做搜尋條件,找到會員姓名
		String mambername = memberDao.selectById(membean);

		Map<String, Object> attributes = new HashMap<String, Object>();

		// 存入model
		attributes.put("projname", projectBeans.getProjname());
		attributes.put("projytube", projectBeans.getProjytube());
		attributes.put("projbdg", projectBeans.getProjbdg());
		// 目前價錢...............
		Integer totalmoney = memberProjectDao.sponsormoneySum(id);
		attributes.put("totalmoney", totalmoney);
		// ........................
		// .......剩下天數.........
		long endDate = projectBeans.getProjendt().getTime();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		long date = new Date().getTime();
		dateFormat.format(date);
		long dayleft = (endDate - date) / 86400000;
		attributes.put("projendt", dayleft);
		// .......................
		//.......計算完成度........
		Integer bdg = projectBeans.getProjbdg();
		Integer sponsormoneySum = memberProjectDao.sponsormoneySum(id);
		Double doubleAnswer = (((double) sponsormoneySum / (double) bdg) * 100);
		String persent = (doubleAnswer+"0000").toString();
		String answer = persent.substring(0, 4);
		attributes.put("answer", answer);
		//........................
		//.......計算多少人贊助...........
		Integer totalProjPay=memberProjectDao.totalPayMoney(id);
		attributes.put("totalProjPay", totalProjPay);
		//...............................
		attributes.put("projcontent", projectBeans.getProjcontent());
		attributes.put("projplan1price", projectBeans.getProjplan1price());
		attributes.put("projplan1", projectBeans.getProjplan1());
		attributes.put("projplan1num", projectBeans.getProjplan1num());
		attributes.put("projplan2price", projectBeans.getProjplan2price());
		attributes.put("projplan2", projectBeans.getProjplan2());
		attributes.put("projplan2num", projectBeans.getProjplan2num());
		attributes.put("projplan3price", projectBeans.getProjplan3price());
		attributes.put("projplan3", projectBeans.getProjplan3());
		attributes.put("projplan3num", projectBeans.getProjplan3num());

//		Map<String, Object> danny = attributes;
		
		model.addAttribute("bean", attributes);
		return "selectprojhomecontroller";
	}

}

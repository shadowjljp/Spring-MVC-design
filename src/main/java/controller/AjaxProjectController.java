package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.ProjectBean;
import model.dao.MemberProjectDaoHibernate;
import model.dao.ProjectDaoHibernate;
import readshare.util.BinaryProcessor;

@Controller
public class AjaxProjectController {

	@Autowired
	private BinaryProcessor bp;

	@Autowired
	private ProjectDaoHibernate projectDao;

	@Autowired
	private MemberProjectDaoHibernate memberProjectDao;

	@Autowired
	private List<ProjectBean> projbean;

	@RequestMapping(path = {
			"/ajaxproject.controller" }, method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String projectPost(@RequestParam(name = "projstatus") String projstatus,
			@RequestParam(name = "x") Integer x) {
		int count = projectDao.selectForProjCount();
		// ...............................................

		Integer projectid = null;
		ArrayList<HashMap> arrayList = new ArrayList<HashMap>();
		List<ProjectBean> returns = projectDao.selectForProjHome(projstatus, x);
		for (ProjectBean getPK : returns) {
			HashMap<String, Object> oneProjMap = new HashMap<String, Object>();
			projectid = getPK.getId();
			oneProjMap.put("id", projectid);
			Integer bdg = getPK.getProjbdg();
			// ............專案完成度計算.............
			Integer sponsormoneySum = memberProjectDao.sponsormoneySum(projectid);
			Double doubleAnswer = (((double) sponsormoneySum / (double) bdg) * 100);
			oneProjMap.put("answer", doubleAnswer);
			// ......................................
			// .............計算剩餘天數...............
			long endDate = getPK.getProjendt().getTime();
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			long date = new Date().getTime();
			dateFormat.format(date);
			long dayleft = (endDate-date)/86400000;
//			System.out.println("dayleft= "+dayleft);
			oneProjMap.put("projendt", dayleft);
			// .......................................

			oneProjMap.put("projimg", bp.BinaryToBase64(getPK.getProjimg()));
			oneProjMap.put("projname", getPK.getProjname());
			oneProjMap.put("projcontent", getPK.getProjcontent());
			oneProjMap.put("projbdg", getPK.getProjbdg());
			arrayList.add(oneProjMap);

		}

		Gson gson = new Gson();
		return gson.toJson(arrayList);

	}
}

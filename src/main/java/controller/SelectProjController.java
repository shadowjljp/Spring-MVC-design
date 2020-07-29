package controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import model.MemberBean;
import model.ProductBean;
import model.ProjectBean;
import model.dao.MemberDaoHibernate;
import model.dao.ProjectDaoHibernate;

@Controller
public class SelectProjController {

	@Autowired
	private ProjectDaoHibernate projectDao;
	
	@Autowired
	private ProjectDaoHibernate projectdao;

	@Autowired
	private MemberBean membean;

	@Autowired
	private MemberDaoHibernate memberdao;

	@Autowired
	private readshare.util.BinaryProcessor trans;
	
	@RequestMapping(path = {
			"/selectproj.controller" }, method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String processPost(@RequestParam(name = "id") Integer id, Model model) {
		// 以id搜尋專案資料
		ProjectBean projbean2 = projectDao.selectAllById(id);
		
		membean.setId(projbean2.getMemid());

		// 將memid做搜尋條件，找到會員姓名
		String mambername = memberdao.selectById(membean);
		
		Map<String, Object> attributes = new HashMap<String, Object>();

		// 存入model
		attributes.put("id", projbean2.getId());
		attributes.put("memname", mambername);
		attributes.put("projt", projbean2.getProjt());
		attributes.put("startt", projbean2.getProjstartt());
		attributes.put("endt", projbean2.getProjendt());
		attributes.put("content", projbean2.getProjcontent());
		attributes.put("projname", projbean2.getProjname());
		attributes.put("bdg", projbean2.getProjbdg());
		attributes.put("plan1", projbean2.getProjplan1());
		attributes.put("plan1price", projbean2.getProjplan1price());
		attributes.put("plan1num", projbean2.getProjplan1num());
		attributes.put("plan2", projbean2.getProjplan2());
		attributes.put("plan2price", projbean2.getProjplan2price());
		attributes.put("plan2num", projbean2.getProjplan2num());
		attributes.put("plan3", projbean2.getProjplan3());
		attributes.put("plan3price", projbean2.getProjplan3price());
		attributes.put("plan3num", projbean2.getProjplan3num());
		attributes.put("youtube", projbean2.getProjytube());
		attributes.put("status", projbean2.getProjstatus());
		attributes.put("img", trans.BinaryToBase64(projbean2.getProjimg()));
//		String img=trans.BinaryToBase64(projbean2.getProjimg());
//		attributes.put("img", img);
//		
		
		model.addAttribute("t",attributes);
		return "backprojedit";
	}
	
	@RequestMapping(path = {"/changeprojstatus.controller" }, method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
public String changeProjStatus(@RequestParam(name = "id") Integer id) {
		System.out.println("controller Start，id = " + id);
		projectdao.updateStatus(id);
		System.out.println("controller End");

		return "projstatuschangesuccess";
	}
}

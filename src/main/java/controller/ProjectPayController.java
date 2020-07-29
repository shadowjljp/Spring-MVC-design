package controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.MemberBean;
import model.ProjectBean;
import model.dao.MemberProjectDaoHibernate;
import model.dao.ProjectDaoHibernate;

@Controller
@SessionAttributes(names= {"money1","money2","money3"})
public class ProjectPayController {

	@Autowired
	private ProjectDaoHibernate projectDao;
	
	@Autowired
	private MemberProjectDaoHibernate memberProjectDao;

	@Autowired
	private MemberBean membean;
	
	@Autowired
	private ProjectBean projbean;
	
	@RequestMapping(path= {"projectpay.controller"},method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	public String processGet(@SessionAttribute(name="bean") Map<String, Object> projmap,Model model) {
		
		Integer price1=((Integer)projmap.get("projplan1price"));
		Integer price2=((Integer)projmap.get("projplan2price"));
		Integer price3=((Integer)projmap.get("projplan3price"));
		
//		Integer price1 = Integer.parseInt(projmap.get(projbean.getProjplan1price()).toString());
//		Integer price2 = projmap.getProjplan2price();
//		Integer price3 = projmap.getProjplan3price();
		
		System.out.println("price1="+price1);
		System.out.println("price2="+price2);
		System.out.println("price3="+price3);
		
		model.addAttribute("money1",price1);
		model.addAttribute("money2",price2);
		model.addAttribute("money3",price3);
		
		return "projectpaycontroller";
	}
	
}

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

import model.ProductBean;
import model.dao.ProductDaoHibernate;

@Controller
public class BackProdEditController {

	@Autowired
	private ProductDaoHibernate productDao;
	
	@Autowired
	private ProductBean productbean;

	@Autowired
	private readshare.util.BinaryProcessor trans;
	
	@RequestMapping(path = {
			"/updateprod.controller" }, method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String processPost(@RequestParam(name = "id") Integer id, Model model) {
		// 以id搜尋專案資料
		Object[] prodbean = productDao.selectBookByIdCross2Beans(id);

		
		
//		Map<String, Object> attributes = new HashMap<String, Object>();
//
//		// 存入model
//		attributes.put("id", projbean2.getId());
//		attributes.put("memname", mambername);
//		attributes.put("projt", projbean2.getProjt());
//		attributes.put("startt", projbean2.getProjstartt());
//		attributes.put("endt", projbean2.getProjendt());
//		attributes.put("content", projbean2.getProjcontent());
//		attributes.put("projname", projbean2.getProjname());
//		attributes.put("bdg", projbean2.getProjbdg());
//		attributes.put("plan1", projbean2.getProjplan1());
//		attributes.put("plan1price", projbean2.getProjplan1price());
//		attributes.put("plan1num", projbean2.getProjplan1num());
//		attributes.put("plan2", projbean2.getProjplan2());
//		attributes.put("plan2price", projbean2.getProjplan2price());
//		attributes.put("plan2num", projbean2.getProjplan2num());
//		attributes.put("plan3", projbean2.getProjplan3());
//		attributes.put("plan3price", projbean2.getProjplan3price());
//		attributes.put("plan3num", projbean2.getProjplan3num());
//		attributes.put("youtube", projbean2.getProjytube());
//		attributes.put("status", projbean2.getProjstatus());
//		attributes.put("img", trans.BinaryToBase64(projbean2.getProjimg()));
////		String img=trans.BinaryToBase64(projbean2.getProjimg());
////		attributes.put("img", img);
////		
		
//		model.addAttribute("b",attributes);
		return "updateprod";
	}
	
}

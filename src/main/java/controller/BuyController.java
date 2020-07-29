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
import org.springframework.web.bind.annotation.SessionAttributes;

import model.dao.ProductDaoHibernate;
import readshare.util.BinaryProcessor;

@Controller
@SessionAttributes(names= {"book"})
public class BuyController {
	
	@Autowired
	private ProductDaoHibernate pdh;
	@Autowired
	private BinaryProcessor bp;

	@RequestMapping(path = { "/buy.controller" }, method = RequestMethod.GET,produces= "text/html;charset=UTF-8")
	public String processPost(@RequestParam(name = "id") Integer id, @RequestParam(name = "status") String status,
			@RequestParam(name = "prodprice") Integer prodprice, Model model) {
		Map<String, Object> attributes = new HashMap<String, Object>();

//		double prodeprice = (prodprice*proddisc);
		attributes.put("id", id);
		if(status.equals("a")) {
			attributes.put("status", "紙本書");
		}else if(status.equals("b")) {
			attributes.put("status", "電子書");
		}
		
		attributes.put("prodprice", prodprice);
//		attributes.put("prodeprice", prodeprice);
		
//-----------以下為進資料庫查詢的資訊---------------
		//prodstock  prodimg   bknamezh
		List<Object[]> temp = pdh.selectShoppingCart(id);
		for(Object[] a:temp) {
			if((int)a[0]>0) {
				attributes.put("prodstock","有");
			}else {
				attributes.put("prodstock","無");
			}
			
			attributes.put("prodimg",bp.BinaryToBase64((byte[])a[1]));
			attributes.put("bknamezh",a[2]);
			System.out.println("Controller prodstock= "+a[0]);
		}
	
		
//-------------以下為整理+整合資訊-----------------		
		model.addAttribute("book", attributes);
		return "buycontroller";

	}

}

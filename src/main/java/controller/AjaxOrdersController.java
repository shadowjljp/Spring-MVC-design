package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AjaxOrdersController {

	@RequestMapping(path = { "/orders.controller"},method=RequestMethod.GET)
	public void OrdersPost() {
		
		System.out.println("1233211234567");
		
		
		
		
	}
	
	
}

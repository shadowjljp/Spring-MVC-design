package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AjaxFnAlertController {

	@RequestMapping(path = { "/fnAlert.controller"},method=RequestMethod.GET)
	public void OrdersPost() {
		
		System.out.println("AAAAAAAAAA");
		
		
		
		
	}
}

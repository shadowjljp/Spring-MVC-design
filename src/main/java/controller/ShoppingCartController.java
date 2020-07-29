package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes(names= {"productPrice","BusinessTax","productNumber"})
public class ShoppingCartController {
	
	@RequestMapping(path= {"/shoppingCart_transit.controller"},method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	public String processForm(@RequestParam(name="productPrice") Integer price,@RequestParam(name="b_amount1" ) String number,Model model) {
		Integer businessPrice = (int) (price*0.05);
		
		model.addAttribute("productPrice",price);
		model.addAttribute("BusinessTax",businessPrice);
		model.addAttribute("productNumber",number);
		return "Checkout";
		
		
	}
}

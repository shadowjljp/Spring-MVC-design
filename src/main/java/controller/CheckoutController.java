package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.MemberBean;
import model.OrdersBean;
import model.ProductBean;
import model.dao.OrdersDaoHibernate;
import model.dao.ProductDaoHibernate;

@Controller
@SessionAttributes(names= {"receiverName","shipping","payment","memberName","memberMobile","receiverMobile","invoice"})
public class CheckoutController {
	@Autowired
	OrdersDaoHibernate ODH;
	
	@Autowired
	OrdersBean bean;
	
	@Autowired
	MemberBean membean;
	
	@Autowired
	ProductDaoHibernate pdh;
	
	@RequestMapping(path= {"/checkout.controller"},method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	public String processPost(@RequestParam(name="shipping") String shipping,@RequestParam(name="payment") String payment,
			@RequestParam(name="coupon") String coupon,@RequestParam(name="member_name") String memberName,
			@RequestParam(name="member_mobile") String memberMobile, @RequestParam(name="member_email") String memberEmail, @RequestParam(name="receiver_name") String receiverName,
			@RequestParam(name="receiver_mobile") String receiverMobile,@RequestParam(name="receiver_email") String receiverEmail,
			@RequestParam(name="invoice") String invoice , @RequestParam(name="ddlRoadStreet") String RoadStreet , @RequestParam(name="ddlZipCode") String ZipCode,
			@RequestParam(name="ddlCity") String City , @RequestParam(name="ddlSS") String lSS , @RequestParam(name="txtLL") String txtLL ,@RequestParam(name="txtAA") String txtAA,
			@RequestParam(name="txtNN") String txtNN, @RequestParam(name="txtEE") String txtEE, @RequestParam(name="txtFF") String txtFF, @RequestParam(name="txtDD") String txtDD , @RequestParam(name="txtRR") String txtRR,Model model){
		
		System.out.println("This is controller");
		System.out.println("shipping= "+shipping+" payment= "+payment+" coupon= "+coupon+" memberName= "+memberName+" memberMobile= "
		+memberMobile+" memberEmail= "+memberEmail+" receiverName= "+receiverName+" invoice= "+invoice+" RoadStreet= "+RoadStreet+" ZipCode= "+ZipCode
		+" City= "+City+" lSS= "+lSS+" txtLL= "+txtLL+" txtAA "+txtAA+" txtNN = "+txtNN+" txtEE= "+txtEE+" txtFF= "+txtFF+" txtDD= "+txtDD+" txtRR= "+txtRR);
//----------------------------------------		
		model.addAttribute("shipping", shipping);model.addAttribute("coupon", coupon);
		model.addAttribute("payment", payment);model.addAttribute("memberName", memberName);
		model.addAttribute("memberMobile", memberMobile);model.addAttribute("memberEmail", memberEmail);
		model.addAttribute("receiverName", receiverName);model.addAttribute("receiverMobile", receiverMobile);model.addAttribute("receiverEmail", receiverEmail);
	
		model.addAttribute("RoadStreet", RoadStreet);model.addAttribute("ZipCode", ZipCode);model.addAttribute("invoice", invoice);
		model.addAttribute("City", City);	model.addAttribute("lSS", lSS);
		model.addAttribute("txtLL", txtLL);	model.addAttribute("txtAA", txtAA);
		model.addAttribute("txtNN", txtNN);	model.addAttribute("txtEE", txtEE);
	model.addAttribute("txtFF", txtFF);	model.addAttribute("txtDD", txtDD);model.addAttribute("txtRR", txtRR);
			
		//---------------------------------------------------------------------------
//		HashMap<String,String> info = new HashMap<>();
//		info.put("shipping", shipping);info.put("coupon", coupon);info.put("payment", payment);info.put("memberName", memberName);info.put("memberMobile", memberMobile);
//		info.put("memberEmail", memberEmail);info.put("receiverName", receiverName);info.put("receiverMobile", receiverMobile);info.put("receiverEmail", receiverEmail);info.put("RoadStreet", RoadStreet);
//		info.put("ZipCode", ZipCode);info.put("invoice", invoice);info.put("City", City);info.put("lSS", lSS);info.put("txtLL", txtLL);
//		info.put("txtAA", txtAA);info.put("txtNN", txtNN);info.put("txtEE", txtEE);info.put("txtFF", txtFF);info.put("txtDD", txtDD);
//		info.put("txtRR", txtRR);
//		model.addAttribute("target",info);

		
	
		//--------------------
		return "finishOrder";
		
	}
	

	@RequestMapping(path= {"/finish.controller"},method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	public String finishOrder(@RequestParam(name="hiddenAddress") String temp ,@SessionAttribute(name="receiverName") String receiverName,@SessionAttribute(name="shipping") String shipping,
			@SessionAttribute(name="payment") String payment,@SessionAttribute(name="memberName") String memberName,@SessionAttribute(name="memberMobile") String memberMobile,
			@SessionAttribute(name="receiverMobile") String receiverMobile,@SessionAttribute(name="invoice") String invoice,@SessionAttribute(name="productPrice") Integer productPrice,@SessionAttribute(name="BusinessTax") Integer BusinessTax,HttpSession session 
		,@SessionAttribute(name="book")  HashMap<String, Object> productMap,Model model) throws ParseException {
		String address= temp.replaceAll("[\n\r|\n|\\s]", "");
		
		System.out.println("address= "+address);
		System.out.println("shipping= "+shipping+" payment= "+payment+" memberName= "+memberName+" memberMobile= "
				+memberMobile+" receiverName= "+receiverName+" receiverMobile= "+receiverMobile+" invoice= "+invoice);
		bean.setReceiveradd(address);
		bean.setPaymenttype(payment);
		bean.setBuyername(memberName);
		bean.setBuyerphone(memberMobile);
		bean.setReceivername(receiverName);
		bean.setReceiverphone(receiverMobile);
		bean.setInvoicename(invoice);
	//	bean.setOrderamount(orderamount);
		//--------------以下為後台幫塞的資料--------------------
		ZonedDateTime now = ZonedDateTime.now();
		SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");
		Long time1=simpledate.parse(now.toString()).getTime();
		Date currentTime = new Date(time1);
		bean.setOrderdate(currentTime);
		
		bean.setOrderstate("訂單處理中");
		bean.setShippingstate("出貨準備中");
		
		int a=(int)((Math.random())*10000000);
		bean.setInvoicenum(a);
		
		 String stringValue = Integer.toString(a);
		 
		 int rnd = (int) (Math.random() * 52); // or use Random or whatever
		    char base = (rnd < 26) ? 'A' : 'a';
		     char zz = (char) (base + rnd % 26);
		     
		     int rnd1 = (int) (Math.random() * 52); // or use Random or whatever
			    char base1 = (rnd1 < 26) ? 'A' : 'a';
			   
			     char zz1=(char) (base1 + rnd1 % 26);
		 
		 String orderticket = zz+""+zz1+stringValue;
		 
		bean.setOrderticket(orderticket);
		
		bean.setInvoicename(memberName);
		bean.setBusinesstax(BusinessTax);
		bean.setOrderamount(productPrice);
//--------處理order 訂單的cost成本-----------
		String number=(String) session.getAttribute("productNumber");
		Integer number1 = Integer.parseInt(number);
		Integer id=(Integer) productMap.get("id");
		List<Double> productCost = pdh.selectProductCostById(id);
		Double productCost1=productCost.get(0);
		Integer cost= (int) (number1*productCost1);
		
		bean.setCost(cost);
		
//----------以下為處理member id-----------		
		MemberBean membean = (MemberBean) session.getAttribute("user");
		
		try {
			if(membean.getId()!=null) {
				Integer memberId = membean.getId();
				bean.setMemid(memberId);
				System.out.println("member id=  "+memberId);
			}
		} catch (Exception e) {
			System.out.println("member id is null !! so a guest is coming! ");
			e.printStackTrace();
		}finally{
	
		
		//-----------------以上為後台幫塞的資料-------------------
		int count=ODH.insert(bean);
		System.out.println("成功更新次數:  "+count);
		
		return "orderJumpToIndex";
	}
	}
	
	//----------------以下用map也可以--------------------------
//	public void finishOrder(@SessionAttribute(name="target") HashMap newinfo,Model model) {
//		
//		System.out.println("newinfo= "+newinfo.get("receiverName"));
//		
//	}

}

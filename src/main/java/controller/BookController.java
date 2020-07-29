package controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import model.AuthorBean;
import model.ProductBean;
import model.dao.ProductDaoHibernate;

@Controller
public class BookController {

	@Autowired
	private ProductDaoHibernate productDao;

	@Autowired
	private ProductBean bean;
	
	@Autowired
	private readshare.util.BinaryProcessor trans;

	@RequestMapping(path = { "/book.controller" }, method = RequestMethod.GET)
	public String processPost(@RequestParam(name = "id") Integer id, Model model) {
		
//		System.out.println("-------進入Controller, ID = " + id);

		Object[] beans = productDao.selectBookByIdCross2Beans(id);
		
//		String a = ((ProductBean) beans[0]).getBknamezh();
//		System.out.println("--------NAME = " + a);

		HashMap<String, Object> attributes = new HashMap<String, Object>();
		
		Integer bookprice = ((ProductBean) beans[0]).getProdprice();
		Double bookdisc = ((ProductBean) beans[0]).getProddisc();
		double epubprice = bookprice*bookdisc;
	
		attributes.put("id", ((ProductBean) beans[0]).getId());
		attributes.put("bknamezh", ((ProductBean) beans[0]).getBknamezh());
		attributes.put("bknameen", ((ProductBean) beans[0]).getBknameen());
		attributes.put("authornameen", ((AuthorBean) beans[1]).getAuthornameen());
		attributes.put("authorid", ((ProductBean) beans[0]).getAuthorid());
		attributes.put("transid", ((ProductBean) beans[0]).getTransid());
		attributes.put("bklang", ((ProductBean) beans[0]).getBklang());
		attributes.put("bkpublisher", ((ProductBean) beans[0]).getBkpublisher());
		attributes.put("bkpubdate", ((ProductBean) beans[0]).getBkpubdate());
		attributes.put("flag", ((ProductBean) beans[0]).getFlag());
		attributes.put("prodstock", ((ProductBean) beans[0]).getProdstock());
		attributes.put("prodcost", ((ProductBean) beans[0]).getProdcost());
		attributes.put("prodprice", bookprice);
		attributes.put("proddisc", bookdisc);
		attributes.put("epubprice", epubprice);
		attributes.put("bkisbn", ((ProductBean) beans[0]).getBkisbn());
		attributes.put("bkseries", ((ProductBean) beans[0]).getBkseries());
		attributes.put("bkpage", ((ProductBean) beans[0]).getBkpage());
		attributes.put("bkver", ((ProductBean) beans[0]).getBkver());
		attributes.put("bksize", ((ProductBean) beans[0]).getBksize());
		attributes.put("bkwgt", ((ProductBean) beans[0]).getBkwgt());
		attributes.put("bkimg", trans.BinaryToBase64(((ProductBean) beans[0]).getProdimg()));
		attributes.put("bkskin", ((ProductBean) beans[0]).getBkskin());
		attributes.put("bkmenu", ((ProductBean) beans[0]).getBkmenu());
		attributes.put("bkintro", ((ProductBean) beans[0]).getBkintro());
		attributes.put("bkefile", ((ProductBean) beans[0]).getBkefile());
		attributes.put("authorintro", ((ProductBean) beans[0]).getAuthorintro());
		attributes.put("translintro", ((ProductBean) beans[0]).getTranslintro());
		attributes.put("classid", ((ProductBean) beans[0]).getClassid());
		attributes.put("bkstar", ((ProductBean) beans[0]).getBkstar());
		attributes.put("showorder", ((ProductBean) beans[0]).getShoworder());
		
		model.addAttribute("book", attributes);
		
//		System.out.println("---------結束Controller, NAME = " + a);
		
		return "bookcontroller";
	}

}

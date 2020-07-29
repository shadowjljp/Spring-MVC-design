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

import model.AuthorBean;
import model.ProductBean;
import model.dao.ProductDaoHibernate;

@Controller
public class ProdSearchToEditController {

	@Autowired
	private ProductDaoHibernate productDao;

	// @Autowired
	// private ProductBean productbean;
	//
	// @Autowired
	// private AuthorBean authorbean;

	@Autowired
	private readshare.util.BinaryProcessor trans;

	@RequestMapping(path = {
			"/selectprod.controller" }, method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String processPost(@RequestParam(name = "id") Integer id, Model model) {
		// 以id搜尋專案資料
		Object[] prodbean = productDao.selectBookByIdCross2Beans(id);

		HashMap<String, Object> attributes = new HashMap<String, Object>();
		Integer bookprice = ((ProductBean) prodbean[0]).getProdprice();
		Double bookdisc = ((ProductBean) prodbean[0]).getProddisc();
		double epubprice = bookprice*bookdisc;

		attributes.put("id", ((ProductBean) prodbean[0]).getId());
		attributes.put("bknamezh", ((ProductBean) prodbean[0]).getBknamezh());
		attributes.put("bknameen", ((ProductBean) prodbean[0]).getBknameen());
		attributes.put("authornameen", ((AuthorBean) prodbean[1]).getAuthornameen());
//		attributes.put("transnameen", ((AuthorBean) prodbean[1]).gettra);
		attributes.put("authorid", ((ProductBean) prodbean[0]).getAuthorid());
		attributes.put("transid", ((ProductBean) prodbean[0]).getTransid());
		attributes.put("bklang", ((ProductBean) prodbean[0]).getBklang());
		attributes.put("bkpublisher", ((ProductBean) prodbean[0]).getBkpublisher());
		attributes.put("bkpubdate", ((ProductBean) prodbean[0]).getBkpubdate());
		attributes.put("flag", ((ProductBean) prodbean[0]).getFlag());
		attributes.put("prodstock", ((ProductBean) prodbean[0]).getProdstock());
		attributes.put("prodcost", ((ProductBean) prodbean[0]).getProdcost());
		attributes.put("prodprice", bookprice);
		attributes.put("proddisc", bookdisc);
		attributes.put("epubprice", epubprice);
		attributes.put("bkisbn", ((ProductBean) prodbean[0]).getBkisbn());
		attributes.put("bkseries", ((ProductBean) prodbean[0]).getBkseries());
		attributes.put("bkpages", ((ProductBean) prodbean[0]).getBkpage());
		attributes.put("bkver", ((ProductBean) prodbean[0]).getBkver());
		attributes.put("bksize", ((ProductBean) prodbean[0]).getBksize());
		attributes.put("bkwgt", ((ProductBean) prodbean[0]).getBkwgt());
		attributes.put("bkimg", trans.BinaryToBase64(((ProductBean) prodbean[0]).getProdimg()));
		attributes.put("bkskin", ((ProductBean) prodbean[0]).getBkskin());
		attributes.put("bkmenu", ((ProductBean) prodbean[0]).getBkmenu());
		attributes.put("bkintro", ((ProductBean) prodbean[0]).getBkintro());
		attributes.put("bkefile", ((ProductBean) prodbean[0]).getBkefile());
		attributes.put("authorintro", ((ProductBean) prodbean[0]).getAuthorintro());
		attributes.put("translintro", ((ProductBean) prodbean[0]).getTranslintro());
		attributes.put("classid", ((ProductBean) prodbean[0]).getClassid());
		attributes.put("bkstar", ((ProductBean) prodbean[0]).getBkstar());
		attributes.put("showorder", ((ProductBean) prodbean[0]).getShoworder());

		model.addAttribute("book", attributes);

		model.addAttribute("b", attributes);
		return "backprodtoedit";
	}

}

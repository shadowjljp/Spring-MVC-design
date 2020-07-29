package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.ProductBean;
import model.dao.ProductDaoHibernate;

@Controller
public class AjaxBackProdController {

	@Autowired
	private ProductDaoHibernate productDAO;

	@RequestMapping(path = { "/backprod.controller" }, method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String processPost(@RequestParam(name = "getkeyname") String getkeyname) {
		System.out.println("keyname = " + getkeyname);

		// bean.setId(new Integer(id));
		List<ProductBean> beans = productDAO.selectBookByBknamezh(getkeyname);
		System.out.println("Controller End");
		String gson = new Gson().toJson(beans);
		System.out.println("GSON = " + gson);
		return gson;
	}

	@RequestMapping(path = { "/backprod.controller" }, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String processGET(@RequestParam(name = "times") Integer times) {
		List<Object[]> result = productDAO.selectBookDesc(times);
		String gson = new Gson().toJson(result);
		return gson;
	}
}

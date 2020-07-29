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
import model.dao.ProjectDaoHibernate;

@Controller
public class AjaxBackFundController {

	@Autowired
	private ProjectDaoHibernate projectDAO;

	@RequestMapping(path = { "/backproj.controller" }, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String processGET(@RequestParam(name = "times") Integer times) {
		List<Object[]> result = projectDAO.selectProjDesc(times);
		String gson = new Gson().toJson(result);
		return gson;
	}
}

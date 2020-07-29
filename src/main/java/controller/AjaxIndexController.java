package controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.AuthorBean;
import model.ProductBean;
import model.dao.ProductDaoHibernate;
import readshare.util.BinaryProcessor;

@Controller
public class AjaxIndexController {

	@Autowired
	private ProductDaoHibernate productDao;
	
	@Autowired
	private BinaryProcessor bp;

	@RequestMapping(path = "/loadBookAfterDoc.controller", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String loadBookAfterDoc() {

		// System.out.println(12);

		List<Object[]> result = productDao.selectShowBooks();

		if (result != null && !result.isEmpty()) {
			LinkedList<Map<String, String>> resultsList = new LinkedList<Map<String, String>>();

			for (Object[] tempObj : result) {
				HashMap<String, String> resultMap = new HashMap<String, String>();// 一定要new 新的
				/////////////////////////////////////////////
				resultMap.put("bookId", ((ProductBean) tempObj[0]).getId().toString());
				resultMap.put("bookName", ((ProductBean) tempObj[0]).getBknamezh());
				resultMap.put("bookIsbn", ((ProductBean) tempObj[0]).getBkisbn());
				resultMap.put("bookPrice", ((ProductBean) tempObj[0]).getProdprice().toString());
				resultMap.put("bookIntro", ((ProductBean) tempObj[0]).getBkintro());
				resultMap.put("bookImg", bp.BinaryToBase64(((ProductBean) tempObj[0]).getProdimg()));
				////////////////// from different bean
				resultMap.put("bookAuthor", ((AuthorBean) tempObj[1]).getAuthornamezh());
				/////////////////////////////////////////////
				resultsList.add(resultMap);
			}
			return new Gson().toJson(resultsList);
		}

		return "there is no data";
	}
}

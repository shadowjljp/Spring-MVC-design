package controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.AuthorBean;
import model.ProductBean;
import model.dao.ProductDaoHibernate;
import readshare.util.BinaryProcessor;

@Controller
public class HeaderSearchController {

	// @Autowired
	// private ProductBean bean;

	@Autowired
	private ProductDaoHibernate productDao;
	
	@Autowired
	private BinaryProcessor bp;

	@RequestMapping(path = { "/bookSearchResult.controller" })
	public String processGet(@RequestParam(name = "tag") String tag, @RequestParam(name = "keyWord") String keyWord,
			Model model) {
		
		// 接收資料
		System.out.println("tag=" + tag + ", keyWord=" + keyWord);
		model.addAttribute("tag", tag);
		model.addAttribute("keyWord", keyWord);
		// 呼叫model
		List<Object[]> result = null;
		if (!"".equals(keyWord)) {
			result = productDao.selectBookByTagAndKeyWord(tag, keyWord);
		}

		if (result != null && !result.isEmpty()) {
			LinkedList<Map<String,String>> resultsList = new LinkedList<Map<String,String>>();
			
			for(Object[] tempObj : result) {
				HashMap<String, String> resultMap = new HashMap<String, String>();//一定要new 新的
				/////////////////////////////////////////////
				resultMap.put("bookImg", bp.BinaryToBase64(((ProductBean) tempObj[0]).getProdimg())) ;
				resultMap.put("bookName", ((ProductBean) tempObj[0]).getBknamezh());
				resultMap.put("bookId", ((ProductBean) tempObj[0]).getId().toString());
				resultMap.put("bookIntro", ((ProductBean) tempObj[0]).getBkintro());
				resultMap.put("bookPub", ((ProductBean) tempObj[0]).getBkpublisher());
				resultMap.put("bookPubDate", ((ProductBean) tempObj[0]).getBkpubdate().toString().substring(0, 11));
				resultMap.put("bookPrice", ((ProductBean) tempObj[0]).getProdprice().toString());
				//////////////////from different bean
				resultMap.put("bookAuthor", ((AuthorBean) tempObj[1]).getAuthornamezh());
				/////////////////////////////////////////////
				resultsList.add(resultMap);
			}
			model.addAttribute("resultCount", result.size());
			model.addAttribute("resultsList", resultsList);
			return "bookSearchPage";
		}
		model.addAttribute("resultCount", 0);
		return "bookSearchPage";
	}
}

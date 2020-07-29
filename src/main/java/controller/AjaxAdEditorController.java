package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.AdvertisementBean;
import model.AuthorBean;
import model.ProductBean;
import model.dao.AdvertisementDaoHibernate;
import model.dao.ProductDaoHibernate;
import readshare.util.BinaryProcessor;

@Controller
public class AjaxAdEditorController {

	// @Autowired
	// private AdvertisementBean bean;

	@Autowired
	private BinaryProcessor bp;

	@Autowired
	private AdvertisementDaoHibernate advertisementDao;

	@Autowired
	private ProductDaoHibernate productDao;

	@RequestMapping(path = "/loadAfterDocZone.controller", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String loadAfterDoc(@RequestParam(name = "date") String today, @RequestParam(name = "zone") String zone)
			throws ParseException {
		// System.out.println(today);
		// System.out.println(zone);
		SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");

		List<AdvertisementBean> results = advertisementDao.selectAd(new java.sql.Date(SDF.parse(today).getTime()),
				new Integer(zone));
		// advertisementDao.getSession().clear();
		ArrayList<Map<String, Object>> arrangeResults = new ArrayList<Map<String, Object>>();
		for (AdvertisementBean tempBean : results) {
			HashMap<String, Object> tempMap = new HashMap<String, Object>();
			tempMap.put("id", tempBean.getId());
			tempMap.put("adurl", tempBean.getAdurl());
			tempMap.put("zone", tempBean.getZone());
			tempMap.put("adimg", bp.BinaryToBase64(tempBean.getAdimg()));
			
			arrangeResults.add(tempMap);
		}
		String json = new Gson().toJson(arrangeResults);
		// System.out.println(json);
		return json;
	}

	@RequestMapping(path = "/swapAdOrderWhileDrop.controller", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public void swapAdWhileDrop(@RequestParam(name = "aId") String aId, @RequestParam(name = "bId") String bId) {
		advertisementDao.adOrderSwitch(new Integer(aId), new Integer(bId));
		// advertisementDao.getSession().clear();
	}
	
	@RequestMapping(path = "/swapBookWhileDrop.controller", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public void swapBookWhileDrop(@RequestParam(name = "aId") String aId, @RequestParam(name = "bId") String bId) {
		productDao.switchShowOrder(new Integer(aId), new Integer(bId));
		// advertisementDao.getSession().clear();
	}

	@RequestMapping(path = {
			"/selectBookByKeyWord.controller" }, method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String selectBookByKeyWord(@RequestParam(name = "keyWord") String keyWord,
			@RequestParam(name = "tag") String tag) {

		System.out.println("tag=" + tag);
		System.out.println("keyWord=" + keyWord);
		List<Object[]> result = null;
		if (!"".equals(keyWord)) {
			result = productDao.selectBookByTagAndKeyWord(tag, keyWord);
		}

		if (result != null && !result.isEmpty()) {
			LinkedList<Map<String, String>> resultsList = new LinkedList<Map<String, String>>();

			for (Object[] tempObj : result) {
				HashMap<String, String> resultMap = new HashMap<String, String>();// 一定要new 新的
				/////////////////////////////////////////////
				resultMap.put("bookId", ((ProductBean) tempObj[0]).getId().toString());
				resultMap.put("bookName", ((ProductBean) tempObj[0]).getBknamezh());
				resultMap.put("bookIsbn", ((ProductBean) tempObj[0]).getBkisbn());
				resultMap.put("bookIntro", ((ProductBean) tempObj[0]).getBkintro());
				resultMap.put("bookShowOrder", ((ProductBean) tempObj[0]).getShoworder().toString());
				resultMap.put("bookImg", bp.BinaryToBase64(((ProductBean) tempObj[0]).getProdimg()));
				////////////////// from different bean
				resultMap.put("bookAuthor", ((AuthorBean) tempObj[1]).getAuthornamezh());
				/////////////////////////////////////////////
				resultsList.add(resultMap);
			}
			return new Gson().toJson(resultsList);
		}

		return null;
	}

	@RequestMapping(path = {
			"/adEditorSelectBookById.controller" }, method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String adEditorSelectBookById(@RequestParam(name = "id") Integer id) {

		Object[] tempObj = productDao.selectBookByIdCross2Beans(id);

		HashMap<String, String> resultMap = new HashMap<String, String>();// 一定要new 新的
		/////////////////////////////////////////////
		resultMap.put("bookId", ((ProductBean) tempObj[0]).getId().toString());
		resultMap.put("bookName", ((ProductBean) tempObj[0]).getBknamezh());
		resultMap.put("bookIsbn", ((ProductBean) tempObj[0]).getBkisbn());
		resultMap.put("bookIntro", ((ProductBean) tempObj[0]).getBkintro());
		resultMap.put("bookShowOrder", ((ProductBean) tempObj[0]).getShoworder().toString());
		resultMap.put("bookImg", bp.BinaryToBase64(((ProductBean) tempObj[0]).getProdimg()));
		////////////////// from different bean
		resultMap.put("bookAuthor", ((AuthorBean) tempObj[1]).getAuthornamezh());
		/////////////////////////////////////////////

		return new Gson().toJson(resultMap);
	}

}

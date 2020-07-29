package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.AdvertisementBean;
import model.dao.AdvertisementDaoHibernate;

@Controller
public class AdEditorController {

	@Autowired
	private AdvertisementDaoHibernate advertisementDao;

	@Autowired
	private AdvertisementBean bean;

	static String zone1Path = "C:\\JavaFramework\\eclipse-workspace\\FinalProject\\src\\main\\webapp\\component\\images\\BannerZone1";
	static String zone2Path = "C:\\JavaFramework\\eclipse-workspace\\FinalProject\\src\\main\\webapp\\component\\images\\BannerZone2";

	@RequestMapping(path = "/uploadNewAdBySubmit.controller", method = { RequestMethod.POST}, produces = "text/html;charset=UTF-8")
	public String uploadNewAdBySubmit(@RequestParam(name = "adImg") String filepath,
			@RequestParam(name = "adUrl") String adUrl, @RequestParam(name = "beginDate") String beginDate,
			@RequestParam(name = "endDate") String endDate, @RequestParam(name = "zone") String zone)
			throws IOException {

		if ("1".equals(zone)) {
			filepath = zone1Path + "\\" + filepath;
		} else {
			filepath = zone2Path + "\\" + filepath;
		}

		// System.out.println("filepath=" + filepath);
		// System.out.println("adUrl=" + adUrl);
		// System.out.println("beginDate=" + beginDate);
		// System.out.println("endDate=" + endDate);
		// System.out.println("zone=" + zone);

		byte[] adimg = Files.readAllBytes(new File(filepath).toPath());
		bean.setAdimg(adimg);
		bean.setAdurl(adUrl);
		bean.setZone(new Integer(zone));

		SimpleDateFormat dateFormate = new SimpleDateFormat("yyyy-MM-dd");
		try {
			bean.setStartdate(new java.sql.Date(dateFormate.parse(beginDate).getTime()));
			bean.setEnddate(new java.sql.Date(dateFormate.parse(endDate).getTime()));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		advertisementDao.insertAd(bean);
		return "adEditor";
	}

}

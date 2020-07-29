package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.AdvertisementBean;
import model.AuthorBean;
import model.ProductBean;
import model.dao.AuthorDaoHibernate;
import model.dao.ProductDaoHibernate;

@Controller
public class AjaxBackProdEditController {

	@Autowired
	private ProductDaoHibernate productDao;

	@Autowired
	private ProductBean bean;

	@Autowired
	private AuthorDaoHibernate authorDao;

	@Autowired
	private AuthorBean authorbean;
	
	static String bkImgPath = "C:\\JavaFramework\\eclipse-workspace\\FinalProject\\src\\main\\webapp\\component\\images\\book";
	static String bkefilePath = "C:\\JavaFramework\\eclipse-workspace\\FinalProject\\src\\main\\webapp\\component\\images\\epub";
	String authorintro, translintro;

	@RequestMapping(path = {
			"/backprodedit.controller" }, method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public void processPost(@RequestParam(name = "bknamezh") String bknamezh,
			@RequestParam(name = "bknameen") String bknameen, @RequestParam(name = "authorname") String authorname,
			@RequestParam(name = "transname") String transname, @RequestParam(name = "bklang") String bklang,
			@RequestParam(name = "bkpublisher") String bkpublisher, @RequestParam(name = "bkpubdate") String bkdate,
			@RequestParam(name = "flag") String flag, @RequestParam(name = "prodstock") Integer prodstock,
			@RequestParam(name = "prodcost") Double prodcost, @RequestParam(name = "prodprice") Integer prodprice,
			@RequestParam(name = "proddisc") Double proddisc, @RequestParam(name = "bkisbn") String bkisbn,
			@RequestParam(name = "bkseries") String bkseries, @RequestParam(name = "bkpage") Integer bkpage,
			@RequestParam(name = "bkver") String bkver, @RequestParam(name = "bksize") String bksize,
			@RequestParam(name = "bkwgt") Integer bkwgt, @RequestParam(name = "prodimg") String prodimgpath,
			@RequestParam(name = "bkskin") String bkskin, @RequestParam(name = "bkmenu") String bkmenu,
			@RequestParam(name = "bkintro") String bkintro, @RequestParam(name = "bkefile") String prodefilepath,
			@RequestParam(name = "classid") Integer classid) throws IOException {
		
//		System.out.println("Author Search Start, authorname = "+ authorname);
		//以作者姓名尋找ID，若無此作者資料，則新增，，回傳ID
		Integer authorid, transid;
		if (authorname != null) {
			authorid = authorDao.selectAuthorIdByName(authorname);
			authorintro = authorDao.selectAuthorIntroByID(authorid);
			if (authorid == null) {
				authorbean.setAuthornamezh(authorname);
				authorid = authorDao.insertByNameAuthor(authorbean);
				authorintro = null;
			}
		} else {
			authorid = (Integer) null;
			authorintro = null;
		}
//		System.out.println("Author Search End, authorid = "+ authorid);
//		System.out.println("---------------------------");
//		
//		System.out.println("Translator Search Start, transname = " + transname);

		//以譯者姓名尋找ID，若無此作者資料，則新增，回傳ID
		if (transname != null) {
			transid = authorDao.selectTransIdByName(transname);
			translintro = authorDao.selectTransIntroByID(transid);
			if (transid == null) {
				authorbean.setAuthornamezh(transname);
				transid = authorDao.insertByNameTrans(authorbean);
				translintro = null;
			}
		} else {
			transid = (Integer) null;
			translintro = null;
		}
//		System.out.println("Translator Search End, transid = " + transid);
		
		//轉換日期格式
		SimpleDateFormat dateFormate = new SimpleDateFormat("yyyy-MM-dd");
		try {
			bean.setBkpubdate(new java.sql.Date(dateFormate.parse(bkdate).getTime()));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		byte[] prodimg,bkefile;
		//防止上傳檔案為null
		if (prodimgpath != null) {
			//合併路徑及上的檔案名稱
			prodimgpath = bkImgPath + "\\" + prodimgpath;
			//將圖片片轉換為byte陣列
			prodimg = Files.readAllBytes(new File(prodimgpath).toPath());
		} else {
			prodimg = null;
		}
		
		System.out.println("flag="+flag);
		if (flag == "A") {
			bkefile = null;
		} else {
			prodefilepath = bkefilePath + "\\" + prodefilepath;
			bkefile = Files.readAllBytes(new File(prodefilepath).toPath());
		}
		
		bean.setBknamezh(bknamezh);
		bean.setBknameen(bknameen);
		bean.setAuthorid(authorid);
		bean.setTransid(transid);
		bean.setBklang(bklang);
		bean.setBkpublisher(bkpublisher);
		bean.setFlag(flag);
		bean.setProdstock(prodstock);
		bean.setProdcost(prodcost);
		bean.setProdprice(prodprice);
		bean.setProddisc(proddisc);
		bean.setBkisbn(bkisbn);
		bean.setBkseries(bkseries);
		bean.setBkpage(bkpage);
		bean.setBkver(bkver);
		bean.setBksize(bksize);
		bean.setBkwgt(bkwgt);
		bean.setProdimg(prodimg);
		bean.setBkskin(bkskin);
		bean.setBkmenu(bkmenu);
		bean.setBkintro(bkintro);
		bean.setBkefile(bkefile);
		 bean.setAuthorintro(authorintro);
		 bean.setTranslintro(translintro);
		bean.setClassid(classid);
//		System.out.println("-----------VIEW傳來---------------");
//		System.out.println("bkImgPath = " + bkImgPath);
//		System.out.println("bkefilePath = " + bkefilePath);
//		System.out.println("-------------加入位置-------------");
//		System.out.println("prodimgpath = " + prodimgpath);
//		System.out.println("prodefilepath = " + prodefilepath);
//		System.out.println("-------------改為byte[]-------------");
//		System.out.println("prodimg = " + prodimg);
//		System.out.println("bkefile = " + bkefile);
//		System.out.println("Controller bean = " + bean);
//		System.out.println("--------------------------");
		productDao.insertByBean(bean);

	}
}

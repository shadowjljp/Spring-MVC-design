package controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.BookCaseBean;
import model.MemberBean;
import model.ProductBean;
import model.dao.BookCaseDaoHibernate;
import model.dao.ProductDaoHibernate;

@Controller
@SessionAttributes(names= {"book","file"})
public class BookCaseController {

	@Autowired
	private BookCaseDaoHibernate bookCaseDao;
	
	@Autowired
	private BookCaseBean bcbean;
	
	@Autowired
	private ProductDaoHibernate productDao;
	
	@Autowired
	private ProductBean prodbean;
	
	@Autowired
	private readshare.util.BinaryProcessor trans;
	
	@Autowired
	private readshare.util.TextEditor remove;
	
	ArrayList<Object> array=new ArrayList<Object>();
	
	@RequestMapping(path= {"/pickbook.controller"},method=RequestMethod.GET)
	public String pickbook(@RequestParam(name="bkid")int id, Model model) {
		//prodbean.setId(abook);
//		System.out.println("id="+id);
		prodbean.setId(id);
		ProductBean prod=productDao.selectBookById(prodbean);
//		System.out.println("prod"+prod);
		
		String content=prod.getTranslintro();

//		System.out.println("content="+content);
		
		String result="<p>"+content.replaceAll("\\n", "</p><p>")+"</p>";

//		System.out.println("result="+result);
		
		model.addAttribute("text",result);
		
		model.addAttribute("file",prod);
		
		return "view1";
	}
	
	
	
	@RequestMapping(path= {"/bookcase.controller"},method=RequestMethod.GET)
	public String processPost(@SessionAttribute(name="user")MemberBean bean, Model model) {
		
//		System.out.println("user"+bean);
		
//		int userid=bean.getId();
		
		List<Object[]> bkcase=bookCaseDao.selectbk(bean.getId());
//		for (Object[] objects : bkcase) {
//			System.out.println(objects[0]);
//			System.out.println(objects[1]);
//			System.out.println(objects[2]);
//			String img=trans.BinaryToBase64((byte[]) objects[2]);
//			objects[2]=img;
//			System.out.println(objects[3]);
//		}
		for(int i=0;i<bkcase.size();i++) {
//			System.out.println("before");
//			System.out.println(bkcase.get(i)[2]);
			bkcase.get(i)[2]=trans.BinaryToBase64((byte[]) bkcase.get(i)[2]);
//			System.out.println("after");
//			System.out.println(bkcase.get(i)[2]);
		}
//		System.out.println("book"+bkcase);
		
//		String img=trans.BinaryToBase64(member.getMemimg());
		
		ArrayList<Object> result =new ArrayList<>();
//		for(Object[] tempArray:bkcase) {
//			for(Object x: tempArray) {
//				result.add(x);
//			}
//		}
		
//		System.out.println("bkcase="+bkcase);
//		System.out.println("result="+result);
		model.addAttribute("book",bkcase);
		
		return "bkcase";
	}
}

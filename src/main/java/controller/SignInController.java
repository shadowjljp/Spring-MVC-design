package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import model.AdminBean;
import model.MemberBean;
import model.dao.AdminDaoHibernate;
import model.dao.MemberDaoHibernate;

@Controller
@SessionAttributes(names={"user","userImg","manager"})
public class SignInController {
	
	@Autowired
	private MemberDaoHibernate memberDao;

	@Autowired
	private MemberBean membean;
	
	@Autowired
	private readshare.util.BinaryProcessor trans;
	
	@Autowired
	private AdminBean adminbean;
	
	@Autowired
	private AdminDaoHibernate adminDao;
	
	@RequestMapping(path={"/signin.controller"}, method=RequestMethod.POST)
	public String processPost(@RequestParam(name= "memac") String memac, @RequestParam(name="mempw") String mempw,Model model) {
//		System.out.println("memac= "+memac);
//		System.out.println("mempw= "+mempw);
//		System.out.println("hahaha");
//		memberDao.selectmem(bean);
//		System.out.println(bean);
		
		if(memac==null || memac.length()==0) {
//			System.out.println("Wrong Login.");
			return "index.page";
		}else if(mempw==null || mempw.length()==0) {
//			System.out.println("Wrong Login1.");
			return "index.page";
		}
		
		membean.setMemac(memac);
		membean.setMempw(mempw);
		
		MemberBean member=memberDao.selectmem(membean);
		
		adminbean.setAdmacc(memac);
		adminbean.setAdmpw(mempw);
		
		AdminBean admin=adminDao.selectadm(adminbean);
		
//		System.out.println("Admin="+Admin);
		
		if(member!=null) {
//			System.out.println("login success");
			model.addAttribute("user", member);
			String img=trans.BinaryToBase64(member.getMemimg());
			model.addAttribute("userImg", img);
//			舊的寫法，在method裡面用陣列去存。
//			Object[] client= {member,img};
//			model.addAttribute("user",client);
			return "member.page";
		}
		else if(admin!=null) {
//			System.out.println("Welcome admin");
			model.addAttribute("manager", admin);
			return "back.page";
		}else {
//			System.out.println("login fail");
			return "index.page";
		}
		
		
//		List<MemberBean> Member=memberDao.selectmem(bean);
		
//		System.out.println("Member="+Member);
	}
	
	@RequestMapping(path={"/signout.controller"}, method=RequestMethod.GET)
	public String signout(SessionStatus sessionStatus) {

//		System.out.println("Before");
		sessionStatus.setComplete();
//		session.invalidate();
//		System.out.println("After sessionStatus");
		return "index1";
	}
	
	@RequestMapping(path= {"/checkVisitor.controller"}, method=RequestMethod.POST)
	@ResponseBody
	public boolean checkVisitor(@RequestParam(name= "admin") String adminac,Model model) {

		adminbean.setAdmacc(adminac);
		AdminBean admin=adminDao.selectadm(adminbean);
		
		if(admin!=null) {
//			System.out.println("true");
			model.addAttribute("manager", admin);
			return true;
			
		}
//		System.out.println("false");
		return false;
	}
}

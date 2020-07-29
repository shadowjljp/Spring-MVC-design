package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.FriendListBean;
import model.dao.FriendListDaoHibernate;

@Controller
public class AjaxFriendListController {
	
	@Autowired
	private FriendListDaoHibernate friendDao;
	
	@Autowired
	private FriendListBean bean;
	
	@RequestMapping(path={"/friends.controller"}, method=RequestMethod.POST)
	public void processPost(@RequestParam(name="memid") String memid, @RequestParam(name="friendid") String friendid, @RequestParam(name="jointime") String jointime) {
		System.out.println(memid);
		System.out.println(friendid);
		System.out.println(jointime);
		System.out.println("hehehe");
		
		friendDao.selectfriends(bean);
		
	}

}

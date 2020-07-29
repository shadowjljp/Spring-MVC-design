package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.MessageBean;
import model.dao.MessageDaoHibernate;

@Controller
public class AjaxMessageController {

	@Autowired
	private MessageDaoHibernate messageDao;

	@Autowired
	private MessageBean bean;

	@RequestMapping(path = { "/message.controller" }, method = RequestMethod.POST)
	@ResponseBody
	public void messageSend(@RequestParam(name = "adminid") String adminid, @RequestParam(name = "mbid") String mbid,
			@RequestParam(name = "msg") String msg, @RequestParam(name = "sender") String sender) {

		bean.setAdmid(new Integer(adminid));
		bean.setMbid(new Integer(mbid));
		bean.setMsg(msg);
		bean.setSender(sender);

		messageDao.insertMsg(bean);

//		return "index";
	}

	@RequestMapping(path = {
			"/messageGet.controller" }, method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String messageGet(@RequestParam(name = "adminid") String adminid, @RequestParam(name = "mbid") String mbid) {

		// System.out.println(123);
		bean.setAdmid(new Integer(adminid));
		bean.setMbid(new Integer(mbid));
		List<MessageBean> messageBeans = messageDao.selectMsg(bean);
		// System.out.println(data);

		Gson gson = new Gson();

		return gson.toJson(messageBeans);
	}

	@RequestMapping(path = {
			"/messageGetNew.controller" }, method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String messageGetNew(@RequestParam(name = "adminid") String adminid,
			@RequestParam(name = "mbid") String mbid, @RequestParam(name = "lastMsgTime") String lastMsgTime,
			@RequestParam(name = "receiver") String receiver) throws ParseException {

		// System.out.println(123);
		bean.setAdmid(new Integer(adminid));
		bean.setMbid(new Integer(mbid));
		bean.setSender(receiver);// 要監聽的是接收者的新訊息

		SimpleDateFormat date = new SimpleDateFormat("MMM dd, yyyy hh:mm:ss aa", Locale.ENGLISH);// "Sep 11, 2018

		// 10:58:03 PM"
		// System.out.println("lastMsgTime=" + lastMsgTime);
		List<MessageBean> messageBeans;

		messageBeans = messageDao.selectMsgByLastTime(bean,
				new java.sql.Date(date.parse(lastMsgTime).getTime() + 1500));

		// System.out.println("this is new msg = " + messageBeans);

		return new Gson().toJson(messageBeans);
	}

}

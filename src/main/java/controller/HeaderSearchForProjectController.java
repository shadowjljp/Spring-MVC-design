package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.ProjectBean;
import model.dao.MemberProjectDaoHibernate;
import model.dao.ProjectDaoHibernate;
import readshare.util.BinaryProcessor;

@Controller
public class HeaderSearchForProjectController {
	
	@Autowired
	private MemberProjectDaoHibernate memberProjectDao;

	@Autowired
	private ProjectDaoHibernate projectDao;

	@Autowired
	private BinaryProcessor bp;

	@RequestMapping(path = {
			"/projectSearchResult.controller" })
	public String processGet (@RequestParam(name="keyWord")String keyWord,Model model) {
//		System.out.println("search result for project!");
		//接收資料
		System.out.println("keyWord= "+keyWord);
		model.addAttribute("keyWord", keyWord);
		//呼叫model
		List<ProjectBean> result = null;
		if(!"".equals(keyWord)) {
//			System.out.println("9529296520952259");
			result=projectDao.selectProjectKeyword(keyWord);	
			System.out.println("keyWord is - "+ keyWord);
			System.out.println("result is - "+ result);
			}
		if(result!=null && !result.isEmpty()) {
//			LinkedList<Map<String,String>> resultList=new LinkedList<Map<String,String>>();
			Integer projectid = null;
			ArrayList<HashMap> arrayList=new ArrayList<HashMap>();
			for(ProjectBean tempObj:result) {
				HashMap<String, Object> resultMap=new HashMap<String, Object>();
				//取得專案id
				projectid=tempObj.getId();
				resultMap.put("id", projectid);
				Integer bdg = tempObj.getProjbdg();
				//.....................計算完成度..............................
				Integer sponsormoneySum = memberProjectDao.sponsormoneySum(projectid);
				Double doubleAnswer = (((double) sponsormoneySum / (double) bdg) * 100);
				System.out.println("doubleAnswer= "+doubleAnswer);
				String answer = doubleAnswer.toString()+"0000";				String persent=answer.substring(0,4);
				resultMap.put("answer", persent);
				//............................................................
				//....................計算剩餘天數.............................
				 	long endDate = tempObj.getProjendt().getTime();
					DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
					long date = new Date().getTime();
					dateFormat.format(date);
					long dayleft = (endDate-date)/86400000;
					resultMap.put("projendt", dayleft);
				//............................................................
				resultMap.put("projimg",bp.BinaryToBase64( tempObj.getProjimg()));
				resultMap.put("projname",tempObj.getProjname());
				resultMap.put("projcontent", tempObj.getProjcontent());
				resultMap.put("projbdg",tempObj.getProjbdg().toString());
				arrayList.add(resultMap);
			}
			model.addAttribute("resultCount",result.size());
			model.addAttribute("resultList",arrayList);
			return "ProjectSearchResult";
		}
		model.addAttribute("resultCount",0);
		return "ProjectSearchResult";
	}
}

package model;

import java.util.List;

import org.springframework.stereotype.Controller;
@Controller
public interface MemberProjectDAO {
	public  boolean insert(Integer memid,Integer projid,String sponsormoney,String receivername,String receiveradd,String receivermail,String receiverphone,java.util.Date sponsordate);
	public List<MemberProjectBean>  selectForsponsormoney(Integer projid);
	public Integer sponsormoneySum(Integer projid);
	Integer insertByBean(MemberProjectBean bean);
	public int totalPayMoney(Integer projid);
}

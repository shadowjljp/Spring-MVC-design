package model;

import java.util.List;

public interface MessageDAO {

	public List<MessageBean> selectMsg(MessageBean bean);
	
	public List<MessageBean> selectMsgRdSt(MessageBean bean); 
	
	public List<MessageBean> selectMsgByLastTime(MessageBean bean ,java.sql.Date lastTime); 

	public MessageBean insertMsg(MessageBean bean);
	
	public List<MessageBean> updateReadState(MessageBean bean);
	
	public Integer updateReadStateByHql(MessageBean bean);

}

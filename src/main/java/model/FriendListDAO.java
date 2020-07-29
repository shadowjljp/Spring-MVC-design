package model;

import java.util.List;

public interface FriendListDAO {

//	public List<FriendListBean> selectallfriend(Integer memid);
	
	public List<FriendListBean> selectfriends(FriendListBean bean);
	
	public FriendListBean insertfriend(FriendListBean bean);
	
	public FriendListBean deletefriend(FriendListBean bean);
	
}

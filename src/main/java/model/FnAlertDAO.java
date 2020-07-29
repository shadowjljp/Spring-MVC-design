package model;

import java.util.List;

public interface FnAlertDAO {
	public  List<OrdersBean> select();
	
	public int insert(FnAlertBean bean);
	
	public int delete(Integer id);
	
	public int update(FnAlertBean bean);

}

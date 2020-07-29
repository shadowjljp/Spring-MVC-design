package model;

import java.util.List;

public interface CustomerServiceDAO {
	
	public List<CustomerServiceBean> selectrecord(CustomerServiceBean bean);
	
	public CustomerServiceBean insertquestion(CustomerServiceBean bean);

}

package model;

import java.util.List;

public interface OrdersProductDAO {
	
	public List<OrdersProductBean> select(OrdersProductBean bean);

	public Integer insert(OrdersProductBean bean);

	public int update(OrdersProductBean bean);

	
}

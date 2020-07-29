package model;


import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface OrdersDAO {
	
	public  List<OrdersBean> selectPaymenttype(String Paymenttype);
	
	public  List<OrdersBean> select(OrdersBean bean);
	
	public List<Object[]> selectOrderMember();
	
	public List<Integer> selectOrderamount(Date startTime,Date endTime);
	
	public List<Integer> selectCost(Date startTime,Date endTime);
	
//	public Integer selectOrderamount(Date startTime,Date endTime);
	
	public List<Integer> selectOrderamountMinus (Date startTime,Date endTime);
	
	public Map<String, Integer> selectOrderAmountYears(Date startTime, Date endTime) throws ParseException;
	

	public Integer insert(OrdersBean bean);

//	public abstract OrdersBean update(Integer id, Integer memid, Date orderdate, String orderstate, Integer orderamount,
//			String paymenttype, String shippingstate, String orderticket, Integer invoicenum, String invoicename,
//			Integer businesstax, String orderreturn, String receivername, String receiverphone, String receiveradd );
	

	public int updateByBean(OrdersBean bean);

	
	public int delete(OrdersBean bean);

	public List<Object[]> selectBackOrderCheckOrder(Date  dayStart,Date dayEnd,String flag,Integer orderID,Integer memID);


	public List<Integer> selectFromMemberPhoneToMemID(String memphone);

	public List<Object[]> selectFrontOrderCheckOrder(Date dayStart1, String flag,Integer memid) throws ParseException;

	List<Object[]> selectFrontOrderCheckOrderLonger(Date dayStart1, String flag, Integer memid) throws ParseException;

	List<Object[]> selectFrontOrderCheckOrderUnlimited( String flag, Integer memid)
			throws ParseException;

	

}

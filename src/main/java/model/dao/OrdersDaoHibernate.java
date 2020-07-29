package model.dao;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import config.SpringJavaConfig;
import model.MessageBean;
import model.OrdersBean;
import model.OrdersDAO;
import model.hibernate.HibernateUtil;

@Repository
public class OrdersDaoHibernate implements OrdersDAO {

	public static void main(String[] args) throws ParseException {

		//////////////////////// Spring////////////////

		ApplicationContext context = null;
//		try {
//			context = new AnnotationConfigApplicationContext(SpringJavaConfig.class);
//			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
//			sessionFactory.getCurrentSession().beginTransaction();
//
//			////////////////// insert
//			OrdersDaoHibernate messageDao = (OrdersDaoHibernate) context.getBean("ordersDaoHibernate");
//			OrdersBean bean = (OrdersBean) context.getBean("ordersBean");
//			// MessageBean bean = new MessageBean();
////			
////			bean.setOrderdate(null);
////			bean.setOrderstate("出貨準備中");
////			bean.setMemid(1);
////			System.out.println(new OrdersDaoHibernate(sessionFactory).insert(bean));
//		
//			sessionFactory.getCurrentSession().getTransaction().commit();
//		} catch (BeansException e) {
//			e.printStackTrace();
//		} catch (HibernateException e) {
//			e.printStackTrace();
//		} finally {
//			((ConfigurableApplicationContext) context).close();
//		}

		////////////////

		////////////////////////
		 try {
		 SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		
		 sessionFactory.getCurrentSession().beginTransaction();
		/////////////////

		// new OrdersDaoHibernate(sessionFactory).insert();

		// OrdersBean bean = new OrdersBean();

		// bean.setBusinesstax(55889966);

		// new OrdersDaoHibernate(sessionFactory).select(bean);

		// String Paymenttype = "歐付寶";
		//
		// System.out.println(new
		// OrdersDaoHibernate(sessionFactory).selectPaymenttype(Paymenttype));

		// bean.setId(64);
		// System.out.println(new OrdersDaoHibernate(sessionFactory).select(bean));
//
//		 SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");

		// Date startTime, Date endTime
//		 long time = simpledate.parse("2016-01-01").getTime();
//		 long time2 = simpledate.parse("2017-12-31").getTime();
//		 Date date = new Date(time);
//
//		Date startTime = new Date(time);
//		Date endTime = new Date(time2);
//		
//		List<Integer> rr= new OrdersDaoHibernate(sessionFactory).selectCost(startTime,endTime);
//		
//		for(Integer aa:rr) {
//			System.out.println(aa);
//		}
		// -----------------------------------------------------------
		// Date dayStart = null;
		// Date dayEnd = null;
		// String flag = null;
		// Integer orderID = null;
		// Integer memID = null;
		//
		// List<Object[]> temp=new
		// OrdersDaoHibernate(sessionFactory).selectBackOrderCheckOrder( dayStart,
		// dayEnd, flag, orderID,memID);
		//
		// for(Object[] result:temp) {
		// for(Object x:result) {
		// System.out.println("x="+x);
		// }
		//
		// }
		// ----------------------------------------
		// String memberphone="0912345678";
		// List<Integer> temp=new
		// OrdersDaoHibernate(sessionFactory).selectFromMemberPhoneToMemID(memberphone);
		// // for(Object[] result:temp) {
		// for(Integer result:temp) {
		// System.out.println("result="+result);
		// }
		// // }

		// List<Object[]> temp=new
		// OrdersDaoHibernate(sessionFactory).selectOrderMember();
		//
		// for(Object[] result:temp) {
		// for(Object x:result) {
		// System.out.println("x="+x);
		// }
		//
		// }

		// ----------front order check test Start---------------
		// LocalDateTime currentTime = LocalDateTime.now();
		// Period period = Period.of(0, 3, 0);
		// LocalDateTime ThreeMonth = currentTime.minus(period);
		//// System.out.println("ThreeMonth="+ThreeMonth);
		// simpledate = new SimpleDateFormat("yyyy-MM-dd");
		// long time1 = simpledate.parse(ThreeMonth.toString()).getTime();
		//
		// Date dayStart1 = new Date(time1);
		// String flag ="a";
		// Integer memid=3;
		// List<Object[]> temp=new
		// OrdersDaoHibernate(sessionFactory).selectFrontOrderCheckOrder( dayStart1,
		// flag, memid);
		// System.out.println("hibernate test");
		// for(Object[] result:temp) {
		// for(Object x:result) {
		// System.out.println("x="+x);
		// }
		// }
		// ----------front order check test END---------------
		// ----------front order check longer test Start---------------
		// LocalDateTime currentTime = LocalDateTime.now();
		// Period period = Period.of(0, 3, 0);
		// LocalDateTime ThreeMonth = currentTime.minus(period);
		//// System.out.println("ThreeMonth="+ThreeMonth);
		// simpledate = new SimpleDateFormat("yyyy-MM-dd");
		// long time1 = simpledate.parse(ThreeMonth.toString()).getTime();
		//
		// Date dayStart1 = new Date(time1);
		// String flag ="a";
		// Integer memid=3;
		// List<Object[]> temp=new
		// OrdersDaoHibernate(sessionFactory).selectFrontOrderCheckOrderLonger(
		// dayStart1, flag, memid);
		// System.out.println("hibernate test");
		// for(Object[] result:temp) {
		// for(Object x:result) {
		// System.out.println("x="+x);
		// }
		// }

		// ----------front order check test longer END---------------
		// ----------front order check unlimited test Start---------------
		// String flag ="a";
		// Integer memid=3;
		// List<Object[]> temp=new
		// OrdersDaoHibernate(sessionFactory).selectFrontOrderCheckOrderUnlimited(flag,
		// memid);
		//
		// System.out.println("hibernate test");
		// for(Object[] result:temp) {
		// for(Object x:result) {
		// System.out.println("x="+x);
		// }
		// }
		//
		// long time1 = simpledate.parse("2017-01-01").getTime();
		// long time2 = simpledate.parse("2017-12-31").getTime();
		// Date startTime = new Date(time1);
		// Date endTime = new Date(time2);
		// System.out.println(new
		// OrdersDaoHibernate(sessionFactory).selectOrderAmountYears(startTime,
		// endTime));
		// bean1.setId(1);
		// bean.setOrderdate(null);
		// bean.setOrderstate("出貨準備中");
		// bean.setMemid(1);
		// System.out.println(new OrdersDaoHibernate(sessionFactory).insert(bean));

		// bean.setId(101);
		// bean.setOrderamount(12345);
		// bean.setInvoicename("jimmy喜歡很濕的名字");
		// bean.setBusinesstax(321);
		// System.out.println(new
		// OrdersDaoHibernate(sessionFactory).updateByBean(bean));

		// bean.setId(101);
		// System.out.println(new OrdersDaoHibernate(sessionFactory).delete(bean));
		////////////////////////////////////
		// try {
		// sessionFactory.getCurrentSession().getTransaction().commit();
		//
		// } catch (HibernateException e) {
		// sessionFactory.getCurrentSession().getTransaction().rollback();
		// e.printStackTrace();
		// System.out.println("Transaction failed and now rollback it !");
		// }
		 } catch (HibernateException e) {
		 e.printStackTrace();
		 } finally {
		 HibernateUtil.closeSessionFactory();
		
		 }

	}// 以上只是測試程式，實際hibernate程式開始在下面。

	@Autowired
	private SessionFactory sessionFactory;

	public OrdersDaoHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;

	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	static final String selectHQL = "from OrdersBean where Paymenttype =:Paymenttype";

	@Override
	public List<OrdersBean> selectPaymenttype(String Paymenttype) {

		Query query = getSession().createQuery(selectHQL);
		query.setParameter("Paymenttype", Paymenttype);
		// query.setFirstResult(10);
		// query.setMaxResults(10);
		return query.list();
	}

	static final String select = "from OrdersBean where  id=:id";

	@Override
	public List<OrdersBean> select(OrdersBean bean) {
		Query query = getSession().createQuery(select);
		query.setParameter("id", bean.getId());

		return query.list();

	}// from OrdersBean o left join MemberBean m on o.memid=m.id
		// from MemberBean mOrdersBean o left join OrdersBean o on o.memid=m.id

	static final String selectOrderMember = "select o.orderdate,o.paymenttype,o.orderamount,m.memgen,m.membirth,m.memadd,o.orderstate from OrdersBean o left join MemberBean m  on o.memid=m.id where m.memac ='jerry' ";

	// o.orderdate >'2016-01-01'
	@Override
	public List<Object[]> selectOrderMember() {
		Query query = getSession().createQuery(selectOrderMember);

		return query.list();

	}

	// ------------------------------------------------------------------------------------------------------------------
	// ------------------------------------------------------------------------------------------------------------------
	static final String selectFromMemberPhoneToMemID = "select id from MemberBean where memphone=:memphone";

	@Override
	public List<Integer> selectFromMemberPhoneToMemID(String memphone) {
		Query query = getSession().createQuery(selectFromMemberPhoneToMemID);
		query.setParameter("memphone", memphone);
		return query.list();

	}

	// Many to Many Table starts down here
	static final String selectBackOrderCheckOrder = "select p.bknamezh,p.prodimg,o.orderamount,o.shippingstate,o.orderdate,o.invoicenum from OrdersBean o , ProductBean p ,OrdersProductBean op where op.prodid = p.id AND op.orderid=o.id AND ((o.orderdate BETWEEN :startDate AND :endDate) or orderdate is not null )AND ((p.flag = :flag) or p.flag is not null ) AND ((o.id like :id) or o.id is not null) AND ((o.memid=:memid) or o.memid is not null)";
	static final String selectBackOrderCheckOrder1 = "select p.bknamezh,p.prodimg,o.orderamount,o.shippingstate,o.orderdate,o.invoicenum "
			+ "from OrdersBean o " + "left  join OrdersProductBean op " + "on op.orderid=o.id "
			+ "left  join ProductBean p " + "on op.prodid=p.id "
			+ "where ((o.orderdate BETWEEN :startDate AND :endDate) or orderdate is not null )AND ((p.flag like :flag) or p.flag is not null ) AND ((o.id like :id) or o.id is not null) AND ((o.memid=:memid) or o.memid is not null)";

	@Override
	public List<Object[]> selectBackOrderCheckOrder(Date dayStart, Date dayEnd, String flag, Integer orderID,
			Integer memID) {
		System.out.println("dayStart=" + dayStart);
		System.out.println("dayEnd=" + dayEnd);
		System.out.println("flag=" + flag);
		System.out.println("orderID=" + orderID);
		System.out.println("memID=" + memID);
		Query query = getSession().createQuery(selectBackOrderCheckOrder1);
		query.setParameter("startDate", dayStart);
		query.setParameter("endDate", dayEnd);
		query.setParameter("flag", flag);
		query.setParameter("id", orderID);
		query.setParameter("memid", memID);

		return query.list();

	}

	// -----------Front order check starts down here!!-----------------------
	static final String selectFrontOrderCheckOrder = "select p.bknamezh,p.prodimg,o.orderamount,o.shippingstate,o.orderdate,o.invoicenum"
			+ " from OrdersBean o " + " left outer join OrdersProductBean op " + " on op.orderid=o.id "
			+ " left outer join ProductBean p " + " on op.prodid=p.id "
			+ " where (o.orderdate BETWEEN :startDate AND :endDate) AND ((p.flag like :flag) or p.flag is not null ) AND (o.memid=:memid)";

	@Override
	public List<Object[]> selectFrontOrderCheckOrder(Date dayStart1, String flag, Integer memid) throws ParseException {
		System.out.println("dayStart1=" + dayStart1);
		System.out.println("flag=" + flag);
		System.out.println("memid=" + memid);
		// ------------End Date(現在時間)的日期轉換-----------
		LocalDateTime nowTime = LocalDateTime.now();
		SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");
		long time1 = simpledate.parse(nowTime.toString()).getTime();
		Date endDate = new Date(time1);
		// ------------End Date(現在時間)的日期轉換-----------
		Query query = getSession().createQuery(selectFrontOrderCheckOrder);
		query.setParameter("startDate", dayStart1);
		query.setParameter("flag", flag);
		query.setParameter("endDate", endDate);
		query.setParameter("memid", memid);

		return query.list();

	}

	// ------------------------------------------------------------
	// -----------Front order check Longer starts down here!!-----------------------
	static final String selectFrontOrderCheckOrderLonger = "select p.bknamezh,p.prodimg,o.orderamount,o.shippingstate,o.orderdate,o.invoicenum"
			+ " from OrdersBean o " + " left outer join OrdersProductBean op " + " on op.orderid=o.id "
			+ " left outer join ProductBean p " + " on op.prodid=p.id "
			+ " where (o.orderdate <=:startDate ) AND ((p.flag like :flag) or p.flag is not null ) AND (o.memid=:memid)";

	@Override
	public List<Object[]> selectFrontOrderCheckOrderLonger(Date dayStart1, String flag, Integer memid)
			throws ParseException {
		System.out.println("dayStart1=" + dayStart1);
		System.out.println("flag=" + flag);
		System.out.println("memid=" + memid);
		// ------------End Date(現在時間)的日期轉換-----------
		// LocalDateTime nowTime = LocalDateTime.now();
		// SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");
		// long time1 = simpledate.parse(nowTime.toString()).getTime();
		// Date endDate = new Date(time1);
		// ------------End Date(現在時間)的日期轉換-----------
		Query query = getSession().createQuery(selectFrontOrderCheckOrderLonger);
		query.setParameter("startDate", dayStart1);
		query.setParameter("flag", flag);
		query.setParameter("memid", memid);

		return query.list();

	}

	// -----------Front order check unlimited starts down
	// here!!-----------------------
	static final String selectFrontOrderCheckOrderUnlimited = "select p.bknamezh,p.prodimg,o.orderamount,o.shippingstate,o.orderdate,o.invoicenum"
			+ " from OrdersBean o " + " left outer join OrdersProductBean op " + " on op.orderid=o.id "
			+ " left outer join ProductBean p " + " on op.prodid=p.id "
			+ " where  ((p.flag like :flag) or p.flag is not null ) AND (o.memid=:memid)";

	@Override
	public List<Object[]> selectFrontOrderCheckOrderUnlimited(String flag, Integer memid) throws ParseException {
		System.out.println("flag=" + flag);
		System.out.println("memid=" + memid);

		Query query = getSession().createQuery(selectFrontOrderCheckOrderUnlimited);
		query.setParameter("flag", flag);
		query.setParameter("memid", memid);

		return query.list();

	}

	// -----------Front order check unlimited END here!!-----------------------
	@Override
	public Integer insert(OrdersBean bean) {

	
		Integer p = (Integer) getSession().save(bean);
		return p;
	}

	static final String update = "update OrdersBean set orderamount=:orderamount,invoicename=:invoicename,businesstax=:businesstax where id=:id ";

	@Override
	public int updateByBean(OrdersBean bean) {
		Query query = getSession().createQuery(update);
		query.setParameter("id", bean.getId());
		query.setParameter("orderamount", bean.getOrderamount());
		query.setParameter("invoicename", bean.getInvoicename());
		query.setParameter("businesstax", bean.getBusinesstax());
		int count = query.executeUpdate();
		return count;
	}

	// @Override
	// public OrdersBean update(Integer id, Integer memid, Date orderdate, String
	// orderstate, Integer orderamount,
	// String paymenttype, String shippingstate, String orderticket, Integer
	// invoicenum, String invoicename,
	// Integer businesstax, String orderreturn, String receivername, String
	// receiverphone, String receiveradd) {
	// // TODO Auto-generated method stub
	// return null;
	// }

	// HQL內須注意: from 是連接到javaBean 不是資料庫的table； where 也是javaBean裏頭設定的table
	// name，連接下方query的String

	static final String selectOrderamount = "SELECT orderamount FROM OrdersBean WHERE orderdate>=:startTime AND orderdate<=:endTime";

	@Override
	public List<Integer> selectOrderamount(Date startTime, Date endTime) {
		// System.out.println(startTime);
		Query<Integer> query = getSession().createQuery(selectOrderamount);
		query.setParameter("startTime", startTime);
		query.setParameter("endTime", endTime);
		// System.out.println(query);

		return query.list();
	}

	static final String selectOrderamountMinus = "SELECT orderamount FROM OrdersBean WHERE orderdate>=:startTime AND orderdate<=:endTime AND orderamount<0";

	@Override
	public List<Integer> selectOrderamountMinus(Date startTime, Date endTime) {
		Query<Integer> query = getSession().createQuery(selectOrderamountMinus);
		query.setParameter("startTime", startTime);
		query.setParameter("endTime", endTime);
		return query.list();
	}

	static final String delete = "delete from OrdersBean where id=:id";

	@Override
	public int delete(OrdersBean bean) {
		Query query = getSession().createQuery(delete);
		query.setParameter("id", bean.getId());
		int deleteCount = query.executeUpdate();
		return deleteCount;

	}

	
	//抓出今年每個月營收總和
	static final String selectOrderAmountYears = "SELECT orderdate, orderamount FROM OrdersBean WHERE orderdate>=:startTime AND orderdate<=:endTime";
	
	@Override
	public Map<String, Integer> selectOrderAmountYears(Date startTime, Date endTime) throws ParseException {
		Query<Integer[]> query = getSession().createQuery(selectOrderAmountYears);
		query.setParameter("startTime", startTime);
		query.setParameter("endTime", endTime);

		List<Integer[]> amounts = query.list();

		HashMap<String, Integer> result = new HashMap<String, Integer>();

		HashMap<String, Integer> result2 = new HashMap<String, Integer>();
		int tempSum = 0;
		for (int m = 1; m <= 12; m++) {
			result2.put("a" + m + "a", tempSum);
		}

		for (Object[] tempAmount : amounts) {
			// result.put((Date) tempAmount[0], (Integer) tempAmount[1]);
			SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");

			// Date date = new
			// java.sql.Date(simpledate.parse(tempAmount[0].toString().substring(0,
			// 10)).getTime());
			//System.out.println("TEST------------->>"+tempAmount[1]);
			Integer amount1 = Integer.parseInt(tempAmount[1].toString());

			for (int m = 1; m <= 12; m++) {
				// result22222.put(m+"月", tempSum);

				if (Integer.parseInt(tempAmount[0].toString().substring(5, 7).toString()) == m) {

					result2.put("a" + m + "a", result2.get("a" + m + "a") + amount1);

					//System.out.println(m + "m" + "," + amount1);
					// System.out.println(" amount= "+result2.get("8月"));
				}
			}

			// result.put(new
			// java.sql.Date(simpledate.parse(tempAmount[0].toString().substring(0,
			// 10)).getTime()),
			// Integer.parseInt(tempAmount[1].toString()));
			// System.out.println("tempAmount[0]=" +
			// simpledate.parse(tempAmount[0].toString().substring(0, 10))
			// + ",tempAmount[1]=" + Integer.parseInt(tempAmount[1].toString()));

		}
		// System.out.println("result2="+result2);
		// System.out.println("result="+result);

		return result2;

	}
	
	
	//搜尋年度成本總和
	static final String selectCost = "SELECT cost FROM OrdersBean WHERE orderdate>=:startTime AND orderdate<=:endTime";

	@Override
	public List<Integer> selectCost(Date startTime,Date endTime) {
		Query<Integer> query = getSession().createQuery(selectCost);
		query.setParameter("startTime", startTime);
		query.setParameter("endTime", endTime);
		// System.out.println(query);
		System.out.println("有跑到搜尋年度成本總和");
		return query.list();
	}
	

}

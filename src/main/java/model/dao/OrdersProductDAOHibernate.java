package model.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import model.OrdersProductBean;
import model.OrdersProductDAO;
import model.hibernate.HibernateUtil;

public class OrdersProductDAOHibernate implements OrdersProductDAO {


	public static void main(String[] args) {  //測試程式
		try {
			SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
			
			sessionFactory.getCurrentSession().beginTransaction();
			/////////////////////測試程式開始/////////////////////////////////
			
			OrdersProductBean bean = new OrdersProductBean ();
		//	bean.setId(363);
			
//			bean.setId(186);
//			bean.setAmount(18);
//			System.out.println(new OrdersProductDAOHibernate(sessionFactory).update(bean));
			
			bean.setOrderid(68);
			System.out.println(new OrdersProductDAOHibernate(sessionFactory).select(bean));
			
//			bean.setId(187);
//			System.out.println(new OrdersProductDAOHibernate(sessionFactory).insert(bean));

	/////////////////////////////////測試程式結束///////////////////////////		
			try {
				sessionFactory.getCurrentSession().getTransaction().commit();
			} catch (HibernateException e) {
				//預防交易失敗，如果失敗就rollback交易
				sessionFactory.getCurrentSession().getTransaction().rollback();
				e.printStackTrace();
			}
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			HibernateUtil.closeSessionFactory();
			
		}
		
	}
	private SessionFactory sessionFactory;
	
	public OrdersProductDAOHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	//select 方法開始
	static final String select1 = "from OrdersProductBean where orderid=:orderid";
	@Override
	public List<OrdersProductBean> select(OrdersProductBean bean) {
		Query query = getSession().createQuery(select1);
		query.setParameter("orderid", bean.getOrderid());
		return query.list();

//		Query query = getSession().createQuery(select);
//		query.setParameter("id", bean.getId());
		
	}
	
	@Override
	public Integer insert(OrdersProductBean bean) {
	
		return (Integer) getSession().save(bean);   //回傳PK鍵
	}
	//update method starts here~~~~~
	static final String update = "update OrdersProductBean set amount=:amount where id =:id";
	@Override
	public int update(OrdersProductBean bean) {
		// update OrdersProductBean set compname=:compname where
		
		Query query = getSession().createQuery(update);
		query.setParameter("amount", bean.getAmount());
		query.setParameter("id", bean.getId());
		int count = query.executeUpdate();
		return count;
	}


		
}


package model.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import model.SpiderBean;
import model.SpiderDAO;
import model.hibernate.HibernateUtil;

public class SpiderDAOHibernate implements SpiderDAO{

	public static void main(String[] args) {  //測試程式
		try {
			SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
			
			sessionFactory.getCurrentSession().beginTransaction();
			/////////////////////測試程式開始/////////////////////////////////
			//new SpiderDAOHibernate(sessionFactory).select(bean); //後面. +方法測試
		SpiderBean bean = new SpiderBean ();
//		bean.setId("金土廟");
//		System.out.println(new SpiderDAOHibernate(sessionFactory).select(bean));
	
//			bean.setId("品玉");
//			bean.setProdid(7);
//			bean.setPrice(300);
//			System.out.println(new SpiderDAOHibernate(sessionFactory).insert(bean));
			
//			bean.setId("金土廟");
//			bean.setProdid(6);
//			bean.setPrice(150);
//			System.out.println(new SpiderDAOHibernate(sessionFactory).update(bean));

		bean.setId("品玉");
		bean.setProdid(7);
			System.out.println(new SpiderDAOHibernate(sessionFactory).delete(bean));
		//System.out.println(new SpiderDAOHibernate(sessionFactory).selectAll());
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
	
	public SpiderDAOHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	//select 方法開始
	static final String select1 = "from SpiderBean where id=:id";
	@Override
	public List<SpiderBean> select(SpiderBean bean) {
		Query query = getSession().createQuery(select1);
		query.setParameter("id", bean.getId());
		return query.list();

//		Query query = getSession().createQuery(select);
//		query.setParameter("id", bean.getId());
		
	}
	
	static final String selectALL = "from SpiderBean ";
	@Override
	public List<SpiderBean> selectAll() {
		Query query = getSession().createQuery(selectALL);
		return query.list();
		
	}

	
	@Override
	public String insert(SpiderBean bean) {
	
		return  (String) getSession().save(bean);   //回傳PK鍵,此處pk鍵為String ,所以屬性設為String
	}
	//update method starts here~~~~~
	static final String update = "update SpiderBean set price=:price where prodid =:prodid and id=:id";
	@Override
	public int update(SpiderBean bean) {
		// update SpiderBean set compname=:compname where
		
		Query query = getSession().createQuery(update);
		query.setParameter("price", bean.getPrice());
		query.setParameter("prodid", bean.getProdid());
		query.setParameter("id", bean.getId());
		int count = query.executeUpdate();
		return count;
	}
	//delete method starts here~~~~~
	static final String delete ="delete from SpiderBean where id=:id and prodid=:prodid";
	@Override
	public int delete(SpiderBean bean) {
		Query query = getSession().createQuery(delete);
		query.setParameter("id", bean.getId());
		query.setParameter("prodid", bean.getProdid());
		int deleteCount = query.executeUpdate();
		return deleteCount;
	}
		
}

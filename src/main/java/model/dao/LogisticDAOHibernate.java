package model.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import model.LogisticsBean;
import model.LogisticsDAO;
import model.hibernate.HibernateUtil;
@Repository
public class LogisticDAOHibernate implements LogisticsDAO {
	
	

	public static void main(String[] args) {  //測試程式
		try {
			SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
			
			sessionFactory.getCurrentSession().beginTransaction();
			/////////////////////測試程式開始/////////////////////////////////
			//new LogisticDAOHibernate(sessionFactory).select(bean); //後面. +方法測試
		LogisticsBean bean = new LogisticsBean ();
		//	bean.setId(363);
//			bean.setCompname("好狗");
//			System.out.println(new LogisticDAOHibernate(sessionFactory).update(bean));
//			System.out.println(new LogisticDAOHibernate(sessionFactory).select(bean));
			System.out.println(new LogisticDAOHibernate(sessionFactory).selectAll());
//			bean.setSpd(100);
//			System.out.println(new LogisticDAOHibernate(sessionFactory).insert(bean));
//			System.out.println(new LogisticDAOHibernate(sessionFactory).delete(bean));
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
	
	public LogisticDAOHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	//select 方法開始
	static final String select1 = "from LogisticsBean where compname=:compname";
	@Override
	public List<LogisticsBean> select(LogisticsBean bean) {
		Query query = getSession().createQuery(select1);
		query.setParameter("compname", bean.getCompname());
		return query.list();

//		Query query = getSession().createQuery(select);
//		query.setParameter("id", bean.getId());
		
	}
	
	static final String selectALL = "from LogisticsBean ";
	@Override
	public List<LogisticsBean> selectAll() {
		Query query = getSession().createQuery(selectALL);
		return query.list();
		
	}

	
	@Override
	public Integer insert(LogisticsBean bean) {
	
		return (Integer) getSession().save(bean);   //回傳PK鍵
	}
	//update method starts here~~~~~
	static final String update = "update LogisticsBean set compname=:compname where id =:id";
	@Override
	public int update(LogisticsBean bean) {
		// update LogisticsBean set compname=:compname where
		
		Query query = getSession().createQuery(update);
		query.setParameter("compname", bean.getCompname());
		query.setParameter("id", bean.getId());
		int count = query.executeUpdate();
		return count;
	}
	//delete method starts here~~~~~
	static final String delete ="delete from LogisticsBean where id=:id";
	@Override
	public int delete(LogisticsBean bean) {
		Query query = getSession().createQuery(delete);
		query.setParameter("id", bean.getId());
		int deleteCount = query.executeUpdate();
		return deleteCount;
	}
		
}

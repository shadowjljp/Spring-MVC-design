package model.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import model.FnAlertBean;
import model.FnAlertDAO;
import model.OrdersBean;
import model.hibernate.HibernateUtil;

public class FnAlertDaoHibernate implements FnAlertDAO {

	public static void main(String[] args) throws ParseException {
		
		try {
			SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
			
			sessionFactory.getCurrentSession().beginTransaction();
			
			FnAlertBean bean = new FnAlertBean();
			
			SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");
			long time = simpledate.parse("2018-07-07").getTime();
			Date date = new Date(time);
			
			
//			delete
//			System.out.println(new FnAlertDaoHibernate(sessionFactory).delete(11));
			
			
//			insert
//			bean.setId(13);
//			bean.setTime(date);
//			bean.setItem("OOXX");
//			bean.setUpdatetime(date);
//			System.out.println(new FnAlertDaoHibernate(sessionFactory).insert(bean));
			
			
//			update
			bean.setId(13);
			bean.setTime(date);
			bean.setItem("YYZZ");
			bean.setUpdatetime(date);
			System.out.println(new FnAlertDaoHibernate(sessionFactory).update(bean));			
			
			
			
//			select
//			System.out.println(new FnAlertDaoHibernate(sessionFactory).select());
			
			
			try {
				sessionFactory.getCurrentSession().getTransaction().commit();
				
			} catch (HibernateException e) {
				
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
	
	public FnAlertDaoHibernate (SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		
	}
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	static final String select ="from FnAlertBean";
	@Override
	public List<OrdersBean> select() {
		Query query = getSession().createQuery(select);
		
		
		return query.list();
	}

	@Override
	public int insert(FnAlertBean bean) {
		Integer p = (Integer) getSession().save(bean);
		return p;
	}
	
	
	static final String delete ="delete from FnAlertBean where id=:id";
	@Override
	public int delete(Integer id) {
		Query query = getSession().createQuery(delete);
		query.setParameter("id", id);
		int deleteCount = query.executeUpdate();
		return deleteCount;
	
	}

	static final String update = "update FnAlertBean set time=:time,item=:item,updatetime=:updatetime,note=:note where id=:id ";
	@Override
	public int update(FnAlertBean bean) {
		Query query = getSession().createQuery(update);
		query.setParameter("id",bean.getId());
		query.setParameter("time",bean.getTime());
		query.setParameter("item",bean.getItem());
		query.setParameter("updatetime",bean.getUpdatetime());
		query.setParameter("note",bean.getNote());
		int count = query.executeUpdate();
		return count;
	}
}

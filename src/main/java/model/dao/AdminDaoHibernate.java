package model.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import model.AdminBean;
import model.AdminDAO;
import model.hibernate.HibernateUtil;

@Repository
public class AdminDaoHibernate implements AdminDAO {
	
public static void main(String[] args) {
		
		try {
			SessionFactory sessionFactory=HibernateUtil.getSessionfactory();
			
			sessionFactory.getCurrentSession().beginTransaction();
			
			AdminBean bean=new AdminBean();
			
			bean.setAdmacc("HOWHOW");
			bean.setAdmpw("HOW123");
			
			System.out.println(new AdminDaoHibernate(sessionFactory).selectadm(bean));
			
			try {
				sessionFactory.getCurrentSession().getTransaction().commit();
				
			} catch (HibernateException e) {
				sessionFactory.getCurrentSession().getTransaction().rollback();

				e.printStackTrace();
			}
						
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
		
	}
	
	private SessionFactory sessionFactory;

	public AdminDaoHibernate(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
	}

	public Session getSession() {
	return sessionFactory.getCurrentSession();
	}

	static final String selectac="from AdminBean where admacc=:admacc and admpw=:admpw";
	@Override
	public AdminBean selectadm(AdminBean bean) {
		if(bean!=null) {
			Query<AdminBean> query=getSession().createQuery(selectac,AdminBean.class);
			query.setParameter("admacc", bean.getAdmacc());
			query.setParameter("admpw", bean.getAdmpw());
			AdminBean result=query.uniqueResult();
			System.out.println("result="+result);
			return result;
		}
		return null;
	}

}

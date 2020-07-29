package model.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import model.CustomerServiceBean;
import model.CustomerServiceDAO;
import model.hibernate.HibernateUtil;

public class CustomerServiceDaoHibernate implements CustomerServiceDAO {

	public static void main(String[] args) throws ParseException {

		try {
			SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
			sessionFactory.getCurrentSession().beginTransaction();
			CustomerServiceBean bean = new CustomerServiceBean();

//			bean.setMemid(1);
//			List<CustomerServiceBean> beans = new CustomerServiceDaoHibernate(sessionFactory).selectrecord(bean);
//			System.out.println(beans.get(0).getSrec() + "----" + beans.get(0).getSt());

//			bean.setMemid(2);
//			bean.setFlag(1);
//			bean.setSsort("商品詢問");
//			bean.setSbl("VIP");
//			bean.setSrec("請問一下光榮城市什麼時候會上市");
//			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//			long time = format.parse("2018-01-31").getTime();
//			Date date = new Date(time);
//			bean.setSt(date);
//			System.out.println(new CustomerServiceDaoHibernate(sessionFactory).insertquestion(bean));
	
			try {
				sessionFactory.getCurrentSession().getTransaction().commit();;
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

	public CustomerServiceDaoHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	static final String selectid = "from CustomerServiceBean where memid=:memid";

	@Override
	public List<CustomerServiceBean> selectrecord(CustomerServiceBean bean) {
		Query query = getSession().createQuery(selectid);
		query.setParameter("memid", bean.getMemid());
		return query.list();
	}

	@Override
	public CustomerServiceBean insertquestion(CustomerServiceBean bean) {
		CustomerServiceBean temp=(CustomerServiceBean) this.getSession().get(CustomerServiceBean.class, bean.getMemid());
		this.getSession().save(bean);
		return bean;
	}

}

package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.AdanalysisBean;
import model.AdanalysisDAO;

@Repository
public class AdanalysisDaoHibernate implements AdanalysisDAO {

	// public static void main(String[] args) throws ParseException {
	// try {
	// SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
	// sessionFactory.getCurrentSession().beginTransaction();
	// //////////////
	// AdanalysisDaoHibernate adanalysisDaoHibernate = new
	// AdanalysisDaoHibernate(sessionFactory);
	// /////////////
	// // AdanalysisBean bean = new AdanalysisBean();
	// // bean.setAdclickx(Math.random() * 100);
	// // bean.setAdclicky(Math.random() * 100);
	// //
	// // adanalysisDaoHibernate.insertCordinateWhileClick(bean);
	// /////////////
	//
	// SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	// long customerTime = simpleDateFormat.parse("2018-08-31").getTime();
	// java.sql.Date beginTime = new java.sql.Date(customerTime);
	// java.sql.Date endTime = new java.sql.Date(System.currentTimeMillis());
	// System.out.println(adanalysisDaoHibernate.selectcCordinateByTime(beginTime,
	// endTime));
	//
	// //////////////
	// try {
	// sessionFactory.getCurrentSession().getTransaction().commit();
	// } catch (HibernateException e) {
	// sessionFactory.getCurrentSession().getTransaction().rollback();
	// e.printStackTrace();
	// }
	// sessionFactory.getCurrentSession().close();
	// } catch (HibernateException e) {
	// e.printStackTrace();
	// } finally {
	// HibernateUtil.closeSessionFactory();
	// }
	// }

	//////////////////////
	@Autowired
	private SessionFactory sessionFactory;

	// public AdanalysisDaoHibernate(SessionFactory sessionFactory) {
	// this.sessionFactory = sessionFactory;
	// System.out.println("DAO sessionFactoty: " + sessionFactory);
	// }

	public Session getSession() {
		System.out.println("getSession=" + sessionFactory);
		return sessionFactory.getCurrentSession();
	}

	//////////////////
	static final String selectCoHql = "FROM AdanalysisBean WHERE clicktime>:beginTime AND clicktime<:endTime";

	@Override
	public List<AdanalysisBean> selectcCordinateByTime(java.sql.Date beginTime, java.sql.Date endTime) {

		Query<AdanalysisBean> query = getSession().createQuery(selectCoHql);
		query.setParameter("beginTime", beginTime);
		query.setParameter("endTime", endTime);

		return query.list();
	}

	@Override
	public void insertCordinateWhileClick(AdanalysisBean bean) {
		bean.setClicktime(new java.sql.Date(System.currentTimeMillis()));
		this.getSession().save(bean);
	}

}

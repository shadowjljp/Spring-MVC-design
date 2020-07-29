package model.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import model.BookStarBean;
import model.BookStarDAO;
import model.hibernate.HibernateUtil;

public class BookStarDaoHibernate implements BookStarDAO {

	public static void main(String[] args) {

		try {
			SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
			sessionFactory.getCurrentSession().beginTransaction();
			/////////////////////// 測試程式////////////////////////
//			BookStarDaoHibernate bookStarDAO = new BookStarDaoHibernate(sessionFactory);
//			System.out.println(bookStarDAO.selectAvg(2));
//			System.out.println(array[0]);//評分人數
//			System.out.println(array[1]);//平均分數
			
			List<Object[]> result1 = new BookStarDaoHibernate(sessionFactory).selectAvg(2);
			Object[] array = result1.get(0);
			System.out.println(array[0]);//評分人數
			System.out.println(array[1]);//平均分數
			
			


			/////////////////////// 測試程式////////////////////////
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

	public BookStarDaoHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public BookStarBean insert(BookStarBean bean) {

		Integer PK = (Integer) getSession().save(bean);
		if (PK != null) {
			return bean;
		}
		return null;
	}

//	static final String selectBookStarAvgHQL = "select COUNT(score) as votes, ROUND(AVG(CAST(score AS FLOAT)), 2) as bkstaravg FROM bookstar b WHERE b.prodid =:prodid";
//	@Override
//	public List<BookStarBean> selectAvg(Integer id) {
//		Query<BookStarBean> query = getSession().createQuery(selectBookStarAvgHQL);
//		query.setParameter("prodid", id);
//
//		return query.list();
//	}

	static final String selectBookStarAvgSQL = "SELECT COUNT(score) votes, CONVERT(decimal(10,1),avg(CONVERT(decimal,score))) bkstaravg FROM bookstar WHERE prodid =:prodid";
	@Override
	public List<Object[]> selectAvg(Integer id) {
		Query<Object[]> query = getSession().createNativeQuery(selectBookStarAvgSQL);
		query.setParameter("prodid", id);

		List<Object[]> result = (List<Object[]>) query.list();
		return result;
	}

}

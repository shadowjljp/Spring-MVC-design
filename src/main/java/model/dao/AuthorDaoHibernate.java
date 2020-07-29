package model.dao;

import java.util.List;
import java.util.function.IntToDoubleFunction;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import model.AuthorBean;
import model.AuthorDAO;
import model.BookCaseBean;
import model.MemberBean;
import model.hibernate.HibernateUtil;

@Repository
public class AuthorDaoHibernate implements AuthorDAO {

	public static void main(String[] args) {

		try {
			SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
			sessionFactory.getCurrentSession().beginTransaction();
			/////////////////////// 測試程式////////////////////////
			AuthorDaoHibernate AuthorDAO = new AuthorDaoHibernate(sessionFactory);
			AuthorBean bean = new AuthorBean();

			// insert 成功
			// bean.setAuthornamezh("測試王");
			// bean.setAuthornameen("King Of Test");
			// bean.setAuthorniname("KOT");
			// bean.setAuthorintro("我是胖虎");
			// bean.setTranslintro("我是孩子王");
			// System.out.println(AuthorDAO.insert(bean));

			// select 成功
//			 System.out.println(AuthorDAO.selectAuthorAndTranslator("張佩瑜"));
			
//			bean.setAuthornamezh("JERRY");
//			 System.out.println(AuthorDAO.insertByName(bean));
			
			
//			System.out.println(AuthorDAO.selectAuthorIntroByID(3));

			// update 成功
//			bean.setId(25);
//			bean.setAuthornamezh("胖虎");
//			bean.setAuthornameen("King Of Test");
//			bean.setAuthorniname("KOT");
//			bean.setAuthorintro("我是胖虎");
//			bean.setTranslintro("我是孩子王");
//			System.out.println(AuthorDAO.update(bean));
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

	public AuthorDaoHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	
	@Override
	public AuthorBean insert(AuthorBean bean) {

		Integer PK = (Integer) getSession().save(bean);
		if (PK != null) {
			return bean;
		}
		return null;
	}
	
	@Override
	public Integer insertByNameAuthor(AuthorBean bean) {
//		System.out.println("Insert by Name Start");
		Integer resultid = (Integer) getSession().save(bean);
//		getSession().clear();
//		System.out.println("Insert by Name End, resultid = " + resultid);
		return resultid;
	}
	
	@Override
	public Integer insertByNameTrans(AuthorBean bean) {
//		System.out.println("Insert by Name Start");
		Integer resultid = (Integer) getSession().save(bean);
//		getSession().clear();
//		System.out.println("Insert by Name End, resultid = " + resultid);
		return resultid;
	}

	static final String selectAuthorHQL = "FROM AuthorBean where authornamezh=:authornamezh";

	@Override
	public List<AuthorBean> selectAuthorAndTranslator(String authornamezh) {
		Query<AuthorBean> query = getSession().createQuery(selectAuthorHQL);
		query.setParameter("authornamezh", authornamezh);
		return query.list();
	}
	
	static String selectAuthorIdByNameHQL = "SELECT id FROM AuthorBean where authornamezh=:authornamezh";
	@Override
	public Integer selectAuthorIdByName(String authornamezh) {
		Query query = getSession().createQuery(selectAuthorIdByNameHQL);
		query.setParameter("authornamezh", authornamezh);
		return (Integer) query.uniqueResult();
	}
	
	static String selectTransIdByNameHQL = "SELECT id FROM AuthorBean where authornamezh=:transname";
	@Override
	public Integer selectTransIdByName(String transname) {
		Query query = getSession().createQuery(selectTransIdByNameHQL);
		query.setParameter("transname", transname);
		
		
		return (Integer) query.uniqueResult();
	}

	static final String updateAuthorHQL = "update AuthorBean set authornamezh=:authornamezh, authornameen=:authornameen, authorniname=:authorniname, authorintro=:authorintro, translintro=:translintro where id=:id ";

	@Override
	public int update(AuthorBean bean) {
		Query query = getSession().createQuery(updateAuthorHQL);
		query.setParameter("id", bean.getId());
		query.setParameter("authornamezh", bean.getAuthornamezh());
		query.setParameter("authornameen", bean.getAuthornameen());
		query.setParameter("authorniname", bean.getAuthorniname());
		query.setParameter("authorintro", bean.getAuthorintro());
		query.setParameter("translintro", bean.getTranslintro());
		int count = query.executeUpdate();
		return count;
	}

	static final String selectAuthorIntroHQL = "SELECT authorintro FROM AuthorBean where id=:authorid ";

	@Override
	public String selectAuthorIntroByID(Integer authorid) {
		Query query = getSession().createQuery(selectAuthorIntroHQL);
		query.setParameter("authorid", authorid);
		return (String) query.uniqueResult();
	}
	
	static final String selectTransIntroHQL = "SELECT translintro FROM AuthorBean where id=:translid ";

	@Override
	public String selectTransIntroByID(Integer transid) {
		Query query = getSession().createQuery(selectTransIntroHQL);
		query.setParameter("translid", transid);
		return (String) query.uniqueResult();
	}


}

package model.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import model.ClassBean;
import model.ClassDAO;
import model.hibernate.HibernateUtil;

public class ClassDaoHibernate implements ClassDAO {

	public static void main(String[] args) {

		try {
			SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
			sessionFactory.getCurrentSession().beginTransaction();
			/////////////////////// 測試程式////////////////////////
			ClassDaoHibernate classDAO = new ClassDaoHibernate(sessionFactory);
			ClassBean bean = new ClassBean();

			// insert 成功
			// bean.setSupid(6);
			// bean.setName("東南亞");
			// System.out.println(classDAO.insert(bean));

			// selectAll 成功
			// System.out.println(classDAO.selectAll(bean));

			// update 成功
//			 bean.setId(23);
//			 bean.setSupid(6);
//			 bean.setName("東南亞");
//			 System.out.println(classDAO.update(bean));
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

	public ClassDaoHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public ClassBean insert(ClassBean bean) {

		Integer PK = (Integer) getSession().save(bean);
		if (PK != null) {
			return bean;
		}
		return null;
	}

	static final String selectClassHQL = "FROM ClassBean";

	@Override
	public List<ClassBean> selectAll(ClassBean bean) {
		Query<ClassBean> query = getSession().createQuery(selectClassHQL);
		return query.list();
	}

	static final String updateClassHQL = "update ClassBean set supid=:supid, name=:name where id=:id ";

	@Override
	public int update(ClassBean bean) {
		Query query = getSession().createQuery(updateClassHQL);
		query.setParameter("id", bean.getId());
		query.setParameter("supid", bean.getSupid());
		query.setParameter("name", bean.getName());
		int count = query.executeUpdate();
		return count;
	}

}

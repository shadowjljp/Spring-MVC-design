package model.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import model.MemberBean;
import model.MemberDAO;
import model.hibernate.HibernateUtil;

@Repository
public class MemberDaoHibernate implements MemberDAO {

	public static void main(String[] args) {

		try {
			SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
			sessionFactory.getCurrentSession().beginTransaction();

			MemberBean bean = new MemberBean();

			// bean.setMemac("jimmy");
			// bean.setMempw("jimmy123");
			// System.out.println(new MemberDaoHibernate(sessionFactory).selectmem(bean));

			// bean.setId(10);
			// bean.setMemac("Tony");
			// System.out.println(new
			// MemberDaoHibernate(sessionFactory).insertaccount(bean));

			// bean.setId(3);
			// bean.setMemniname("soft");
			// System.out.println(new
			// MemberDaoHibernate(sessionFactory).updateaccount(bean));

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

	public MemberDaoHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	//////////////// howard function
	// sql => select ms.mbid, count(ms.msg) from message ms group by ms .mbid;

	/////////////////////
	static final String selectac = "from MemberBean where memac=:memac and mempw=:mempw";

	@Override
	public MemberBean selectmem(MemberBean bean) {
		Query<MemberBean> query = getSession().createQuery(selectac, MemberBean.class);
		query.setParameter("memac", bean.getMemac());
		query.setParameter("mempw", bean.getMempw());
		// System.out.println(query.list());
		MemberBean result = query.uniqueResult();
		// System.out.println("result="+result);
		return result;
	}

	static final String selectByIdHQL = "SELECT memname from MemberBean where id=:id";

	@Override
	public String selectById(MemberBean bean) {
		Query query = getSession().createQuery(selectByIdHQL);
		query.setParameter("id", bean.getId());
		String member = (String) query.uniqueResult();
		return member;
	}

	static final String selectAll = "from MemberBean";

	@Override
	public List<Object[]> selectAll() {
		Query query = getSession().createQuery(selectAll);

		return query.list();
	}

	@Override
	public MemberBean insertaccount(MemberBean bean) {
		MemberBean temp = (MemberBean) this.getSession().get(MemberBean.class, bean.getId());
		this.getSession().save(bean);
		return bean;
	}

	static final String updateid = "update MemberBean set memniname=:memniname where id=:id";

	@Override
	public MemberBean updateaccount(MemberBean bean) {
		Query query = getSession().createQuery(updateid);
		query.setParameter("id", bean.getId());
		query.setParameter("memniname", bean.getMemniname());
		return bean;
	}

}

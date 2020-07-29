package model.dao;

import java.text.ParseException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import model.FriendListBean;
import model.FriendListDAO;
import model.hibernate.HibernateUtil;

@Repository
public class FriendListDaoHibernate implements FriendListDAO{
	
	public static void main(String[] args) throws ParseException {
		
		try {
			SessionFactory sessionFactory=HibernateUtil.getSessionfactory();
			
			sessionFactory.getCurrentSession().beginTransaction();
			
			FriendListBean bean=new FriendListBean();
			
//			bean.setMemid(3);
//			System.out.println(new FriendListDaoHibernate(sessionFactory).selectfriends(bean));

//			System.out.println(new FriendListDaoHibernate(sessionFactory).selectallfriend(3));
			
//			bean.setMemid(2);
//			bean.setFriendid(3);
//			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//			long time = format.parse("2017-01-01").getTime();
//			Date date = new Date(time);
//			bean.setJointime(date);;
//			System.out.println(new FriendListDaoHibernate(sessionFactory).insertfriend(bean));
			
//			bean.setMemid(4);
//			bean.setFriendid(1);
//			System.out.println(new FriendListDaoHibernate(sessionFactory).deletefriend(bean));
			
			
			try {
				sessionFactory.getCurrentSession().getTransaction().commit();
				
			} catch (HibernateException e) {
				sessionFactory.getCurrentSession().getTransaction().rollback();
				e.printStackTrace();
			}
			
		} catch (HibernateException e) {
			e.printStackTrace();
		}finally {
			HibernateUtil.closeSessionFactory();
		}
		
	}
	
	private SessionFactory sessionFactory;
	
	public FriendListDaoHibernate(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
	}
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	static final String selectall="from FriendListBean where memid=:memid";
	@Override
	public List<FriendListBean> selectfriends(FriendListBean bean) {
		Query query=getSession().createQuery(selectall);
		query.setParameter("memid", bean.getMemid());
		return query.list();
	}

	@Override
	public FriendListBean insertfriend(FriendListBean bean) {
		FriendListBean temp=(FriendListBean) this.getSession().get(FriendListBean.class, bean.getMemid());
		this.getSession().save(bean);
		return bean;
	}

	static final String deleteid="delete from FriendListBean where memid=:memid and friendid=:friendid";
	@Override
	public FriendListBean deletefriend(FriendListBean bean) {
		Query query=getSession().createQuery(deleteid);
		query.setParameter("memid", bean.getMemid());
		query.setParameter("friendid", bean.getFriendid());
		query.executeUpdate();
		return bean;
	}
	
//	static final String selectid="from FriendListBean where memid=:memid";
//	@Override
//	public List<FriendListBean> selectallfriend(Integer memid) {
//		Query query=getSession().createQuery(selectid);
//		query.setParameter("memid", memid);
//		return query.list();
//	}


}

package model.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import model.HopeListBean;
import model.HopeListDAO;
import model.hibernate.HibernateUtil;

public class HopeListDaoHibernate implements HopeListDAO{

	public static void main(String[] args) throws ParseException {
		try {		
			SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
			sessionFactory.getCurrentSession().beginTransaction();
			//......測試程式開始.......
			//先new出bean
			HopeListBean bean=new HopeListBean();
			//select測試
//			System.out.println(new HopeListDaoHibernate(sessionFactory).selectHopeList(4));
			//insert測試
//			bean.setOwnerid(1);
//			bean.setBkid(7);
//			SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");
//			long time = simpledate.parse("2018-09-05").getTime();
//			Date date = new Date(time);
//			bean.setJointime(date);
//			System.out.println(new HopeListDaoHibernate(sessionFactory).insertByBean(bean));
			//delete測試
			bean.setOwnerid(4);
			bean.setBkid(6);
			System.out.println(new HopeListDaoHibernate(sessionFactory).delete(bean));
//			
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
	
	public HopeListDaoHibernate(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
	}
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public boolean insert(Integer ownerid, Integer bkid, Date jointime) {
		
		return false;
	}
	@Override
	public Integer insertByBean(HopeListBean bean) {
		return (Integer)getSession().save(bean);	
	}
	static final String selectHopeListHql="from HopeListBean where ownerid=:ownerid";
	
	@Override
	public List<HopeListBean> selectHopeList(Integer ownerid) {
		Query query=getSession().createQuery(selectHopeListHql);
		
		query.setParameter("ownerid",ownerid);
		return query.list();
	}
	

	static final String delete="delete from HopeListBean where ownerid=:ownerid and bkid=:bkid";
	@Override
	public int delete(HopeListBean bean) {
		Query query=getSession().createQuery(delete);
		query.setParameter("ownerid", bean.getOwnerid());
		query.setParameter("bkid", bean.getBkid());
		int deleteCount=query.executeUpdate();
		return deleteCount;
	}

}

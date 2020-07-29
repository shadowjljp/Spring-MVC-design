package model.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import model.BookCaseBean;
import model.BookCaseDAO;
import model.hibernate.HibernateUtil;

@Repository
public class BookCaseDaoHibernate implements BookCaseDAO {
	
	public static void main(String[] args) throws ParseException {
		
		try {
			SessionFactory sessionFactory=HibernateUtil.getSessionfactory();
			
			sessionFactory.getCurrentSession().beginTransaction();
			
//			new BookCaseDaoHibernate(sessionFactory).selectbk(3);
			
			BookCaseBean bean= new BookCaseBean();		
			
//			bean.setOwnerid(1);
//			bean.setBkid(7);
//			bean.setSharedmemid(3);
//			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//			long time = format.parse("2017-10-30").getTime();
//			Date date = new Date(time);
//			bean.setSharetime(date);
//			System.out.println(new BookCaseDaoHibernate(sessionFactory).insertbook(bean));
			
//			bean.setOwnerid(3);
//			System.out.println(new BookCaseDaoHibernate(sessionFactory).selectall(bean));
			
//			bean.setOwnerid(1);
//			bean.setBkid(5);
//			bean.setSharedmemid(6);
//			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//			long time = format.parse("2017-12-31").getTime();
//			Date date = new Date(time);
//			bean.setSharetime(date);
//			System.out.println(new BookCaseDaoHibernate(sessionFactory).updateshare(bean));
			
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

	public BookCaseDaoHibernate(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
	}
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	static final String selectid="from BookCaseBean where ownerid=:ownerid";
	@Override
	public List<BookCaseBean> selectall(BookCaseBean bean) {
		Query query=getSession().createQuery(selectid);
		query.setParameter("ownerid", bean.getOwnerid());
		return query.list();
	}

	@Override
	public BookCaseBean insertbook(BookCaseBean bean) {
		BookCaseBean temp=(BookCaseBean) this.getSession().get(BookCaseBean.class, bean.getOwnerid());
		this.getSession().save(bean);
		return bean;
	}

	static final String updateid="update BookCaseBean set sharememid=:sharememid, sharetime=:sharetime where ownerid=:ownerid and bkid=:bkid";
	@Override
	public BookCaseBean updateshare(BookCaseBean bean) {
		Query query=getSession().createQuery(updateid);
		query.setParameter("sharememid", bean.getSharedmemid());
		query.setParameter("sharetime", bean.getSharetime());
		query.setParameter("ownerid", bean.getOwnerid());
		query.setParameter("bkid", bean.getBkid());
		query.executeUpdate();
		return bean;
	}
	
	
	static final String selectprod="select p.id, p.bknamezh, p.prodimg, p.bkefile from ProductBean p left join BookCaseBean b on p.id=b.bkid where b.ownerid=:ownerid";
	@Override
	public List<Object[]> selectbk(Integer id) {
		Query<Object[]> query=getSession().createQuery(selectprod);
		query.setParameter("ownerid", id);
		List<Object[]> result = query.list();

//		for(Object[] tempArray:result) {
//			System.out.println("result "+tempArray[0]);
//			System.out.println("result1 "+tempArray[1]);
//			System.out.println("result2 "+tempArray[2]);
//			System.out.println("result3 "+tempArray[3]);
//		}
//		System.out.println("success");
		return result;
	}

}

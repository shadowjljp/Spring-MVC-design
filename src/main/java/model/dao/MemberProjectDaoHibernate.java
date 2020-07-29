package model.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.MemberProjectBean;
import model.MemberProjectDAO;
import model.hibernate.HibernateUtil;
@Repository
public  class MemberProjectDaoHibernate implements MemberProjectDAO {

	public static void main(String[] args) {
		try {
			SessionFactory sessionFactory=HibernateUtil.getSessionfactory();
			sessionFactory.getCurrentSession().beginTransaction();
//............................測試程式開始....................................
			//select測試
//			System.out.println(new MemberProjectDaoHibernate(sessionFactory).selectForsponsormoney(1));
//			System.out.println(new MemberProjectDaoHibernate(sessionFactory).sponsormoneySum(6));
//			System.out.println(new MemberProjectDaoHibernate(sessionFactory).totalPayMoney(2));
			
//			MemberProjectBean bean=new MemberProjectBean();
			//insert測試程式
//			bean.setMemid(1);
//			bean.setProjid(1);
//			bean.setReceivername("測試資料庫");
//			System.out.println(new MemberProjectDaoHibernate(sessionFactory).insertByBean(bean));
			//select測試程式指令
//			System.out.println(new MemberProjectDaoHibernate(sessionFactory).select(1));
			
			
//............................測試程式結束....................................
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
	@Autowired
	private  SessionFactory sessionFactory; 
	
	public MemberProjectDaoHibernate (SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
	}
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	static final String totalMoneyPay="select count(id) from MemberProjectBean where projid=:projid";
	@Override
	public int totalPayMoney(Integer projid) {
		Query query = getSession().createQuery(totalMoneyPay);
		query.setParameter("projid", projid);
		
		Object danny = query.uniqueResult();
		
		Integer result = Integer.parseInt(danny.toString());
		
		return result;
	}
	
	static final String selectidHQL="select mp.sponsormoney from MemberProjectBean mp where mp.projid=:projid";
	@Override
	public List<MemberProjectBean>  selectForsponsormoney(Integer projid) {
//		System.out.println("MemberProject: "+id);
		Query query=getSession().createQuery(selectidHQL);
		query.setParameter("projid", projid);
		
//		return (MemberProjectBean) query.list();
		return  query.list();
	}
	static final String sponsormoneySum="SELECT SUM(sponsormoney) FROM MemberProjectBean WHERE projid=:projid";
	@Override
	public Integer sponsormoneySum(Integer projid){
		
//		System.out.println("smoney"+sponsormoneySum);
		
		Query query = getSession().createQuery(sponsormoneySum);
		
//		System.out.println("result"+query);
		
		query.setParameter("projid", projid);
//		System.out.println("---projid= "+projid);
//		System.out.println("pause");
//		System.out.println("query.uniqueResult()----"+query.uniqueResult());
		Object obj = query.uniqueResult();
		if(obj!=null) {
			Integer sum = Integer.parseInt(obj.toString());
			return sum;
		}else{
//			Integer sum = null;
			return null;
		}
		
	}
	
	@Override
	public Integer insertByBean(MemberProjectBean bean) {
		
		return (Integer) getSession().save(bean);
	}
	@Override
	public boolean insert(Integer memid, Integer projid, String sponsormoney, String receivername, String receiveradd,
			String receivermail, String receiverphone, Date sponsordate) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	


}

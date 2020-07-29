package model.dao;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import model.AdvertisementBean;
import model.AdvertisementDAO;
import model.hibernate.HibernateUtil;

@Repository
public class AdvertisementDaoHibernate implements AdvertisementDAO {

	public static void main(String[] args) throws IOException {
		try {
			SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
			sessionFactory.getCurrentSession().beginTransaction();
			//////////////////////////////////////////////////////////
			AdvertisementDaoHibernate advertisementDAO = new AdvertisementDaoHibernate(sessionFactory);
			/////// insert
			AdvertisementBean bean = new AdvertisementBean();
			bean.setStartdate(new java.sql.Date(System.currentTimeMillis()));
			bean.setEnddate(new java.sql.Date(System.currentTimeMillis() + 86400000));
			bean.setZone(1);
			bean.setAdurl("http://yahoo.com.tw");
			String path = "C:\\JavaFramework\\eclipse-workspace\\FinalProject\\src\\main\\webapp\\component\\images\\BannerZone2\\1.jpg";
			byte[] adimg = Files.readAllBytes(new File(path).toPath());
			bean.setAdimg(adimg);
			System.out.println(advertisementDAO.insertAd(bean));
//			///// select zone1
//			java.sql.Date startDate = new java.sql.Date(System.currentTimeMillis());
//			java.sql.Date endDate = new java.sql.Date(System.currentTimeMillis() + 86400000);
			//
			// System.out.println(advertisementDAO.selectAd(startDate, endDate, 1));
			/////////// select Max id

			// System.out.println(advertisementDAO.selectMaxId());
			////////////// AdOrderSwitch

//			 advertisementDAO.adOrderSwitch(6,7);

			//////////////////////////////////////////////////////////
			try {
				sessionFactory.getCurrentSession().getTransaction().commit();
			} catch (HibernateException e) {
				sessionFactory.getCurrentSession().getTransaction().rollback();
				e.printStackTrace();
			}
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}

	private SessionFactory sessionFactory;

	public AdvertisementDaoHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public AdvertisementBean insertAd(AdvertisementBean bean) {

		Integer maxId = selectMaxId();

		if (maxId == null) {
			maxId = 0;
		}
		bean.setAdorder(maxId + 1);// order = p key
		Integer adPKey = (Integer) getSession().save(bean);
		if (adPKey != null)
			return bean;

		return null;
	}

	static final String selectAdZoneHQL = "from AdvertisementBean where startDate>=:startDate and endDate<=:endDate and zone=:zone";

	@Override
	public List<AdvertisementBean> selectAd(Date startDate, Date endDate, Integer zone) {

		Query<AdvertisementBean> query = getSession().createQuery(selectAdZoneHQL);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		query.setParameter("zone", zone);

		return query.list();
	}

	static final String selectAdTodayHQL = "FROM AdvertisementBean WHERE startDate<=:today AND endDate>=:today AND zone=:zone ORDER BY adorder";

	@Override
	public List<AdvertisementBean> selectAd(Date today, Integer zone) {
		Query<AdvertisementBean> query = getSession().createQuery(selectAdTodayHQL);
		query.setParameter("today", today);
		query.setParameter("zone", zone);
		List<AdvertisementBean> list = query.list();
		// System.out.println("list=" + list);
		return list;
	}


	
	@Override
	public Integer selectMaxId() {
		Query query = getSession().createQuery("SELECT MAX(id) FROM AdvertisementBean");
		return (Integer) query.getSingleResult();
	}

	@Override
	public Boolean adOrderSwitch(Integer aId, Integer bId) {

		AdvertisementBean beanA = getSession().get(AdvertisementBean.class, aId);
		AdvertisementBean beanB = getSession().get(AdvertisementBean.class, bId);

		if (beanA != null && beanB != null) {
			Integer tempOrder = beanA.getAdorder();
			beanA.setAdorder(beanB.getAdorder());
			beanB.setAdorder(tempOrder);
			System.out.println("廣告輪播位置修改OK");
			return true;
		}
		System.out.println("廣告輪播位置修改失敗");
		return false;
	}

	
	
	//======================Ronnie===================
	static final String selectAdrevenue = "SELECT adrevenue FROM AdvertisementBean WHERE startdate>=:startTime AND enddate<=:endTime";

	@Override
	public List<Integer> selectAdrevenue(Date startTime, Date endTime) {
		Query<Integer> query = getSession().createQuery(selectAdrevenue);
		query.setParameter("startTime", startTime);
		query.setParameter("endTime", endTime);
		return query.list();
	}
	//======================Ronnie===================
}

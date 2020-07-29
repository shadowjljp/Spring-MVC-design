package model.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import config.SpringJavaConfig;
import model.MessageBean;
import model.MessageDAO;

@Repository
public class MessageDaoHibernate implements MessageDAO {

	public static void main(String[] args) throws ParseException {

		//////////////////////// Spring////////////////

		ApplicationContext context = null;
		try {
			context = new AnnotationConfigApplicationContext(SpringJavaConfig.class);
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
			sessionFactory.getCurrentSession().beginTransaction();

			////////////////// insert
			MessageDaoHibernate messageDao = (MessageDaoHibernate) context.getBean("messageDaoHibernate");
			MessageBean bean = (MessageBean) context.getBean("messageBean");
//			MessageBean bean = new MessageBean();
			bean.setAdmid(1);
			bean.setMbid(1);
			
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
//			bean.setMsg("hehehehe");
//			bean.setReadstate("未讀");
//			bean.setSender("Howard");
//			bean.setReceiver("Admin");
//			System.out.println(messageDao.selectMsgByLastTime(bean,date.parse("2018-02-02 12:23:22")));

			sessionFactory.getCurrentSession().getTransaction().commit();
		} catch (BeansException e) {
			e.printStackTrace();
		} catch (HibernateException e) {
			e.printStackTrace();
		}finally {
			((ConfigurableApplicationContext) context).close();
		}
		
		//////////////// 以下 Hibernate /////////////////////////////////////////////
		// try {
		// SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
		// sessionFactory.getCurrentSession().beginTransaction();
		//
		// MessageDaoHibernate messageDaoHibernate = new
		//////////////// MessageDaoHibernate(sessionFactory);

		////////////////// insert
		// MessageBean bean = new MessageBean();
		// bean.setAdmid(1);
		// bean.setMbid(1);
		// bean.setMsg("hehehehe");
		// bean.setReadstate("未讀");
		// bean.setSender("Howard");
		// bean.setReceiver("Admin");
		// System.out.println(messageDaoHibernate.insertMsg(bean));
		/////////////////// select msg有兩種 換方法名稱而已
		// MessageBean bean = new MessageBean();
		// bean.setAdmid(1);
		// bean.setMbid(1);
		// bean.setSender("Howard");
		//// System.out.println(messageDaoHibernate.selectMsgRdSt(bean));
		// System.out.println(messageDaoHibernate.selectMsg(bean));

		//////////////////// update
		// MessageBean bean = new MessageBean();
		// bean.setAdmid(1);
		// bean.setMbid(1);
		// bean.setSender("Howard");
		//// messageDaoHibernate.updateReadState(bean);//不聰明的方法
		// messageDaoHibernate.updateReadStateByHql(bean);

		// try {
		// sessionFactory.getCurrentSession().getTransaction().commit();
		// } catch (Exception e) {
		// sessionFactory.getCurrentSession().getTransaction().rollback();
		// e.printStackTrace();
		// }
		// // sessionFactory.getCurrentSession().getTransaction().rollback();
		// sessionFactory.getCurrentSession().close();
		// } catch (HibernateException e) {
		// e.printStackTrace();
		// } finally {
		// HibernateUtil.closeSessionFactory();
		// }

	}

	@Autowired
	private SessionFactory sessionFactory;

	public MessageDaoHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	////////////////////////////////////////////////////////////

	static final String selectMsgHql = "FROM MessageBean WHERE admid=:admid AND mbid=:mbid";

	@Override
	public List<MessageBean> selectMsg(MessageBean bean) {

		Integer admid = bean.getAdmid();
		Integer mbid = bean.getMbid();

		Query<MessageBean> query = getSession().createQuery(selectMsgHql, MessageBean.class);
		query.setParameter("admid", admid);
		query.setParameter("mbid", mbid);

		List<MessageBean> result = query.list();

		return result;
	}

	@Override
	public MessageBean insertMsg(MessageBean bean) {
		bean.setSendtime(new java.sql.Date(System.currentTimeMillis()));
		getSession().save(bean);
		return bean;
	}

	@Override
	public List<MessageBean> updateReadState(MessageBean bean) {
		// 把sender所有未讀的資料取出
		List<MessageBean> beans = selectMsgRdSt(bean);

		// 變成已讀
		for (MessageBean tempBean : beans) {
			tempBean.setReadstate("已讀");
		}
		return beans;
	}

	@Override
	public List<MessageBean> selectMsgRdSt(MessageBean bean) {
		Integer admid = bean.getAdmid();
		Integer mbid = bean.getMbid();
		String sender = bean.getSender();

		Query<MessageBean> query = getSession().createQuery("FROM MessageBean WHERE admid =" + admid + " AND mbid ="
				+ mbid + "AND sender ='" + sender + "' AND readstate is not '已讀' ", MessageBean.class);
		List<MessageBean> result = query.list();
		return result;
	}

	static final String updateMsgRdStHql = "UPDATE MessageBean SET readstate = '已讀' WHERE admid=:admid AND mbid=:mbid AND sender=:sender AND readstate is not '已讀'";

	@Override
	public Integer updateReadStateByHql(MessageBean bean) {

		Query<?> query = getSession().createQuery(updateMsgRdStHql);

		query.setParameter("admid", bean.getAdmid());
		query.setParameter("mbid", bean.getMbid());
		query.setParameter("sender", bean.getSender());

		// System.out.println("受影響的資料:" + query.executeUpdate());

		return query.executeUpdate();
	}

	
	static final String selectMsgByLastTimeHql = "FROM MessageBean WHERE admid=:admid AND mbid=:mbid AND sender=:sender AND sendtime>:lastTime ";

	@Override
	public List<MessageBean> selectMsgByLastTime(MessageBean bean, java.sql.Date lastTime) {
		Query<MessageBean> query = getSession().createQuery(selectMsgByLastTimeHql);
		
		query.setParameter("admid", bean.getAdmid());
		query.setParameter("mbid", bean.getMbid());
		query.setParameter("sender", bean.getSender());
		query.setParameter("lastTime", lastTime);
		
		return query.list();
	}

}

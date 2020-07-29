package model.dao;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Repository;

import model.MemberBean;
import model.ProductBean;
import model.ProjectBean;
import model.ProjectDAO;
import model.hibernate.HibernateUtil;

@Repository
public class ProjectDaoHibernate implements ProjectDAO {

	public static void main(String[] args) throws IOException, ParseException {

		try {
			SessionFactory sessionFactory = HibernateUtil.getSessionfactory();
			sessionFactory.getCurrentSession().beginTransaction();
			//////////////////// 測試程式開始/////////////////////////////////////
			ProjectBean bean = new ProjectBean();

			// select測試
			// System.out.println(new
			// ProjectDaoHibernate(sessionFactory).selectForProjHome("執行中",0));
			// List<Object[]> temp = new
			// ProjectDaoHibernate(sessionFactory).selectForProjHome("審核中", 0);
			// int i = 0;
			// for (Object[] x : temp) {

			// for (Object result : x) {
			// System.out.println("result= " + result);
			// i++;
			// }
			// System.out.println("i=" + i);

			// System.out.println(x[0]);
			// System.out.println(x[1]);
			// System.out.println(x[2]);
			// System.out.println(x[3]);
			// System.out.println(x[4]);
			// System.out.println(x[5]);
			// System.out.println(x[6]);
			// i++;
			// System.out.println("count=" + i);
			// }
			// System.out.println("count=" + i);
			// count test

			// int result= new ProjectDaoHibernate(sessionFactory).selectForProjCount();
			// System.out.println(result);
//			 System.out.println(new
//			 ProjectDaoHibernate(sessionFactory).selectProjectKeyword("程式"));

			// insert測試...............................
			// bean.setMemid(1);
			// .........
			// SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			// long time = format.parse("2018-01-31").getTime();
			// Date date1 = new Date(time);
			// bean.setProjt(date1);
			// .........
			// long time2 = format.parse("2018-01-31").getTime();
			// Date date2 = new Date(time2);
			// bean.setProjstartt(date2);
			// ..........
			// long time3 = format.parse("2018-01-31").getTime();
			// Date date3 = new Date(time3);
			// bean.setProjendt(date3);
			// .........
			// bean.setProjco
			// bean.setProjname("測試塞圖片2");
			// String path
			// ="C:\\JavaFramework\\eclipse-workspace\\FinalProject\\src\\main\\webapp\\component\\images\\ad1.png";
			// byte[] projimg = Files.readAllBytes(new File(path).toPath());
			// bean.setProjimg(projimg);
			//
			// System.out.println(new ProjectDaoHibernate(sessionFactory).insertImg(bean));
			// System.out.println(new
			// ProjectDaoHibernate(sessionFactory).insertByBean(bean));

			// update測試
			// bean.setProjname("測試update");
			// bean.setId(22);
			// System.out.println(new ProjectDaoHibernate(sessionFactory).update(bean));
			
			//PACO測試 START
			System.out.println(new ProjectDaoHibernate(sessionFactory).selectProjDesc(0));
			//PACO測試 END
			//////////////////// 測試程式結束///////////////////////////////////
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

	@Autowired
	private SessionFactory sessionFactory;

	public ProjectDaoHibernate() {

	}

	public ProjectDaoHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	static final String selectForProjCountHql = "select count(id) from ProjectBean";

	@Override
	public int selectForProjCount() {
		Query query = getSession().createQuery(selectForProjCountHql);
		int count = Integer.parseInt((query.uniqueResult()).toString());
		return count;

	}

	static final String selectForProjHomeHql = "FROM ProjectBean WHERE projstatus=:projstatus";

	@Override
	public List<ProjectBean> selectForProjHome(String projstatus, Integer x) {
		int y;
		if (x == 0) {
			y = 9;
		} else {
			y = 3;
		}
		Query<ProjectBean> query = getSession().createQuery(selectForProjHomeHql);
		query.setParameter("projstatus", projstatus);
		query.setFirstResult(x);
		query.setMaxResults(y);

		List<ProjectBean> ProjResult1 = query.list();
		for (ProjectBean ProjResult : ProjResult1) {
			System.out.println(ProjResult);
		}
		return ProjResult1;
	}

	static final String selectForProjResultHql = "from ProjectBean where projname like :keyWord and projstatus=:projstatus";

	@Override
	public List<ProjectBean> selectProjectKeyword(String keyWord) {
		keyWord = "%" + keyWord + "%";
		Query<ProjectBean> query = getSession().createQuery(selectForProjResultHql);
		query.setParameter("keyWord", keyWord);
		query.setParameter("projstatus", "執行中");
		return query.list();
		
	}

	public Integer insertByBean(ProjectBean bean) {
		return (Integer) getSession().save(bean);
	}

	@Override
	public ProjectBean insertImg(ProjectBean bean) {
		getSession().save(bean);
		return null;
	}

	static final String updateHql = "update ProjectBean set projname=:projname where id=:id";

	@Override
	public int update(ProjectBean bean) {
		Query query = getSession().createQuery(updateHql);
		query.setParameter("id", bean.getId());
		query.setParameter("projname", bean.getProjname());
		int count = query.executeUpdate();
		return count;
	}

	///// PACO的後台查詢---START
	static final String selectProjDescEnHQL = "SELECT p.id, p.projstartt, p.projendt, p.projname, p.projstatus FROM ProjectBean p ORDER BY p.projstatus desc";

	@Override
	public List<Object[]> selectProjDesc(Integer times) {
		Query<Object[]> query = getSession().createQuery(selectProjDescEnHQL);
		Integer howmany = null;
		if (times == 0) {
			howmany = 15;
		} else {
			howmany = 2;
		}
		System.out.println("times = " + times + "howmany = " + howmany);
		query.setFirstResult(times);
		query.setMaxResults(howmany);
		
		List<Object[]> returnselectProjDesc = query.list();
		return returnselectProjDesc;
	}
		///// PACO的後台查詢---END

	static final String selectAllByIdHql = "FROM ProjectBean WHERE id=:id";
	@Override
	public ProjectBean selectAllById(Integer id) {
		Query<ProjectBean> query = getSession().createQuery(selectAllByIdHql);
		query.setParameter("id", id);
		ProjectBean result = query.uniqueResult();
		return result;
	}

//	static final String updateStatusHQL = "update ProjectBean set projstatus=:projstatus where id=:id ";
	@Override
	public void updateStatus(Integer projid) {
		System.out.println("HQL Start");
		ProjectBean bean = getSession().get(ProjectBean.class,projid);
		bean.setProjstatus("執行中");
		System.out.println("HQL ENd");
	}
}

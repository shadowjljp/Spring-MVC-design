package model.dao;

import java.io.IOException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import model.AdvertisementBean;
import model.AuthorBean;
import model.ProductBean;
import model.ProductDAO;
import model.hibernate.HibernateUtil;

@Repository
public class ProductDaoHibernate implements ProductDAO {

	public static void main(String[] args) throws IOException {
		try {
			SessionFactory sessionfactory = HibernateUtil.getSessionfactory();
			sessionfactory.getCurrentSession().beginTransaction();
			// ..................測試程式開始........................................
			ProductDaoHibernate ProductDao = new ProductDaoHibernate(sessionfactory);
//			
			ProductBean bean = new ProductBean();

//			List<Object[]> result = new ProductDaoHibernate(sessionfactory).selectShoppingCart(1);
//			for(Object[] a:result) {
//				for(Object b:a) {
//					System.out.println("b="+b);
//				}
//			}

			
			List<Double> result = new ProductDaoHibernate(sessionfactory).selectProductCostById(1);
			
				Double a = result.get(0);
					System.out.println("a="+(Double)a);
				
			
//			ProductDao.selectBookByIdCross2Beans(1);
			
//			bean.setId(29);
//			System.out.println(new ProductDaoHibernate(sessionfactory).selectBookById(bean));
//			System.out.println(ProductDao.selectShowBooks());
			////////////////////

			// selectBookByBknamezhOrEn
			// System.out.println(new
			// ProductDaoHibernate(sessionfactory).selectBookByBknamezh("0"));

			// System.out.println(new ProductDaoHibernate(sessionfactory).selectBookDesc());

			// insert測試
			// bean.setId(12);
			// bean.setBknamezh("JIMMY測試用epub");
			// bean.setBknameen("EpubJimmy");
			// bean.setAuthorid(26);
			// bean.setTransid(26);
			// bean.setBklang("中文");
			// bean.setBkpublisher("桌面出版社");
			// bean.setFlag(2);
			// bean.setProdstock(500);
			// bean.setProdcost(300.0);
			// bean.setProdprice(350);
			// bean.setProddisc(0.87);
			// bean.setBkisbn("97894465233");
			// bean.setBkseries("改桌面叢書");
			// bean.setBkpage(265);
			// bean.setBkver("四版一刷");
			// bean.setBksize("25開");
			// bean.setBkwgt(1);
			// String path =
			// "D:\\bookimg\\06.jpg";
			// byte[] prodimg = Files.readAllBytes(new File(path).toPath());
			// bean.setProdimg(prodimg);
			// bean.setBkskin(null);
			// bean.setBkmenu(null);
			// bean.setBkintro(null);
			// String path2 =
			// "D:\\HELLO\\1.epub";
			// byte[] bkefile = Files.readAllBytes(new File(path2).toPath());
			// bean.setBkefile(bkefile);
			// bean.setAuthorintro("我是吉米");
			// bean.setTranslintro("我是吉米");
			// bean.setClassid(6);
			// bean.setBkstar(4.3);
			// System.out.println(new
			// ProductDaoHibernate(sessionfactory).insertByBean(bean));

			///////////////////////// write and test by Howard begin
			// bookName authorName bookISBN
			// ProductDaoHibernate ProductDao = new ProductDaoHibernate(sessionfactory);
			// ProductDao.selectBookByTagAndKeyWord("bookISBN", "9789571369273");
			// ProductDao.selectBookByTagAndKeyWord("authorName", "川普");
			// ProductDao.selectBookByTagAndKeyWord("bookName", "美國");
			// ProductDao.selectBookByTagAndKeyWord("", "2");
			//////////////////////////////////////// end

			// System.out.println(new
			// ProductDaoHibernate(sessionfactory).insertByBean(bean));
			// System.out.println(new ProductDaoHibernate(sessionfactory).update(bean));
			// System.out.println(new
			// ProductDaoHibernate(sessionfactory).updateBkStar(12,2.5));

			try {
				sessionfactory.getCurrentSession().getTransaction().commit();
			} catch (HibernateException e) {
				sessionfactory.getCurrentSession().getTransaction().rollback();
				e.printStackTrace();
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}

	private SessionFactory sessionFactory;

	public ProductDaoHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	////////////////////////////////// method write by Howard
	static final String selectBookByISBNHql = "from ProductBean pb left join AuthorBean ab on pb.authorid = ab.id where bkisbn like:keyWord";
	static final String selectBookByAuthorHql = "from ProductBean pb left join AuthorBean ab on pb.authorid = ab.id where authornamezh like:keyWord";
	static final String selectBookByBkNameHql = "from ProductBean pb left join AuthorBean ab on pb.authorid = ab.id where bknamezh like:keyWord";
	static final String selectBookByNoTagHql = "from ProductBean pb left join AuthorBean ab on pb.authorid = ab.id where pb.showorder IS NULL or pb.bknamezh like:keyWord or pb.bknamezh like:keyWord or ab.authornamezh like:keyWord or pb.bkisbn like:keyWord";

	// static final String selectBookByISBNHql="from ProductBean where bkisbn
	// like:bkisbn";
	@Override
	public List<Object[]> selectBookByTagAndKeyWord(String tag, String keyWord) {
		String hql = "";

		keyWord = "%" + keyWord + "%";
		// bookName authorName bookISBN
		if ("bookName".equals(tag)) {
			hql = selectBookByBkNameHql;
		} else if ("authorName".equals(tag)) {
			hql = selectBookByAuthorHql;
		} else if ("bookISBN".equals(tag)) {
			hql = selectBookByISBNHql;
		} else {
			hql = selectBookByNoTagHql;
		}

		if (hql != null && hql.length() > 0) {
			Query<?> query = getSession().createQuery(hql);
			query.setParameter("keyWord", keyWord);
			// System.out.println(query.list().size());

			List<Object[]> result = (List<Object[]>) query.list();

			if (result != null && !result.isEmpty()) {
				// System.out.println("-----------------------------------------");
				// System.out.println("book name = " + ((ProductBean)
				// result.get(0)[0]).getBknamezh());
				// System.out.println("-----------------------------------------");
				// System.out.println("author name = " + ((AuthorBean)
				// result.get(0)[1]).getAuthornamezh());
				return result;
			}
		}
		// System.out.println("there is nothing we can find!");
		return null;
	}

	private static String selectBookByIdCross2BeansHql = "FROM ProductBean pb LEFT JOIN AuthorBean ab ON pb.authorid = ab.id WHERE pb.id =:id";

	public Object[] selectBookByIdCross2Beans(Integer id) {

		Query query = getSession().createQuery(selectBookByIdCross2BeansHql);
		query.setParameter("id", id);

		Object[] result = (Object[]) query.getSingleResult();
		// System.out.println(result[0]);
		// System.out.println(result[1]);
		return result;
	}

	@Override
	public void switchShowOrder(Integer aId, Integer bId) {
		// TODO Auto-generated method stub
		ProductBean beanA = getSession().get(ProductBean.class, aId);
		ProductBean beanB = getSession().get(ProductBean.class, bId);

		if (beanA != null && beanB != null) {
			Integer tempOrder = beanA.getShoworder();
			beanA.setShoworder(beanB.getShoworder());
			beanB.setShoworder(tempOrder);
			System.out.println("list ShowOrder switch OK");
		}else {
			
			System.out.println("list ShowOrder switch fail");
		}

	}

	static final String selectShowBooksHql = "FROM ProductBean pb LEFT JOIN AuthorBean ab ON pb.authorid = ab.id WHERE pb.showorder>=1 AND pb.showorder<=12 ORDER BY showorder";

	@Override
	public List<Object[]> selectShowBooks() {
		Query<Object[]> query = getSession().createQuery(selectShowBooksHql);
		List<Object[]> result = query.list();
		return result;
	}

	//////////////////////////////////////////////// Howard
	//////////////////////////////////////////////// end/////////////////////////////////////////
	// @Override
	// public boolean insertBook(String bknamezh) {
	// return false;
	// }

	@Override
	public Integer insertByBean(ProductBean bean) {
		// System.out.println("Insert by Bean Start");
		Integer PK = (Integer) getSession().save(bean);
		System.out.println("Integer PK =" + PK);
		if (PK != null) {
			return PK;
		}
		// System.out.println("Insert by Bean Finish");
		return null;

	}

	static final String update = "update ProductBean set bknamezh=:bknamezh,bknameen=:bknameen,authorid=:authorid,transid=:transid,bklang=:bklang,bkpublisher=:bkpublisher,bkpubdate=:bkpubdate,flag=:flag,prodstock=:prodstock,prodcost=:prodcost,prodprice=:prodprice,proddisc=:proddisc,bkisbn=:bkisbn,bkseries=:bkseries,bkpage=:bkpage,bkver=:bkver,bksize=:bksize,bkwgt=:bkwgt,prodimg=:prodimg,bkskin=:bkskin,bkmenu=:bkmenu,bkintro=:bkintro,bkefile=:bkefile,authorintro=:authorintro,translintro=:translintro,classid=:classid where id=:id ";

	@Override
	public Integer update(ProductBean bean) {
		Query query = getSession().createQuery(update);
		query.setParameter("id", bean.getId());
		query.setParameter("bknamezh", bean.getBknamezh());
		query.setParameter("bknameen", bean.getBknameen());
		query.setParameter("authorid", bean.getAuthorid());
		query.setParameter("transid", bean.getTransid());
		query.setParameter("bklang", bean.getBklang());
		query.setParameter("bkpublisher", bean.getBkpubdate());
		query.setParameter("bkpubdate", bean.getBkpubdate());
		query.setParameter("flag", bean.getFlag());
		query.setParameter("prodstock", bean.getProdstock());
		query.setParameter("prodcost", bean.getProdcost());
		query.setParameter("prodprice", bean.getProdprice());
		query.setParameter("proddisc", bean.getProddisc());
		query.setParameter("bkisbn", bean.getBkisbn());
		query.setParameter("bkseries", bean.getBkseries());
		query.setParameter("bkpage", bean.getBkpage());
		query.setParameter("bkver", bean.getBkver());
		query.setParameter("bksize", bean.getBksize());
		query.setParameter("bkwgt", bean.getBkwgt());
		query.setParameter("prodimg", bean.getProdimg());
		query.setParameter("bkskin", bean.getBkskin());
		query.setParameter("bkmenu", bean.getBkmenu());
		query.setParameter("bkintro", bean.getBkintro());
		query.setParameter("bkefile", bean.getBkefile());
		query.setParameter("authorintro", bean.getAuthorintro());
		query.setParameter("translintro", bean.getTranslintro());
		query.setParameter("classid", bean.getClassid());
		int count = query.executeUpdate();
		return count;
	}

	static final String starHQL = "update ProductBean set bkstar=:bkstar where id=:id ";

	@Override
	public Integer updateBkStar(Integer id, Double star) {
		Query query = getSession().createQuery(starHQL);
		query.setParameter("id", id);
		query.setParameter("bkstar", star);
		int count = query.executeUpdate();
		return count;
	}

	static final String selectBookByIdHql = "from ProductBean where id=:id";

	@Override
	public ProductBean selectBookById(ProductBean bean) {
		Query<ProductBean> query = getSession().createQuery(selectBookByIdHql, ProductBean.class);
		query.setParameter("id", bean.getId());
//		System.out.println("query"+query.list());
		return query.uniqueResult();
	}

	static final String selectBookByBknamezhHQL = "FROM ProductBean p WHERE p.bknamezh LIKE :keyname order by p.id desc";

	@Override
	public List<ProductBean> selectBookByBknamezh(String getkeyname) {
		System.out.println("HQL Start、getkeyname = " + getkeyname);
		String keyname = "%" + getkeyname + "%";
		Query<ProductBean> query= getSession().createQuery(selectBookByBknamezhHQL);
		query.setParameter("keyname", keyname);
		List<ProductBean> returns = query.list();
		System.out.println("HQL End, returns = " + returns);
		
		return returns;
	}

	static final String selectBookDescEnHQL = "SELECT p.id, p.bknamezh, p.authorid, p.bkpubdate, p.bkisbn FROM ProductBean p ORDER BY p.id desc";
	static final String selectBookDescEnHQL2 = "SELECT p.id, p.bknamezh, ab.authornamezh, p.bkpubdate, p.bkisbn FROM ProductBean p left join AuthorBean ab on p.authorid = ab.id WHERE p.id>0 ORDER BY p.id desc";

	@Override
	public List<Object[]> selectBookDesc(Integer times) {

		Query<Object[]> query = getSession().createQuery(selectBookDescEnHQL2);
		Integer howmany = null;
		if (times == 0) {
			howmany = 10;
		} else {
			howmany = 2;
		}
		query.setFirstResult(times);
		query.setMaxResults(howmany);
		List<Object[]> returnselectBookDesc = query.list();
		return returnselectBookDesc;
	}
	static final String selectShoppingCart ="select prodstock , prodimg  , bknamezh from ProductBean where id=:id";
	@Override
	public List<Object[]> selectShoppingCart(Integer id) {

		Query<Object[]> query = getSession().createQuery(selectShoppingCart);
		query.setParameter("id", id);
		
		return query.list();
	}
	
	static final String selectProductCostById ="select prodcost from ProductBean where id=:id";
	@Override
	public List<Double> selectProductCostById(Integer id) {

		Query query = getSession().createQuery(selectProductCostById);
		query.setParameter("id", id);
		
		return query.list();
	}
}

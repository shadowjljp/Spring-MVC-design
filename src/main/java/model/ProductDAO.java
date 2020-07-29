package model;

import java.util.List;
import java.util.Map;

public interface ProductDAO {
	/////////// define by Howard
	public List<Object[]> selectBookByTagAndKeyWord(String tag, String keyWord);

	public Object[] selectBookByIdCross2Beans(Integer id);

	public void switchShowOrder(Integer aId, Integer bId);//後台編輯用

	public List<Object[]> selectShowBooks();//載入首頁用

	///////////// Howard End////////////////////

	public ProductBean selectBookById(ProductBean bean);

	public List<ProductBean> selectBookByBknamezh(String Name);

	public List<Object[]> selectBookDesc(Integer times);

	public Integer insertByBean(ProductBean bean);

	public Integer update(ProductBean bean);

	public Integer updateBkStar(Integer id, Double star);

	public List<Object[]> selectShoppingCart(Integer id);

	public List<Double> selectProductCostById(Integer id);

}

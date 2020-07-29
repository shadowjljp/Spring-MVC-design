package model;

import java.util.List;

public interface BookStarDAO {
	
	public abstract BookStarBean insert(BookStarBean bean);
	
	public List<Object[]> selectAvg(Integer id);
//	public List<BookStarBean> selectAvg(Integer id);

}

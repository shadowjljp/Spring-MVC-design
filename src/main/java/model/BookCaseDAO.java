package model;

import java.util.List;

public interface BookCaseDAO {
	
	public List<BookCaseBean> selectall(BookCaseBean bean);
	
	public BookCaseBean insertbook(BookCaseBean bean);
	
	public BookCaseBean updateshare(BookCaseBean bean);
	
	public List<Object[]> selectbk(Integer id);

}

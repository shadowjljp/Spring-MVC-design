package model;

import java.util.List;

public interface AuthorDAO {
	
	public List<AuthorBean> selectAuthorAndTranslator(String authornamezh);
	
	public int update(AuthorBean bean);
	
	public AuthorBean insert(AuthorBean bean);

	public Integer selectAuthorIdByName(String authornamezh);

	public Integer selectTransIdByName(String transname);
	
	public String selectAuthorIntroByID(Integer authorid);
	
	public String selectTransIntroByID(Integer transid);

	public Integer insertByNameTrans(AuthorBean bean);

	public Integer insertByNameAuthor(AuthorBean bean);
	
}

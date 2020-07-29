package model;

import java.util.List;

public interface ClassDAO {
	
	public ClassBean insert(ClassBean bean);
	
	public List<ClassBean> selectAll(ClassBean bean);
		
	public int update(ClassBean bean);
	
}

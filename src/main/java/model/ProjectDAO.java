package model;

import java.util.List;

public interface ProjectDAO {
	public List<ProjectBean> selectProjectKeyword(String keyWord);

	public List<ProjectBean> selectForProjHome(String projstatus, Integer x);

	public Integer insertByBean(ProjectBean bean);

	public ProjectBean insertImg(ProjectBean bean);
	
	public int update(ProjectBean bean);
	
	public void updateStatus(Integer projid);

	public int selectForProjCount();
	
	public List<Object[]> selectProjDesc(Integer times);
	
	public ProjectBean selectAllById(Integer id);

	

}

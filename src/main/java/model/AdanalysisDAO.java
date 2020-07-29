package model;

import java.util.List;

public interface AdanalysisDAO {
	
	public List<AdanalysisBean> selectcCordinateByTime(java.sql.Date beginTime, java.sql.Date endTime);
	
	public void insertCordinateWhileClick(AdanalysisBean bean);
	
}

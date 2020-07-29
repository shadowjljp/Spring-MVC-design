package model;

import java.util.List;

public interface LogisticsDAO {

	public List<LogisticsBean> select(LogisticsBean bean);

	public List<LogisticsBean> selectAll();

	public Integer insert(LogisticsBean bean);

	public int update(LogisticsBean bean);

	public int delete(LogisticsBean bean);

}

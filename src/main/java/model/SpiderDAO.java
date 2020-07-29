package model;

import java.util.List;

public interface SpiderDAO {
	public List<SpiderBean> select(SpiderBean bean);

	public List<SpiderBean> selectAll();

	public String insert(SpiderBean bean);

	public int update(SpiderBean bean);

	public int delete(SpiderBean bean);
}

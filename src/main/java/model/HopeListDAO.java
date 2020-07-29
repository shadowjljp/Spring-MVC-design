package model;

import java.util.List;

public interface HopeListDAO {
	public boolean insert(Integer ownerid,Integer bkid,java.util.Date jointime);
	Integer insertByBean(HopeListBean bean);
	public List<HopeListBean> selectHopeList(Integer ownerid);
	public int delete(HopeListBean bean);
}

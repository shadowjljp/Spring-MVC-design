package model;

import java.sql.Date;
import java.util.List;

public interface AdvertisementDAO {

	public AdvertisementBean insertAd(AdvertisementBean bean);

	public List<AdvertisementBean> selectAd(Date startDate, Date endDate, Integer zone);

	// public abstract AdvertisementBean selectAdrevenue(Integer adrevenue);

	public List<AdvertisementBean> selectAd(Date today, Integer zone);

	public List<Integer> selectAdrevenue(Date startTime, Date endTime);

	public Integer selectMaxId();

	public Boolean adOrderSwitch(Integer aId, Integer bId);

}

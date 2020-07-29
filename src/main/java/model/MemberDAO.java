package model;

import java.util.List;

public interface MemberDAO {
	
		public MemberBean selectmem(MemberBean bean);
//		登入、後台分析用
		
		public MemberBean insertaccount(MemberBean bean);
//		註冊用
		
		public MemberBean updateaccount(MemberBean bean);
//		改個人資料用

		public List<Object[]> selectAll();

		public String selectById(MemberBean bean);
//		抓會員資料用
}

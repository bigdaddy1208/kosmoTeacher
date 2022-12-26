package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.MymemberDTO;
import factory.FactoryService;

public class NaverDateDao {
	private static NaverDateDao dao;

	private NaverDateDao() {

	}

	public static NaverDateDao getDao() {
		if(dao == null)
			dao = new NaverDateDao();
		return dao;
	}
	
	public Map<String, Object> getlist(String today){
	
		SqlSession ss = FactoryService.getFactory().openSession();
		Map<String, Object> list = ss.selectOne("ndate.list",today);
		for(Map.Entry<String,Object> e : list.entrySet()) {
			System.out.println(e.getKey() + e.getValue());
		}
		ss.close();
		return list;
	}
	
	
	
	
	
	
	public String dday(String dday) {
		dday = dday+" 00:00:00";
		System.out.println("dday>>>> =>"+dday);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		String ddayRes = ss.selectOne("ndate.dday",dday);
		ss.close();
		return ddayRes;
	}
}

package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.EmpVO;
import dto.MymemberDTO;
import factory.FactoryService;
import factory.FactoryService2;

public class EmpDao {
	private static EmpDao dao;
	private EmpDao() {
	}
	public static synchronized EmpDao getDao() {
		if(dao == null)
			dao = new EmpDao();
		return dao;
	}
	public List<EmpVO> empList(Map<String, String> map) {
		SqlSession ss = FactoryService2.getFactory().openSession();
		List<EmpVO> list = ss.selectList("emp.list",map);
		ss.close();
		return list;
	}
}





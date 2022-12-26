package dao;

import org.apache.ibatis.session.SqlSession;

import dto.MymemberDTO;
import factory.FactoryService;

public class LoginDao {
	private static LoginDao dao;

	private LoginDao() {
	}

	public static synchronized LoginDao getDao() {
		if(dao == null)
			dao = new LoginDao();
		return dao;
	}
	// login 메서드 정의 해보기 
	// 
	// <select id="login" parameterType="mvo" resultType="int">
	// select count(*) from mymember where id=#{id} and pwd=#{pwd}
	public int login(MymemberDTO mvo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("mymem.login", mvo);
		ss.close();
		return cnt;
	}
}





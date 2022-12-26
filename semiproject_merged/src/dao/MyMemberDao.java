package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.MymemberDTO;
import dto.PageSearchDTO;
import factory.FactoryService;

public class MyMemberDao {
	private static MyMemberDao dao;
	private MyMemberDao() {
	}
	public static MyMemberDao getDao() {
		if(dao == null) {
			dao = new MyMemberDao();
		}
		return dao;
	}
	public void addMember(MymemberDTO vo) {
		//MyBatis���� ������ SqlSessionFactory���� SqlSession�� ��ȯ �޴´�.
		SqlSession ss = FactoryService.getFactory().openSession();
		//memberMap.xml�� insert ��Ҹ� �����ؼ� ���� �ѱ��.
		ss.insert("mymem.add", vo);
		ss.commit();
		ss.close();
		
	}
	
	public void modifymember(MymemberDTO vo) {
		//MyBatis���� ������ SqlSessionFactory���� SqlSession�� ��ȯ �޴´�.
		SqlSession ss = FactoryService.getFactory().openSession();
		//memberMap.xml�� insert ��Ҹ� �����ؼ� ���� �ѱ��.
		ss.insert("mymem.add", vo);
		ss.commit();
		ss.close();
		
	}
	
	public List<MymemberDTO> listMember(Map<String, String> map){
		SqlSession ss = FactoryService.getFactory().openSession();
		//Ŀ���� �ݺ��ϸ鼭 MymemberDTO ���� �� List�� ��Ƽ� ��ȯ ���� ***** 
		List<MymemberDTO> list = ss.selectList("mymem.list",map);
		ss.close();
		return list;
	}
	// page ó���� ���� Dao�� �޼��带 ���� �غ��ô�. �޼��� �̸� getList
	// <select id="listpage" resultType="mvo"  parameterType="map">
	public List<MymemberDTO> getList(Map<String, Integer> map){
		SqlSession ss = FactoryService.getFactory().openSession();
		List<MymemberDTO> list = ss.selectList("mymem.listpage",map);
		ss.close();
		return list;
	}
	// ��ü total�� ��ȯ 
	public int getCnt(){
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("mymem.totalCount");
		ss.close();
		return cnt;
	}
	public List<MymemberDTO> getSearchList(PageSearchDTO vo){
		SqlSession ss = FactoryService.getFactory().openSession();
		List<MymemberDTO> list = ss.selectList("mymem.listSearchpage",vo);
		ss.close();
		return list;
	}
	public int getCnt(PageSearchDTO vo){
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("mymem.totalCount2",vo);
		ss.close();
		return cnt;
	}
	
	// detail, idcheck�� �������� ���� ���� => selectOne���
	public int idCheck(String id) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("mymem.idChk",id);
		ss.close();
		return cnt;
	}
	//<select id="myPage" parameterType="String" resultType="mvo">
	public MymemberDTO myPage(String pid) {
		SqlSession ss = FactoryService.getFactory().openSession();
		MymemberDTO v = ss.selectOne("mymem.myPage", pid);
		ss.close();
		return v;
	}
}







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
		//MyBatis설정 파일인 SqlSessionFactory에서 SqlSession을 반환 받는다.
		SqlSession ss = FactoryService.getFactory().openSession();
		//memberMap.xml에 insert 요소를 선택해서 값을 넘긴다.
		ss.insert("mymem.add", vo);
		ss.commit();
		ss.close();
		
	}
	
	public void modifymember(MymemberDTO vo) {
		//MyBatis설정 파일인 SqlSessionFactory에서 SqlSession을 반환 받는다.
		SqlSession ss = FactoryService.getFactory().openSession();
		//memberMap.xml에 insert 요소를 선택해서 값을 넘긴다.
		ss.insert("mymem.add", vo);
		ss.commit();
		ss.close();
		
	}
	
	public List<MymemberDTO> listMember(Map<String, String> map){
		SqlSession ss = FactoryService.getFactory().openSession();
		//커서를 반복하면서 MymemberDTO 저장 후 List에 담아서 반환 해줌 ***** 
		List<MymemberDTO> list = ss.selectList("mymem.list",map);
		ss.close();
		return list;
	}
	// page 처리를 위한 Dao의 메서드를 정의 해봅시다. 메서드 이름 getList
	// <select id="listpage" resultType="mvo"  parameterType="map">
	public List<MymemberDTO> getList(Map<String, Integer> map){
		SqlSession ss = FactoryService.getFactory().openSession();
		List<MymemberDTO> list = ss.selectList("mymem.listpage",map);
		ss.close();
		return list;
	}
	// 전체 total값 반환 
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
	
	// detail, idcheck의 공통점은 단일 쿼리 => selectOne사용
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







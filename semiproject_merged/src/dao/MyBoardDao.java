package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.MyBoardCommDTO;
import dto.MyBoardDTO;
import factory.FactoryService;

public class MyBoardDao {
	private static MyBoardDao dao;
	
	private MyBoardDao() {
	}

	public static synchronized MyBoardDao getDao() {
		if(dao==null) {
			dao = new MyBoardDao();
		}
		return dao;
	}
	
//====================================================
	//insert
	public void addBoard(MyBoardDTO vo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		ss.insert("myboard.add", vo);
		ss.commit();
		ss.close();
	}

	//list
	//<select id="list" resultType="myboard">
	public List<MyBoardDTO> listBoard() {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<MyBoardDTO> list = ss.selectList("myboard.list");
		ss.close();
		return list;	
	}

	//detail
	//<select id="detail" resultType="myboard" parameterType="int">
	public MyBoardDTO detailBoard(int num) {
		SqlSession ss = FactoryService.getFactory().openSession();
		MyBoardDTO vo = ss.selectOne("myboard.detail", num);
		ss.close();
		return vo;		
	}
	public void addBoardComm(MyBoardCommDTO vo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		ss.insert("myboard.addComm",vo);
		ss.commit();
		ss.close();
	}
	public List<MyBoardCommDTO> listCommBoard(int no){
		SqlSession ss = FactoryService.getFactory().openSession();
		List<MyBoardCommDTO> list = ss.selectList("myboard.listComm",no);
		ss.close();
		return list;
	}
	
	public MyBoardDTO deleteBoard(int num) {
		SqlSession ss = FactoryService.getFactory().openSession();
		MyBoardDTO vo = ss.selectOne("myboard.delete", num);
		ss.commit();
		ss.close();
		return vo;
	}
	
}

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.MyConn;
import dto.UpBoardDTO;

public class UpBoardDao {
	private static UpBoardDao dao;
	private UpBoardDao() {
	// TODO Auto-generated constructor stub
    }
	public static synchronized UpBoardDao getDao() {
		if(dao == null) {
			dao = new UpBoardDao();
		}
		return dao;
	}
	public void addUpBoard(UpBoardDTO vo) {
		//insert into upboard values(upboard_seq.nextVal,'sub','writer','pwd','cont','imgn',sysdate)
		String sql ="insert into upboard values(upboard_seq.nextVal,?,?,?,?,?,sysdate)";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = MyConn.getConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getSub());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getPwd());
			pstmt.setString(4, vo.getCont());
			pstmt.setString(5, vo.getImgn());
			//3-2 ���ε� ó�� -> insert, update, delete 
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
	}
	
	public ArrayList<UpBoardDTO> upBoardList(){
		ArrayList<UpBoardDTO> arlist = new ArrayList<UpBoardDTO>();
		String sql ="select num,sub,writer,imgn,udate from upboard order by num desc";
		try (Connection con = MyConn.getConn()){
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				UpBoardDTO v = new UpBoardDTO();
				v.setNum(rs.getInt("num"));
				v.setSub(rs.getString("sub"));
				v.setWriter(rs.getString("writer"));
				v.setImgn(rs.getString("imgn"));
				v.setUdate(rs.getString("udate"));
				arlist.add(v);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arlist;
	}
	
	public UpBoardDTO upBoardDetail(int num) {
		String sql ="select num,sub,writer,imgn,cont,udate from upboard  where num= ?";
		// �ϳ��� row�� ��Ƴ��� ���� ��ü
		UpBoardDTO v = new UpBoardDTO();
		// ����
		try (Connection con = MyConn.getConn()){
			PreparedStatement pstmt = con.prepareStatement(sql);
			//bind�غ��� 
			pstmt.setInt(1, num);
			// Ŀ�� �ޱ� 
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				// column�����͸� v�� ����
				v.setNum(rs.getInt("num"));
				v.setSub(rs.getString("sub"));
				v.setWriter(rs.getString("writer"));
				v.setCont(rs.getString("cont"));
				v.setImgn(rs.getString("imgn"));
				v.setUdate(rs.getString("udate"));
			}
		}catch (Exception e) {
			e.printStackTrace(); //�ݵ�� ǥ��
		}//��ȯ
		return v;
	}
	
}

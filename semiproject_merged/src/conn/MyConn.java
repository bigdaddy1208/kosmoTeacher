package conn;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MyConn {
	//Connection Pool에서 Connection 하나 가져와서 오라클에 접속을 해주는 객체
	// DataSouce객체를 선언한다.
	private static DataSource ds;
	// main메서드 보다 먼저 실행 되는 영역 > static 초기화 
	static {
		try {
			System.out.println("초기화 시작");
			InitialContext ctx = new InitialContext();
			//JNDI방식으로 해당 이름으로  context.xml에 설정된 DataSource객체를 찾아 온다.
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myora");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	// DataSource를 통해서 오라클에 접속할 수 있는 Connection 객체를 반환 받는다.
	// 반환 되는 시점에서는 이미 오라클 서버에 접속된 Connection이다.
	public static Connection getConn() throws SQLException {
		return ds.getConnection();
	}

}







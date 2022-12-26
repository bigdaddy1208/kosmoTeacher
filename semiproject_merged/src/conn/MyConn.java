package conn;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MyConn {
	//Connection Pool���� Connection �ϳ� �����ͼ� ����Ŭ�� ������ ���ִ� ��ü
	// DataSouce��ü�� �����Ѵ�.
	private static DataSource ds;
	// main�޼��� ���� ���� ���� �Ǵ� ���� > static �ʱ�ȭ 
	static {
		try {
			System.out.println("�ʱ�ȭ ����");
			InitialContext ctx = new InitialContext();
			//JNDI������� �ش� �̸�����  context.xml�� ������ DataSource��ü�� ã�� �´�.
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myora");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	// DataSource�� ���ؼ� ����Ŭ�� ������ �� �ִ� Connection ��ü�� ��ȯ �޴´�.
	// ��ȯ �Ǵ� ���������� �̹� ����Ŭ ������ ���ӵ� Connection�̴�.
	public static Connection getConn() throws SQLException {
		return ds.getConnection();
	}

}







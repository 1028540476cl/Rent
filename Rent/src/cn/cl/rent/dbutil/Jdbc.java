package cn.cl.rent.dbutil;
import java.sql.Connection;
import java.sql.DriverManager;

public class Jdbc {

	private String dbUrl="jdbc:mysql://localhost:3306/rent";
	private String dbUserName="root";
	private String dbPassword="040677";
	private String jdbcName="com.mysql.jdbc.Driver";
	
	/**
	 * 连接数据库
	 * @return
	 * @throws Exception
	 */
	public  Connection getConn()throws Exception{
		Class.forName(jdbcName);
		Connection conn=DriverManager.getConnection(dbUrl,dbUserName,dbPassword);
		return conn;
	}
	
	public void close(Connection conn)throws Exception{
		if(conn!=null){
			conn.close();			
		}
	}
	
	
}

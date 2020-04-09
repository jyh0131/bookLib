package com.yi.jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;


public class DBCPInit extends HttpServlet {
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		loadJDBCDriver();
		initConnectionPool();
	}
	
	private void loadJDBCDriver() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			throw new RuntimeException("fail to load JDBC Driver", e);
		}
	}
	
	private void initConnectionPool() {
		try {
			String url = "jdbc:mysql://localhost:3306/yi_java3st_3team?" //DB이름
					+ "useUnicode=true&characterEncoding=utf8&useSSL=false";
			String user = "root";
			String pass= "rootroot";
			ConnectionFactory connFactory = new DriverManagerConnectionFactory(url, user, pass);
			PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
			
			// 커넥션을 검사할 때 사용할 쿼리를 설정한다.
			// 종료된 커넥션을 dbcp의 connection pool 에선 여전히 가지고 있는 상태일때,
			// DB 관련 프로그램이 호출되면 커넥션 관련 에러가 발생하게 된다.
			// java에서 DB를 사용하기 전에 해당 connection 이 정상적인지 검사를 하도록 하는 것
			// 이것이 아래의 옵션이다.
			// 우리는 따로 커리를 연결할 수 있지만, select 1은 Microsoft SQL Server에서 권장하는 방법이다.
			poolableConnFactory.setValidationQuery("select 1");
			
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			// 검사주기 : 일반적으로 10 ~ 30분 단위
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L*60L*5L); // 1000L*60L*5L -> 5분 (테스트용)
			// 유휴 커넥션 검사할 것인가? 여부 판단
			// 유요하지 않은 커넥션은 검사해서 연결을 끊어줘야함(제거)
			poolConfig.setTestWhileIdle(true);
			// 최소한 유휴 커넥션 갯수
			poolConfig.setMinIdle(4);
			// 커넥션의 전체 갯수
			poolConfig.setMaxTotal(50);
			
			GenericObjectPool<PoolableConnection> connectionPool = new GenericObjectPool<>(poolableConnFactory, poolConfig);
			poolableConnFactory.setPool(connectionPool);
			
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			
			// jdbc:apache:commons:dbcp:chap14 
			driver.registerPool("yi_java3st_3team", connectionPool); //커넥풀 이름 지정
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}

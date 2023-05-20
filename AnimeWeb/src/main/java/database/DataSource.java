package database;

import java.sql.Connection;

import java.sql.SQLException;
import java.util.ResourceBundle;


import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;


public class DataSource {
	private static final String DB_URL = "jdbc:mysql://ls-69e5f73b8620a395191d525c1e18007fa1bd4d1a.cyvzubrijdhx.ap-southeast-1.rds.amazonaws.com:3306/cnpm";
	private static final String USER = "dbmasteruser";
	private static final String PASS = "fx(B<lF~j=f01;&hO6AMh{yS_}0kT{76";
	private static final HikariConfig config = new HikariConfig();
	private static final String CLASS_NAME = "com.mysql.cj.jdbc.Driver";
	static HikariDataSource ds;
	

	static {

		config.setJdbcUrl(DB_URL);
		config.setUsername(USER);
		config.setPassword(PASS);
		config.setDriverClassName(CLASS_NAME);
		config.setMinimumIdle(20);

		config.setMaximumPoolSize(40);
		config.setConnectionTimeout(50000);
		config.addDataSourceProperty("cachePrepStmts", "true");
		config.addDataSourceProperty("prepStmtCacheSize", "250");
		config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
		config.setIdleTimeout(Long.MAX_VALUE);
		ds = new HikariDataSource(config);

	}
	
	private DataSource() {
	}

	public static void closeConnection() {
		ds.close();
	}

	public static Connection getConnection() throws SQLException {
		return ds.getConnection();
	}

	public static void main(String[] args) throws SQLException {
		System.out.println(DataSource.getConnection());
	}




}
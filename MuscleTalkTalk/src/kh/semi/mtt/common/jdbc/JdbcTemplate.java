package kh.semi.mtt.common.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JdbcTemplate {
	private static Connection conn = null;

	public static Connection getConnection() {
		try {
			Context initContext = new InitialContext();
			Context evnContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)evnContext.lookup("jdbc/MTTLocal");
//			DataSource ds = (DataSource)evnContext.lookup("jdbc/MTTPclass");
			conn = ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (conn == null) {
			System.out.println("connection fail");
		} else {
		}
		System.out.println("오라클 연결 확인");
		return conn;
	}

	public static void close(Connection conn) {
		try {
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rs) {
		try {
			if (rs != null && !rs.isClosed()) // todo
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void setAutocommit(Connection conn, boolean onoff) {
		try {
			if (conn != null)
				conn.setAutoCommit(onoff);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void commit(Connection conn) {
		try {
			if (conn != null)
				conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void rollback(Connection conn) {
		try {
			if (conn != null)
				conn.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

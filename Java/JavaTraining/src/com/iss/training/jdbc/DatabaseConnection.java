package com.iss.training.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

public class DatabaseConnection {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		MssqlConnection connector = new MssqlConnection();
		Connection connection = connector.connect();
		String sql = "select * from studentStats";
//		Statement statement = connection.createStatement();
		try (Statement statement = connection.createStatement()) {
			ResultSet result = statement.executeQuery(sql);
			while (result.next()) {
				String first_name = result.getString("FullName");
				System.out.println(first_name);
			}
		}
		
		
		PreparedStatement pstmt = null;
		try {
			pstmt = connection.prepareStatement(sql);
			ResultSet result = pstmt.executeQuery();
			while (result.next()) {
				String first_name = result.getString("FullName");
				System.out.println(first_name);
			}
		}
		finally {
			pstmt.close();
		}
		preparedstatementUsage(connection);
		callablestatementUsage(connection);
	}

	private static void callablestatementUsage(Connection conn) throws SQLException {
		CallableStatement cstmt = null;
		try {
		   String SQL = "{call MaxCountCategory (?)}";
		   cstmt = conn.prepareCall (SQL);
//		   cstmt.setString(1, "2017");
//		   cstmt.setString(2, "2018");
		   cstmt.registerOutParameter(1,Types.INTEGER); 
		   cstmt.execute();  
		   
		   System.out.println(cstmt.getInt(1));  
		}
		catch (SQLException e) {
		   System.out.println(e);
		}
		finally {
		   if(cstmt!=null) cstmt.close();
		}
		
	}

	private static void preparedstatementUsage(Connection connection) throws SQLException {
		String sql = "update t1 set DOB = ? where id = ?";

		PreparedStatement preparedStatement =
		  connection.prepareStatement(sql);
		
		preparedStatement.setDate(1, new Date(101,8,22));
		preparedStatement.setString(2, "1");
		int rowsAffected = preparedStatement.executeUpdate();
		System.out.println(rowsAffected);
		preparedStatement.setDate(1, new Date(104,8,22));
		preparedStatement.setString(2, "3");

		rowsAffected = preparedStatement.executeUpdate();
		System.out.println(rowsAffected);
	}

}

class MssqlConnection {
	private String user = "Jan23TrainingDB18";
	private String dbName = "Jan23TrainingDB18";
	private String password = "Jan23TrainingDB18";
	private String serverName = "IN1-GOV-WSQL120.ad-dev.issgovernance.com";
	private String url = "jdbc:sqlserver://" + serverName + ":4400;DatabaseName=" + dbName + ";encrypt=true;user="
			+ user + ";password=" + password + ";trustServerCertificate=true";

	public MssqlConnection() throws ClassNotFoundException {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	}

	public Connection connect() throws SQLException {

		Connection connection = DriverManager.getConnection(url);
		return connection;

	}

	public ResultSet getStudentsStats(Connection conn) throws SQLException {
		try (Statement statement = conn.createStatement()) {
			String sql = "select * from studentStats";
			ResultSet result = statement.executeQuery(sql);
			return result;
		}
	}
}
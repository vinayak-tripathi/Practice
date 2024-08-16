package com.iss.training.jdbc;

import java.sql.*;
import java.util.Properties;

public class JdbcExample {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
//		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String serverName = "IN1-GOV-WSQL120.ad-dev.issgovernance.com";
		String port = "4400";// database specific url.
		String user = "Jan23TrainingDB18";
		String dbName = "Jan23TrainingDB18";
		String password = "Jan23TrainingDB18";
//		String connectionUrl = "jdbc:sqlserver://" + serverName + ":" + port + ";databaseName=" + dbName + 
//				";user="+ user + ";password=" + password + ";encrypt=false;trustServerCertificate=true";
		Properties properties = new Properties();
		properties.put("user", user);
		properties.put("password", password);
		properties.put("databaseName", dbName);
//		properties.put("encrypt", "false");
//		properties.put(trustServerCertificate","true");
		
		try (Connection connection = DriverManager.getConnection("jdbc:sqlserver://"+serverName+":"+port,properties)) {
			try (Statement statement = connection.createStatement()) {
				String sql = "select * from student;";
				
				try (ResultSet result = statement.executeQuery(sql)) {
					while (result.next()) {
						String first_name = result.getString("FirstName");
						String last_name = result.getString("LastName");
						System.out.println(first_name+" "+last_name);
					}
					
				}
			}
			connection.setAutoCommit(true);
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}

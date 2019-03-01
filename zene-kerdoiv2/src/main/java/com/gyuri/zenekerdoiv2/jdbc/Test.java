package com.gyuri.zenekerdoiv2.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class Test {

	public static void main(String[] args) {
		String jdbcUrl = "jdbc:mysql://localhost:3306/zene-kerdoiv?useSSL=false&serverTimezone=UTC";
		String user="springstudent";
		String password="springstudent";
		
		try {
			System.out.println("Connecting to database: " + jdbcUrl);
			Connection myConn=DriverManager.getConnection(jdbcUrl, user, password);
			System.out.println("Connection succesful!!!");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}

package com.example.cnw.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DButils {
    private static final String JDBC_URL = "jdbc:mysql://sql12.freesqldatabase.com:3306/sql12667481";
    private static final String USERNAME = "sql12667481";
    private static final String PASSWORD = "MfHMvLQxGw";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Error loading MySQL JDBC driver");
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
    }

    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

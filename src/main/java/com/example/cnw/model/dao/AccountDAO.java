package com.example.cnw.model.dao;

import com.example.cnw.model.bean.Account;
import com.example.cnw.utils.DButils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO {
    private final String GET_USER = "SELECT * FROM Accounts WHERE email = ? AND password = ?";

    public Account isValidUser(String email, String password) {
        Account account = null;
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_USER)) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    account = new Account();
                    account.setAccountId(resultSet.getInt("account_id"));
                    account.setEmail(resultSet.getString("email"));
                    account.setPassword(resultSet.getString("password"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }
}

package com.example.cnw.model.dao;

import com.example.cnw.model.bean.Account;
import com.example.cnw.model.bean.Job;
import com.example.cnw.utils.DButils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO {
    private final String GET_USER = "SELECT * FROM Accounts WHERE email = ? AND password = ?";

    private final String ADD_ACCOUNT = "INSERT INTO Accounts (email, password, role) VALUES (?, ?, ?)";

    private final String GET_ID_CANDIDATE = "SELECT candidate_id FROM Candidates WHERE account_id = ?";
    private final String GET_ID_COMPANY= "SELECT company_id FROM companies WHERE account_id = ?";

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
                    account.setRole(resultSet.getString("role"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    public Account addAccount(Account account) {
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_ACCOUNT, PreparedStatement.RETURN_GENERATED_KEYS)) {

            preparedStatement.setString(1, account.getEmail());
            preparedStatement.setString(2, account.getPassword());
            preparedStatement.setString(3, account.getRole());
            preparedStatement.executeUpdate();

            ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int accountId = generatedKeys.getInt(1);

                account.setAccountId(accountId);

                return account;
            } else {
                throw new SQLException("Failed to retrieve generated keys, account not added.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public int getIdCandidate(int accountId) {
        int candidateId = 0;
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ID_CANDIDATE)) {
            preparedStatement.setInt(1, accountId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    candidateId = resultSet.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return candidateId;
    }

    public int getIdCompany(int accountId) {
        int companyId = 0;
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ID_COMPANY)) {
            preparedStatement.setInt(1, accountId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    companyId = resultSet.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return companyId;
    }
}

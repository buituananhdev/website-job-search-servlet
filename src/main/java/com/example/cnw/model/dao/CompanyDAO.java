package com.example.cnw.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.example.cnw.utils.DButils;
import com.example.cnw.model.bean.Company;
public class CompanyDAO {
    private final String GET_ALL_COMPANIES = "SELECT * FROM Companies";
    private final String GET_COMPANY_BY_ID = "SELECT * FROM Companies WHERE company_id=?";
    private final String ADD_COMPANY = "INSERT INTO Companies (name, description, location, account_id) VALUES (?, ?, ?, ?)";
    private final String UPDATE_COMPANY = "UPDATE Companies SET name=?, description=?, location=?, account_id=? WHERE company_id=?";
    private final String DELETE_COMPANY = "DELETE FROM Companies WHERE company_id=?";

    public List<Company> getAllCompanies() {
        List<Company> companies = new ArrayList<>();
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_COMPANIES);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Company company = mapResultSetToCompany(resultSet);
                companies.add(company);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return companies;
    }

    public Company getCompanyById(int companyId) {
        Company company = null;
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_COMPANY_BY_ID)) {
            preparedStatement.setInt(1, companyId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    company = mapResultSetToCompany(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return company;
    }

    public void addCompany(Company company) {
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_COMPANY, PreparedStatement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, company.getName());
            preparedStatement.setString(2, company.getDescription());
            preparedStatement.setString(3, company.getLocation());
            preparedStatement.setInt(4, company.getAccountId());

            preparedStatement.executeUpdate();

            // Get auto-generated company_id
            ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int generatedCompanyId = generatedKeys.getInt(1);
                company.setCompanyId(generatedCompanyId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCompany(Company company) {
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_COMPANY)) {
            preparedStatement.setString(1, company.getName());
            preparedStatement.setString(2, company.getDescription());
            preparedStatement.setString(3, company.getLocation());
            preparedStatement.setInt(4, company.getAccountId());
            preparedStatement.setInt(5, company.getCompanyId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCompany(int companyId) {
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_COMPANY)) {
            preparedStatement.setInt(1, companyId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Company mapResultSetToCompany(ResultSet resultSet) throws SQLException {
        Company company = new Company();
        company.setCompanyId(resultSet.getInt("company_id"));
        company.setName(resultSet.getString("name"));
        company.setDescription(resultSet.getString("description"));
        company.setLocation(resultSet.getString("location"));
        company.setAccountId(resultSet.getInt("account_id"));
        return company;
    }
}

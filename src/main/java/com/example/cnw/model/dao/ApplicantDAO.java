package com.example.cnw.model.dao;

import com.example.cnw.model.bean.Applicant;
import com.example.cnw.utils.DButils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ApplicantDAO {
    private final String GET_APPLICANTS = "SELECT * FROM Applicants ";
    private final String ADD_APPLICANT = "INSERT INTO Applicants (candidate_id, job_id) VALUES (?, ?)";
    private final String CHECK_APPLICANT_QUERY = "SELECT COUNT(*) AS count FROM Applicants WHERE job_id = ? AND candidate_id = ?";

    public List<Applicant> getApplicants(int candidate_id, int company_id) {
        List<Applicant> applicantList = new ArrayList<>();
        String sqlQuery = GET_APPLICANTS;
        int paramValue = 0;
        if(candidate_id > 0) {
            sqlQuery += "WHERE candidate_id = ?";
            paramValue = candidate_id;
        } else if (company_id > 0) {
            sqlQuery += "WHERE job_id = ?";
            paramValue = company_id;
        }
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery)) {
            preparedStatement.setInt(1, paramValue);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Applicant applicant = new Applicant();
                    applicant.setApplicant_id(resultSet.getInt("applicant_id"));
                    applicant.setCandidate_id(resultSet.getInt("candidate_id"));
                    applicant.setJob_id(resultSet.getInt("job_id"));
                    applicantList.add(applicant);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applicantList;
    }

    public void addApplication(Applicant newApplicant) {
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_APPLICANT)) {
            preparedStatement.setInt(1, newApplicant.getCandidate_id());
            preparedStatement.setInt(2, newApplicant.getJob_id());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean isApplicantExists(int jobId, int candidateId) {
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CHECK_APPLICANT_QUERY)) {
            preparedStatement.setInt(1, jobId);
            preparedStatement.setInt(2, candidateId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt("count");
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi nếu cần
        }
        return false;
    }
}

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
    private final String GET_APPLICANTS_BY_ID_CANDIDATE = "SELECT * FROM Applicants WHERE candidate_id=?";
    private final String ADD_APPLICANT = "INSERT INTO Applicants (candidate_id, job_id) VALUES (?, ?)";
    private final String DELETE_APPLICANT = "DELETE FROM Applicants WHERE applicant_id=?";

    public List<Applicant> getApplicantsByCandidateId(int candidate_id) {
        List<Applicant> applicantList = new ArrayList<>();
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_APPLICANTS_BY_ID_CANDIDATE)) {
            preparedStatement.setInt(1, candidate_id);
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

    public void deleteApplication(int applicantId) {
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_APPLICANT)) {
            preparedStatement.setInt(1, applicantId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

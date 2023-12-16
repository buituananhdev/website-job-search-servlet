package com.example.cnw.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.cnw.model.bean.Candidate;
import com.example.cnw.utils.DButils;

public class CandidateDAO {
    private final String GET_ALL_CANDIDATES = "SELECT * FROM Candidates";
    private final String GET_CANDIDATE_BY_ID = "SELECT * FROM Candidates WHERE candidate_id=?";
    private final String ADD_CANDIDATE = "INSERT INTO Candidates (name, email, phone, account_id) VALUES (?, ?, ?, ?)";
    private final String UPDATE_CANDIDATE = "UPDATE Candidates SET name=?, email=?, phone=?, account_id=? WHERE candidate_id=?";
    private final String DELETE_CANDIDATE = "DELETE FROM Candidates WHERE candidate_id=?";

    public List<Candidate> getAllCandidates() {
        List<Candidate> candidates = new ArrayList<>();
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_CANDIDATES);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Candidate candidate = mapResultSetToCandidate(resultSet);
                candidates.add(candidate);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return candidates;
    }

    public Candidate getCandidateById(int candidateId) {
        Candidate candidate = null;
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_CANDIDATE_BY_ID)) {
            preparedStatement.setInt(1, candidateId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    candidate = mapResultSetToCandidate(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return candidate;
    }

    public void addCandidate(Candidate candidate) {
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ADD_CANDIDATE, PreparedStatement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, candidate.getName());
            preparedStatement.setString(2, candidate.getEmail());
            preparedStatement.setString(3, candidate.getPhone());
            preparedStatement.setInt(4, candidate.getAccountId());

            preparedStatement.executeUpdate();

            // Get auto-generated candidate_id
            ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int generatedCandidateId = generatedKeys.getInt(1);
                candidate.setCandidateId(generatedCandidateId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCandidate(Candidate candidate) {
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CANDIDATE)) {
            preparedStatement.setString(1, candidate.getName());
            preparedStatement.setString(2, candidate.getEmail());
            preparedStatement.setString(3, candidate.getPhone());
            preparedStatement.setInt(4, candidate.getAccountId());
            preparedStatement.setInt(5, candidate.getCandidateId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCandidate(int candidateId) {
        try (Connection connection = DButils.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CANDIDATE)) {
            preparedStatement.setInt(1, candidateId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Candidate mapResultSetToCandidate(ResultSet resultSet) throws SQLException {
        Candidate candidate = new Candidate();
        candidate.setCandidateId(resultSet.getInt("candidate_id"));
        candidate.setName(resultSet.getString("name"));
        candidate.setEmail(resultSet.getString("email"));
        candidate.setPhone(resultSet.getString("phone"));
        candidate.setAccountId(resultSet.getInt("account_id"));
        return candidate;
    }
}

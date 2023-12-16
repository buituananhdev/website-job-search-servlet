package com.example.cnw.model.bo;

import java.util.List;

import com.example.cnw.model.bean.Candidate;
import com.example.cnw.model.dao.CandidateDAO;

public class CandidateBO {
    private CandidateDAO candidateDAO;

    public CandidateBO() {
        this.candidateDAO = new CandidateDAO();
    }

    public List<Candidate> getAllCandidates() {
        return candidateDAO.getAllCandidates();
    }

    public Candidate getCandidateById(int candidateId) {
        return candidateDAO.getCandidateById(candidateId);
    }

    public void addCandidate(Candidate candidate) {
        candidateDAO.addCandidate(candidate);
    }

    public void updateCandidate(Candidate candidate) {
        candidateDAO.updateCandidate(candidate);
    }

    public void deleteCandidate(int candidateId) {
        candidateDAO.deleteCandidate(candidateId);
    }
}

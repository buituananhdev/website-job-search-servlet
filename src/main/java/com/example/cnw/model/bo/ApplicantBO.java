package com.example.cnw.model.bo;

import com.example.cnw.model.bean.Applicant;
import com.example.cnw.model.dao.ApplicantDAO;

import java.util.List;

public class ApplicantBO {
    private ApplicantDAO ApplicantDAO;

    public ApplicantBO() {
        this.ApplicantDAO = new ApplicantDAO();
    }

    public List<Applicant> getApplicantsByCandidateId(int candidateId) {
        return ApplicantDAO.getApplicantsByCandidateId(candidateId);
    }
    public void addApplicant(Applicant applicant) {
        ApplicantDAO.addApplication(applicant);
    }
    public void deleteApplicant(int applicantId) {
        ApplicantDAO.deleteApplication(applicantId);
    }
}

package com.example.cnw.model.bean;

public class Candidate {
    private int candidateId;
    private String name;
    private String email;
    private String phone;
    private String password;

    // Constructor
    public Candidate() {
        // Default constructor
    }
    public Candidate(int candidateId, String name, String email, String phone, String password) {
        this.candidateId = candidateId;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.password = password;
    }

    // Getter methods
    public int getCandidateId() {
        return candidateId;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getPassword() {
        return password;
    }

    // Setter methods
    public void setCandidateId(int candidateId) {
        this.candidateId = candidateId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
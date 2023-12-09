package com.example.cnw.model.bean;

public class Account {
    private int accountId;
    private String email;
    private String password;


    // Constructor
    public Account() {
        // Default constructor
    }
    public Account(int accountId, String email, String password) {
        this.accountId = accountId;
        this.email = email;
        this.password = password;
    }

    // Getter for accountId
    public int getAccountId() {
        return accountId;
    }

    // Setter for accountId
    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    // Getter for email
    public String getEmail() {
        return email;
    }

    // Setter for email
    public void setEmail(String email) {
        this.email = email;
    }

    // Getter for password
    public String getPassword() {
        return password;
    }

    // Setter for password
    public void setPassword(String password) {
        this.password = password;
    }
}

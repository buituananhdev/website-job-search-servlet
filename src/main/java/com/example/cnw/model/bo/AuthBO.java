package com.example.cnw.model.bo;

import com.example.cnw.model.bean.AuthHelper;
import com.example.cnw.model.dao.AuthDAO;

public class AuthBO {
    private AuthDAO authDAO = new AuthDAO();
    public AuthHelper checkLogin(String username, String password) {
        return authDAO.login(username, password);
    }
    public int getRole(String username) {
        return authDAO.getRoleByUsername(username);
    }
}

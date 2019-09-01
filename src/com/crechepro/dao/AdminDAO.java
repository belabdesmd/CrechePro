package com.crechepro.dao;

import com.crechepro.bean.Employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {

    public static boolean adminExists(Connection connection) {
        boolean exists = false;

        try {
            PreparedStatement ps = connection.prepareStatement("select * from admin");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) exists = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return exists;
    }

    public static void createAdmin(Connection connection, Employee employee, String username, String password) {
        EmployeeDAO.createEmployee(connection, employee);

        int employee_id = 0;

        try {
            PreparedStatement getId = connection.prepareStatement("select id from employee where first_name = ? and last_name = ?");
            getId.setString(1, employee.getFirst_name());
            getId.setString(2, employee.getLast_name());

            ResultSet getIdResult = getId.executeQuery();

            while(getIdResult.next()){
                employee_id = getIdResult.getInt("id");
            }

            PreparedStatement createAdmin = connection.prepareStatement("insert into admin(username, password, employee_id) values(?,?,?)");
            createAdmin.setString(1, username);
            createAdmin.setString(2, password);
            createAdmin.setInt(3, employee_id);

            createAdmin.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static boolean adminLogin(Connection connection, String username, String password) {
        boolean logged = false;

        try {
            PreparedStatement ps = connection.prepareStatement("select * from admin where username = ? and password = ?");
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) logged = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return logged;
    }
}

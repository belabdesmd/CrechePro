package com.crechepro.dao;

import com.crechepro.bean.Employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    public static void createEmployee(Connection connection, Employee employee) {

        try {
            PreparedStatement ps = connection.prepareStatement(
                    "insert into employee(first_name, last_name, gender, birthday, email, address, phone) values(?,?,?,?,?,?,?)");

            ps.setString(1, employee.getFirst_name());
            ps.setString(2, employee.getLast_name());
            ps.setString(3, employee.getGender());
            ps.setString(4, employee.getBirthday());
            ps.setString(5, employee.getEmail());
            ps.setString(6, employee.getAddress());
            ps.setInt(7, employee.getPhone());

            int status = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Employee> getEmployees(Connection connection, boolean asc) {
        List<Employee> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement("select * from employee");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Employee employee = new Employee();
                employee.setId(rs.getInt("id"));
                employee.setFirst_name(rs.getString("first_name"));
                employee.setLast_name(rs.getString("last_name"));
                employee.setGender(rs.getString("gender"));
                employee.setBirthday(rs.getDate("birthday").toString());
                employee.setAddress(rs.getString("address"));
                employee.setEmail(rs.getString("email"));
                employee.setPhone(rs.getInt("phone"));
                list.add(employee);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

}

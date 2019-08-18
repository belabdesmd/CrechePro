package com.crechepro.dao;

import com.crechepro.bean.Parent;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ParentDAO {

    public static int getParentId(Connection connection, String status, String first_name, String last_name, String email, String address, String phone) {

        Parent parent = new Parent();
        parent.setStatus(status);
        parent.setFirst_name(first_name);
        parent.setLast_name(last_name);
        parent.setEmail(email);
        parent.setAddress(address);


        try {
            parent.setPhone(Integer.parseInt(phone));
        } catch (NumberFormatException e) {
            //Ignore
        }

        if (!parentExist(connection, parent))
            createParent(connection, parent);

        return getParent(connection, parent);
    }

    private static boolean parentExist(Connection connection, Parent parent) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                    "select id from parent where status=? and first_name=? and last_name=? and email=? and address=? and phone=?");
            ps.setString(1, parent.getStatus());
            ps.setString(2, parent.getFirst_name());
            ps.setString(3, parent.getLast_name());
            ps.setString(4, parent.getEmail());
            ps.setString(5, parent.getAddress());
            ps.setInt(6, parent.getPhone());

            ResultSet rs = ps.executeQuery();

            return rs.next();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private static int getParent(Connection connection, Parent parent) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                    "select id from parent where status=? and first_name=? and last_name=? and email=? and address=? and phone=?");
            ps.setString(1, parent.getStatus());
            ps.setString(2, parent.getFirst_name());
            ps.setString(3, parent.getLast_name());
            ps.setString(4, parent.getEmail());
            ps.setString(5, parent.getAddress());
            ps.setInt(6, parent.getPhone());

            ResultSet rs = ps.executeQuery();

            while (rs.next())
                return rs.getInt("id");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    private static void createParent(Connection connection, Parent parent) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                    "insert into parent(status, first_name, last_name, email, address, phone) values(?,?,?,?,?,?)");
            ps.setString(1, parent.getStatus());
            ps.setString(2, parent.getFirst_name());
            ps.setString(3, parent.getLast_name());
            ps.setString(4, parent.getEmail());
            ps.setString(5, parent.getAddress());
            ps.setInt(6, parent.getPhone());
            int status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}

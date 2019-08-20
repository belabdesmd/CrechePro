package com.crechepro.dao;


import com.crechepro.bean.Child;
import com.crechepro.bean.Parent;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ChildDAO {

    public static List<Child> getChildren(Connection connection, int parentId) {
        List<Child> list = new ArrayList<Child>();
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement("select * from child where parentId=?");
            ps.setInt(1, parentId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Child child = new Child();
                child.setId(rs.getInt("id"));
                child.setFirst_name(rs.getString("first_name"));
                child.setLast_name(rs.getString("last_name"));
                child.setGender(rs.getString("gender"));
                child.setBirthday(rs.getDate("birthday").toString());

                list.add(child);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static void createChild(Connection connection, String first_name, String last_name, String gender, String date, Parent parent) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                    "insert into child(first_name, last_name, gender, birthday, parentId) values(?,?,?,?,?)");
            ps.setString(1, first_name);
            ps.setString(2, last_name);
            ps.setString(3, gender);
            ps.setString(4, date);
            ps.setInt(5, parent.getId());
            int status = ps.executeUpdate();

            try {
                PreparedStatement ps1 = connection.prepareStatement(
                        "select id from child where first_name=? and last_name=? and gender=? and birthday=? and parentId=?");
                ps1.setString(1, first_name);
                ps1.setString(2, last_name);
                ps1.setString(3, gender);
                ps1.setString(4, date);
                ps1.setInt(5, parent.getId());

                ResultSet rs1 = ps1.executeQuery();

                Child child = new Child();
                child.setFirst_name(first_name);
                child.setLast_name(last_name);
                child.setGender(gender);
                child.setBirthday(date);
                child.setParent(parent);

                while (rs1.next()) {
                    child.setId(rs1.getInt("id"));
                    ContractDAO.createContract(connection, child);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }


        } catch (Exception e) {
            System.out.println(e);
        }
    }

}

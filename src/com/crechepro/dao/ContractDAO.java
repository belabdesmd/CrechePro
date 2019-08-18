package com.crechepro.dao;

import com.crechepro.bean.Child;
import com.crechepro.bean.Contract;
import com.crechepro.bean.Parent;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ContractDAO {

    public static int createContract(Connection connection, int childId) {
        int status = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(
                    "insert into contract(childId) values(?)");
            ps.setInt(1, childId);
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static int deleteContract(Connection connection, int id) {
        int status = 0;
        try {
            PreparedStatement ps_child = connection.prepareStatement("select id, parentId from child where id = (select childId from contract where id=?)");
            ps_child.setInt(1, id);
            ResultSet res = ps_child.executeQuery();

            while(res.next()){

                //Deleting the Child
                PreparedStatement ps_delete_child = connection.prepareStatement("delete from child where id=?");
                ps_delete_child.setInt(1, res.getInt("id"));
                ps_delete_child.executeUpdate();

                //Searching if Parent Has another Child
                PreparedStatement ps_parent = connection.prepareStatement("select parentId from child where parentId=? ");
                ps_parent.setInt(1, id);
                ResultSet res_parent = ps_parent.executeQuery();

                //Parent for only one Child
                if (!res_parent.next()){
                    //Deleting the Parent
                    PreparedStatement ps_delete_parent = connection.prepareStatement("delete from parent where id=?");
                    ps_delete_parent.setInt(1, res.getInt("parentId"));
                    ps_delete_parent.executeUpdate();
                }

            }

            PreparedStatement ps = connection.prepareStatement("delete from contract where id=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        return status;
    }

    public static List<Contract> getContracts(Connection connection) {
        List<Contract> list = new ArrayList<Contract>();

        try {

            PreparedStatement ps = connection.prepareStatement("select * from contract");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Contract c = new Contract();
                c.setId(rs.getInt("id"));
                c.setBegin_date(rs.getDate("start_date").toString());
                c.setEnd_date(rs.getDate("end_date").toString());
                c.setDisabled(rs.getBoolean("disabled"));

                PreparedStatement ps1 = connection.prepareStatement("select * from child where id=?");
                ps1.setInt(1, rs.getInt("childId"));

                ResultSet rs1 = ps1.executeQuery();
                while (rs1.next()) {
                    Child child = new Child();
                    child.setId(rs1.getInt("id"));
                    child.setFirst_name(rs1.getString("first_name"));
                    child.setLast_name(rs1.getString("last_name"));
                    child.setBirthday(rs1.getDate("birthday").toString());
                    child.setGender(rs1.getString("gender"));

                    PreparedStatement ps2 = connection.prepareStatement("select * from parent where id=?");
                    ps2.setInt(1, rs1.getInt("parentId"));

                    ResultSet rs2 = ps2.executeQuery();

                    while (rs2.next()) {
                        Parent parent = new Parent();
                        parent.setId(rs2.getInt("id"));
                        parent.setFirst_name(rs2.getString("first_name"));
                        parent.setLast_name(rs2.getString("last_name"));
                        parent.setStatus(rs2.getString("status"));
                        parent.setEmail(rs2.getString("email"));
                        parent.setAddress(rs2.getString("address"));
                        parent.setPhone(rs2.getInt("phone"));

                        child.setParent(parent);
                    }

                    c.setChild(child);
                }
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}

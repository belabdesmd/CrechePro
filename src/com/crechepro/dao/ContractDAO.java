package com.crechepro.dao;

import com.crechepro.bean.Child;
import com.crechepro.bean.Contract;
import com.crechepro.bean.Parent;
import com.crechepro.utils.PDFUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ContractDAO {

    static void createContract(Connection connection, Child child) {
        int status = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(
                    "insert into contract(childId) values(?)");
            ps.setInt(1, child.getId());
            status = ps.executeUpdate();

            PreparedStatement ps1 = connection.prepareStatement(
                    "select * from contract where childId=?");
            ps1.setInt(1, child.getId());
            ResultSet rs = ps1.executeQuery();


            Contract contract = new Contract();
            while(rs.next()){
                contract.setBegin_date(rs.getDate("start_date").toString());
                contract.setEnd_date(rs.getDate("end_date").toString());
                contract.setChild(child);
            }

            PDFUtils.createDocument(contract);

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void deleteContract(Connection connection, int id) {
        try {
            System.out.println(id);
            PreparedStatement ps_child = connection.prepareStatement("select id, parentId from child where id = (select childId from contract where id=?)");
            ps_child.setInt(1, id);
            ResultSet res_child = ps_child.executeQuery();

            while (res_child.next()) {
                int child_id = res_child.getInt("id");
                int parent_id = res_child.getInt("parentId");

                System.out.println("deleting Child");
                //Deleting the Child
                PreparedStatement ps_delete_child = connection.prepareStatement("delete from child where id=?");
                ps_delete_child.setInt(1, child_id);
                ps_delete_child.executeUpdate();

                //Searching if Parent Has another Child
                System.out.println("Searching Parent");
                PreparedStatement ps_parent = connection.prepareStatement("select parentId from child where parentId=? ");
                ps_parent.setInt(1, parent_id);
                ResultSet res_parent = ps_parent.executeQuery();

                //Parent for only one Child
                if (!res_parent.next()) {
                    System.out.println("No Other children, Delete Parent");
                    //Deleting the Parent
                    PreparedStatement ps_delete_parent = connection.prepareStatement("delete from parent where id=?");
                    ps_delete_parent.setInt(1, parent_id);
                    ps_delete_parent.executeUpdate();
                }
            }
            System.out.println("Delete Contract");
            PreparedStatement ps = connection.prepareStatement("delete from contract where id=?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public static List<Contract> getContracts(Connection connection, boolean asc, boolean disabled) {
        List<Contract> list = new ArrayList<Contract>();

        try {
            PreparedStatement ps;
            if (disabled)
                ps = connection.prepareStatement("select * from contract where disabled = false");
            else if (asc)
                ps = connection.prepareStatement("select * from contract order by start_date ASC");
            else
                ps = connection.prepareStatement("select * from contract order by start_date DESC");
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

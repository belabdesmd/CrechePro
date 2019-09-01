package com.crechepro.dao;

import com.crechepro.bean.Activity;
import com.crechepro.bean.Planning;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class PlanningDAO {

    public static void createPlanning(Connection connection, String start_date, String end_date) {
        try {
            PreparedStatement ps = connection.prepareStatement("insert into planning(start_date, end_date) values(?,?)");
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date start = sdf1.parse(start_date);
            java.util.Date end = sdf1.parse(end_date);
            ps.setDate(1, new java.sql.Date(start.getTime()));
            ps.setDate(2, new java.sql.Date(end.getTime()));

            int status = ps.executeUpdate();
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
    }

    public static Planning getPlanning(Connection connection, String start_date, String end_date) {
        Planning planning = new Planning();

        try {
            PreparedStatement ps = connection.prepareStatement("select id from planning where start_date <= ? and end_date >= ?");

            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date start = sdf1.parse(start_date);
            java.util.Date end = sdf1.parse(end_date);
            ps.setDate(1, new java.sql.Date(start.getTime()));
            ps.setDate(2, new java.sql.Date(end.getTime()));

            ResultSet rs = ps.executeQuery();

            int planning_id = 0;
            while (rs.next()) {
                planning_id = rs.getInt("id");
            }

            //Get the Planning Content
            PreparedStatement content = connection.prepareStatement("select * from planning_activity where planning_id = ?");
            content.setInt(1, planning_id);

            ResultSet content_result = content.executeQuery();

            while (content_result.next()) {
                int activity_id = content_result.getInt("activity_id");
                PreparedStatement activity_content = connection.prepareStatement("select * from activity where id = ?");
                activity_content.setInt(1, activity_id);

                ResultSet activity_result = activity_content.executeQuery();

                Activity activity = new Activity();
                while (activity_result.next()) {
                    activity.setId(activity_id);
                    activity.setName(activity_result.getString("name"));
                    activity.setDescription(activity_result.getString("description"));
                    activity.setColor(activity_result.getString("color"));
                }

                //Set Planning Activities
                switch (content_result.getString("time")) {
                    case "8-10":
                        switch (content_result.getString("day")) {
                            case "Sun":
                                planning.setActivities_8_10(activity, 0);
                                break;
                            case "Mon":
                                planning.setActivities_8_10(activity, 1);
                                break;
                            case "Tue":
                                planning.setActivities_8_10(activity, 2);
                                break;
                            case "Wed":
                                planning.setActivities_8_10(activity, 3);
                                break;
                            case "Thu":
                                planning.setActivities_8_10(activity, 4);
                                break;
                            case "Fri":
                                planning.setActivities_8_10(activity, 5);
                                break;
                            case "Sat":
                                planning.setActivities_8_10(activity, 6);
                                break;
                        }
                        break;
                    case "10-12":
                        switch (content_result.getString("day")) {
                            case "Sun":
                                planning.setActivities_10_12(activity, 0);
                                break;
                            case "Mon":
                                planning.setActivities_10_12(activity, 1);
                                break;
                            case "Tue":
                                planning.setActivities_10_12(activity, 2);
                                break;
                            case "Wed":
                                planning.setActivities_10_12(activity, 3);
                                break;
                            case "Thu":
                                planning.setActivities_10_12(activity, 4);
                                break;
                            case "Fri":
                                planning.setActivities_10_12(activity, 5);
                                break;
                            case "Sat":
                                planning.setActivities_10_12(activity, 6);
                                break;
                        }
                        break;
                    case "12-14":
                        switch (content_result.getString("day")) {
                            case "Sun":
                                planning.setActivities_12_14(activity, 0);
                                break;
                            case "Mon":
                                planning.setActivities_12_14(activity, 1);
                                break;
                            case "Tue":
                                planning.setActivities_12_14(activity, 2);
                                break;
                            case "Wed":
                                planning.setActivities_12_14(activity, 3);
                                break;
                            case "Thu":
                                planning.setActivities_12_14(activity, 4);
                                break;
                            case "Fri":
                                planning.setActivities_12_14(activity, 5);
                                break;
                            case "Sat":
                                planning.setActivities_12_14(activity, 6);
                                break;
                        }
                        break;
                    case "14-16":
                        switch (content_result.getString("day")) {
                            case "Sun":
                                planning.setActivities_14_16(activity, 0);
                                break;
                            case "Mon":
                                planning.setActivities_14_16(activity, 1);
                                break;
                            case "Tue":
                                planning.setActivities_14_16(activity, 2);
                                break;
                            case "Wed":
                                planning.setActivities_14_16(activity, 3);
                                break;
                            case "Thu":
                                planning.setActivities_14_16(activity, 4);
                                break;
                            case "Fri":
                                planning.setActivities_14_16(activity, 5);
                                break;
                            case "Sat":
                                planning.setActivities_14_16(activity, 6);
                                break;
                        }
                        break;
                }
            }

        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }

        return planning;
    }

    public static Planning getPlanning(Connection connection, int id) {
        Planning planning = new Planning();

        try {
            //Get the Planning Content
            PreparedStatement content = connection.prepareStatement("select * from planning_activity where planning_id = ?");
            content.setInt(1, id);

            ResultSet content_result = content.executeQuery();

            while (content_result.next()) {
                int activity_id = content_result.getInt("activity_id");
                PreparedStatement activity_content = connection.prepareStatement("select * from activity where id = ?");
                activity_content.setInt(1, activity_id);

                ResultSet activity_result = activity_content.executeQuery();

                Activity activity = new Activity();
                while (activity_result.next()) {
                    activity.setId(activity_id);
                    activity.setName(activity_result.getString("name"));
                    activity.setDescription(activity_result.getString("description"));
                    activity.setColor(activity_result.getString("color"));
                }

                //Set Planning Activities
                switch (content_result.getString("time")) {
                    case "8-10":
                        switch (content_result.getString("day")) {
                            case "Sun":
                                planning.setActivities_8_10(activity, 0);
                                break;
                            case "Mon":
                                planning.setActivities_8_10(activity, 1);
                                break;
                            case "Tue":
                                planning.setActivities_8_10(activity, 2);
                                break;
                            case "Wed":
                                planning.setActivities_8_10(activity, 3);
                                break;
                            case "Thu":
                                planning.setActivities_8_10(activity, 4);
                                break;
                            case "Fri":
                                planning.setActivities_8_10(activity, 5);
                                break;
                            case "Sat":
                                planning.setActivities_8_10(activity, 6);
                                break;
                        }
                        break;
                    case "10-12":
                        switch (content_result.getString("day")) {
                            case "Sun":
                                planning.setActivities_10_12(activity, 0);
                                break;
                            case "Mon":
                                planning.setActivities_10_12(activity, 1);
                                break;
                            case "Tue":
                                planning.setActivities_10_12(activity, 2);
                                break;
                            case "Wed":
                                planning.setActivities_10_12(activity, 3);
                                break;
                            case "Thu":
                                planning.setActivities_10_12(activity, 4);
                                break;
                            case "Fri":
                                planning.setActivities_10_12(activity, 5);
                                break;
                            case "Sat":
                                planning.setActivities_10_12(activity, 6);
                                break;
                        }
                        break;
                    case "12-14":
                        switch (content_result.getString("day")) {
                            case "Sun":
                                planning.setActivities_12_14(activity, 0);
                                break;
                            case "Mon":
                                planning.setActivities_12_14(activity, 1);
                                break;
                            case "Tue":
                                planning.setActivities_12_14(activity, 2);
                                break;
                            case "Wed":
                                planning.setActivities_12_14(activity, 3);
                                break;
                            case "Thu":
                                planning.setActivities_12_14(activity, 4);
                                break;
                            case "Fri":
                                planning.setActivities_12_14(activity, 5);
                                break;
                            case "Sat":
                                planning.setActivities_12_14(activity, 6);
                                break;
                        }
                        break;
                    case "14-16":
                        switch (content_result.getString("day")) {
                            case "Sun":
                                planning.setActivities_14_16(activity, 0);
                                break;
                            case "Mon":
                                planning.setActivities_14_16(activity, 1);
                                break;
                            case "Tue":
                                planning.setActivities_14_16(activity, 2);
                                break;
                            case "Wed":
                                planning.setActivities_14_16(activity, 3);
                                break;
                            case "Thu":
                                planning.setActivities_14_16(activity, 4);
                                break;
                            case "Fri":
                                planning.setActivities_14_16(activity, 5);
                                break;
                            case "Sat":
                                planning.setActivities_14_16(activity, 6);
                                break;
                        }
                        break;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return planning;
    }

    public static int getPlanningId(Connection connection, String start_date, String end_date) {
        int id = 0;
        createPlanning(connection, start_date, end_date);
        try {
            PreparedStatement getId = connection.prepareStatement("select id from planning where start_date == ? and end_date == ?");
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date start = sdf1.parse(start_date);
            java.util.Date end = sdf1.parse(end_date);
            getId.setDate(1, new java.sql.Date(start.getTime()));
            getId.setDate(2, new java.sql.Date(end.getTime()));

            ResultSet rs = getId.executeQuery();

            while (rs.next()) {
                id = rs.getInt("id");
            }

        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        return id;
    }
}

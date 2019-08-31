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
                switch (content_result.getString("day")) {
                    case "Sun":
                        switch (content_result.getString("time")) {
                            case "8-10":
                                planning.setSundayActivities(activity, 0);
                                break;
                            case "10-12":
                                planning.setSundayActivities(activity, 1);
                                break;
                            case "12-14":
                                planning.setSundayActivities(activity, 2);
                                break;
                            case "14-16":
                                planning.setSundayActivities(activity, 3);
                                break;
                        }
                        break;
                    case "Mon":
                        switch (content_result.getString("time")) {
                            case "8-10":
                                planning.setMondayActivities(activity, 0);
                                break;
                            case "10-12":
                                planning.setMondayActivities(activity, 1);
                                break;
                            case "12-14":
                                planning.setMondayActivities(activity, 2);
                                break;
                            case "14-16":
                                planning.setMondayActivities(activity, 3);
                                break;
                        }
                        break;
                    case "Tue":
                        switch (content_result.getString("time")) {
                            case "8-10":
                                planning.setTuesdayActivities(activity, 0);
                                break;
                            case "10-12":
                                planning.setTuesdayActivities(activity, 1);
                                break;
                            case "12-14":
                                planning.setTuesdayActivities(activity, 2);
                                break;
                            case "14-16":
                                planning.setTuesdayActivities(activity, 3);
                                break;
                        }
                        break;
                    case "Wed":
                        switch (content_result.getString("time")) {
                            case "8-10":
                                planning.setWednesdayActivities(activity, 0);
                                break;
                            case "10-12":
                                planning.setWednesdayActivities(activity, 1);
                                break;
                            case "12-14":
                                planning.setWednesdayActivities(activity, 2);
                                break;
                            case "14-16":
                                planning.setWednesdayActivities(activity, 3);
                                break;
                        }
                        break;
                    case "Thu":
                        switch (content_result.getString("time")) {
                            case "8-10":
                                planning.setThursdayActivities(activity, 0);
                                break;
                            case "10-12":
                                planning.setThursdayActivities(activity, 1);
                                break;
                            case "12-14":
                                planning.setThursdayActivities(activity, 2);
                                break;
                            case "14-16":
                                planning.setThursdayActivities(activity, 3);
                                break;
                        }
                        break;
                    case "Fri":
                        switch (content_result.getString("time")) {
                            case "8-10":
                                planning.setFridayActivities(activity, 0);
                                break;
                            case "10-12":
                                planning.setFridayActivities(activity, 1);
                                break;
                            case "12-14":
                                planning.setFridayActivities(activity, 2);
                                break;
                            case "14-16":
                                planning.setFridayActivities(activity, 3);
                                break;
                        }
                        break;
                    case "Sat":
                        switch (content_result.getString("time")) {
                            case "8-10":
                                planning.setSaturdayActivities(activity, 0);
                                break;
                            case "10-12":
                                planning.setSaturdayActivities(activity, 1);
                                break;
                            case "12-14":
                                planning.setSaturdayActivities(activity, 2);
                                break;
                            case "14-16":
                                planning.setSaturdayActivities(activity, 3);
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

}

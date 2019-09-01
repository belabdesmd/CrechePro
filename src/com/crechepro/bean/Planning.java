package com.crechepro.bean;

import java.util.ArrayList;

public class Planning {
    private int id;
    private String start_date;
    private String end_date;

    private ArrayList<Activity> activities_8_10 = new ArrayList<>();
    private ArrayList<Activity> activities_10_12 = new ArrayList<>();
    private ArrayList<Activity> activities_12_14 = new ArrayList<>();
    private ArrayList<Activity> activities_14_16 = new ArrayList<>();

    public Planning() {
        activities_8_10.add(null);
        activities_8_10.add(null);
        activities_8_10.add(null);
        activities_8_10.add(null);
        activities_8_10.add(null);
        activities_8_10.add(null);
        activities_8_10.add(null);

        activities_10_12.add(null);
        activities_10_12.add(null);
        activities_10_12.add(null);
        activities_10_12.add(null);
        activities_10_12.add(null);
        activities_10_12.add(null);
        activities_10_12.add(null);

        activities_12_14.add(null);
        activities_12_14.add(null);
        activities_12_14.add(null);
        activities_12_14.add(null);
        activities_12_14.add(null);
        activities_12_14.add(null);
        activities_12_14.add(null);

        activities_14_16.add(null);
        activities_14_16.add(null);
        activities_14_16.add(null);
        activities_14_16.add(null);
        activities_14_16.add(null);
        activities_14_16.add(null);
        activities_14_16.add(null);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public void setActivities_8_10(Activity activity, int position) {
        activities_8_10.set(position, activity);
    }

    public void setActivities_10_12(Activity activity, int position) {
        activities_10_12.set(position, activity);
    }

    public void setActivities_12_14(Activity activity, int position) {
        activities_12_14.set(position, activity);
    }

    public void setActivities_14_16(Activity activity, int position) {
        activities_14_16.set(position, activity);
    }

    public ArrayList<Activity> getActivities_8_10() {
        return activities_8_10;
    }

    public ArrayList<Activity> getActivities_10_12() {
        return activities_10_12;
    }

    public ArrayList<Activity> getActivities_12_14() {
        return activities_12_14;
    }

    public ArrayList<Activity> getActivities_14_16() {
        return activities_14_16;
    }
}

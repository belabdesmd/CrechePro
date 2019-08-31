package com.crechepro.bean;

import java.util.ArrayList;

public class Planning {
    private int id;
    private String start_date;
    private String end_date;
    private ArrayList<Activity> sunday;
    private ArrayList<Activity> monday;
    private ArrayList<Activity> tuesday;
    private ArrayList<Activity> wednesday;
    private ArrayList<Activity> thursday;
    private ArrayList<Activity> friday;
    private ArrayList<Activity> saturday;

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
}

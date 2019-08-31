package com.crechepro.bean;

import java.util.ArrayList;

public class Planning {
    private int id;
    private String start_date;
    private String end_date;
    private ArrayList<Activity> sunday = new ArrayList<>();
    private ArrayList<Activity> monday = new ArrayList<>();
    private ArrayList<Activity> tuesday = new ArrayList<>();
    private ArrayList<Activity> wednesday = new ArrayList<>();
    private ArrayList<Activity> thursday = new ArrayList<>();
    private ArrayList<Activity> friday = new ArrayList<>();
    private ArrayList<Activity> saturday = new ArrayList<>();

    public Planning() {
        sunday.add(null);
        sunday.add(null);
        sunday.add(null);
        sunday.add(null);

        monday.add(null);
        monday.add(null);
        monday.add(null);
        monday.add(null);

        tuesday.add(null);
        tuesday.add(null);
        tuesday.add(null);
        tuesday.add(null);

        wednesday.add(null);
        wednesday.add(null);
        wednesday.add(null);
        wednesday.add(null);

        thursday.add(null);
        thursday.add(null);
        thursday.add(null);
        thursday.add(null);

        friday.add(null);
        friday.add(null);
        friday.add(null);
        friday.add(null);

        saturday.add(null);
        saturday.add(null);
        saturday.add(null);
        saturday.add(null);
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

    public void setSundayActivities(Activity activity, int position) {
        sunday.set(position, activity);
    }

    public void setMondayActivities(Activity activity, int position) {
        monday.set(position, activity);
    }

    public void setTuesdayActivities(Activity activity, int position) {
        tuesday.set(position, activity);
    }

    public void setWednesdayActivities(Activity activity, int position) {
        wednesday.set(position, activity);
    }

    public void setThursdayActivities(Activity activity, int position) {
        thursday.set(position, activity);
    }

    public void setFridayActivities(Activity activity, int position) {
        friday.set(position, activity);
    }

    public void setSaturdayActivities(Activity activity, int position) {
        saturday.set(position, activity);
    }

    public ArrayList<Activity> getSunday() {
        return sunday;
    }

    public ArrayList<Activity> getMonday() {
        return monday;
    }

    public ArrayList<Activity> getTuesday() {
        return tuesday;
    }

    public ArrayList<Activity> getWednesday() {
        return wednesday;
    }

    public ArrayList<Activity> getThursday() {
        return thursday;
    }

    public ArrayList<Activity> getFriday() {
        return friday;
    }

    public ArrayList<Activity> getSaturday() {
        return saturday;
    }
}

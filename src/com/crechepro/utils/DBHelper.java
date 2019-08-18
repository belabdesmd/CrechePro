package com.crechepro.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBHelper {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/creche?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            con = DriverManager
                    .getConnection(connectionURL, "root", "abdessamed");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }

}

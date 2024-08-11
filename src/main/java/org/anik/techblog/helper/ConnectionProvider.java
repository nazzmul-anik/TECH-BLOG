package org.anik.techblog.helper;
import java.sql.*;
public class ConnectionProvider {
    private static Connection connection;
    public static Connection getConnection(){
        try{
            if(connection == null){
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "root");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return connection;
    }
}

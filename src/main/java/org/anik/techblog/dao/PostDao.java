package org.anik.techblog.dao;

import org.anik.techblog.entities.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class PostDao {
    Connection connection;

    public PostDao(Connection connection) {
        this.connection = connection;
    }

    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list = new ArrayList<>();

        try{
            String query = "Select *from categories";
            Statement statement = connection.createStatement();
            ResultSet set = statement.executeQuery(query);
            while(set.next()){
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");

                Category category = new Category(cid, name, description);
                list.add(category);
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }
}

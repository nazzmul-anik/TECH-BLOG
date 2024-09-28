package org.anik.techblog.dao;

import org.anik.techblog.entities.Category;
import org.anik.techblog.entities.Post;

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

    public boolean savePost(Post post){
        boolean flag = false;
        try{
            String query = "insert into post(pTitle, pContent, pCode, pPic, catId, userId) values(?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, post.getpTitle());
            preparedStatement.setString(2, post.getpContent());
            preparedStatement.setString(3, post.getpCode());
            preparedStatement.setString(4, post.getpPic());
            preparedStatement.setInt(5, post.getCatId());
            preparedStatement.setInt(6, post.getUserId());

            preparedStatement.executeUpdate();
            flag = true;
        }catch (Exception e){
            e.printStackTrace();
        }

        return flag;
    }
}

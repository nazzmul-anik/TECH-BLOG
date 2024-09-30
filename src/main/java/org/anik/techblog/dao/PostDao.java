package org.anik.techblog.dao;

import org.anik.techblog.entities.Category;
import org.anik.techblog.entities.Post;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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

    public List<Post> getAllPosts(){
        List<Post> postList = new ArrayList<>();

        try{
            PreparedStatement preparedStatement = connection.prepareStatement("select *from post order by pid desc ");
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){

                int pid = resultSet.getInt("pid");
                String pTitle = resultSet.getString("pTitle");
                String pContent = resultSet.getString("pContent");
                String pCode = resultSet.getString("pCode");
                String pPic = resultSet.getString("pPic");
                String pDate = resultSet.getString("pDate");
                int catId = resultSet.getInt("catId");
                int userId = resultSet.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                postList.add(post);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return postList;
    }

    public List<Post> getPostByCatId(int catId){
        List<Post> postList = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement("Select *from post where catId=?");
            preparedStatement.setInt(1, catId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                int pid = resultSet.getInt("pid");
                String pTitle = resultSet.getString("pTitle");
                String pContent = resultSet.getString("pContent");
                String pCode = resultSet.getString("pCode");
                String pPic = resultSet.getString("pPic");
                String pDate = resultSet.getString(("pDate"));
                int userId = resultSet.getInt("userId");

                Post post = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                postList.add(post);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return postList;
    }

    public Post getPostByPostId(int postId){
        Post post = null;
        String query = "Select *from post where pid=?";
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, postId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                int pid = resultSet.getInt("pid");
                String pTitle = resultSet.getString("pTitle");
                String pContent = resultSet.getString("pContent");
                String pCode = resultSet.getString("pCode");
                String pPic = resultSet.getString("pPic");
                String pDate = resultSet.getString("pDate");
                int catId = resultSet.getInt("catId");
                int userId = resultSet.getInt("userId");
                post = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return post;
    }
}

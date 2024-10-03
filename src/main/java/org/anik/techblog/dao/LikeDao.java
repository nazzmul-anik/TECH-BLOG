package org.anik.techblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
    private Connection connection;
    public LikeDao(Connection connection){
        this.connection = connection;
    }

    public boolean insertLike(int postId, int userId){

        boolean isLike = false;
        try{
            String query = "insert into likes (postId, userId) values(?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, postId);
            preparedStatement.setInt(2, userId);
            preparedStatement.executeUpdate();
            isLike = true;
        }catch (Exception e){
            e.printStackTrace();
        }

        return isLike;
    }

    public int countLikeOnPost(int postId){
        int count = 0;

        try{
            String query = "select count(*) from likes where postId=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, postId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                count = resultSet.getInt("count(*)");
            }
        }catch (Exception e){

        }
        return count;
    }


    public boolean isLikedByUser(int postId, int userId){
        boolean isLike = false;

        try{
            String query = "select *from likes where postId=? and userId=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, postId);
            preparedStatement.setInt(2, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                isLike = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return isLike;
    }

    public boolean deleteLike(int postId, int userId){
        boolean operation = false;

            try {
                String query = "delete from liks where postId = ? and userId=?";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, userId);
                preparedStatement.setFloat(2, postId);
                preparedStatement.executeUpdate();
                operation = true;
            }catch (Exception e){
                e.printStackTrace();
            }
        return operation;
    }
}

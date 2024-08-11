package org.anik.techblog.dao;

import org.anik.techblog.entities.User;

import java.sql.*;
public class UserDao {
    private Connection connection;
    public UserDao(Connection connection){
        this.connection = connection;
    }

    public boolean saveUser(User user){

        boolean queryExecuted = false;

        System.out.println(user.getName() + " " + user.getRegistration_date());


        try{

            String query = "insert into user (name, email, password, gender, about, registration_date) values(?, ?, ?, ?, ?, ?)";

            PreparedStatement preparedStatement =  this.connection.prepareStatement(query);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getGender());
            preparedStatement.setString(5, user.getAbout());
            preparedStatement.setString(6, user.getRegistration_date());
            preparedStatement.executeUpdate();
            queryExecuted = true;

        }catch (Exception e){
            e.printStackTrace();
        }

        return queryExecuted;
    }

//    get user by user email and user password

    public User getUserByEmailAndPassword(String email, String password){
        User user = null;

        try{
            String query = "Select *from user where email = ? and password = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                user = new User();
                String name = resultSet.getString("name");
                user.setName(name);
                user.setId(resultSet.getInt("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setGender(resultSet.getString("gender"));
                user.setAbout(resultSet.getString("about"));
                user.setRegistration_date(resultSet.getString("registration_date"));
                user.setProfile(resultSet.getString("profile"));
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user){
        boolean queryExecute = false;
        try{
            String query = "update user set name=?, email=?, password=?, gender=?, about=?, profile=? where id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getGender());
            preparedStatement.setString(5, user.getAbout());
            preparedStatement.setString(6, user.getProfile());
            preparedStatement.setInt(7, user.getId());
            preparedStatement.executeUpdate();
            queryExecute = true;
        }catch (Exception e){
            e.printStackTrace();
        }

        return queryExecute;
    }
}

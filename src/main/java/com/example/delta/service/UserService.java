package com.example.delta.service;

import com.example.delta.domain.User;
import com.example.delta.repository.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public User create(User user){
        return userDao.save(user);
    }

    public List<User> findAll(){
        return (List<User>) userDao.findAll();
    }
}

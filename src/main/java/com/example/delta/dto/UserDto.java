package com.example.delta.dto;

import com.example.delta.domain.User;

public class UserDto {

    private String login;
    private String password;

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public User build(UserDto userDto){
        User u = new User();
        u.setLogin(userDto.getLogin());
        u.setPassword(userDto.getPassword());
        return u;
    }

}

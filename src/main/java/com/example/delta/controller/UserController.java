package com.example.delta.controller;

import com.example.delta.domain.User;
import com.example.delta.dto.UserDto;
import com.example.delta.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.example.delta.dto.UserDto;

import java.util.List;

@RestController
public class UserController {

    @Autowired
    private UserService userService;
    @PostMapping( value = "/create",
            consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ModelAndView create(@ModelAttribute UserDto userDto) {
         userService.create(userDto.build(userDto));
        ModelAndView modelAndView = new ModelAndView("listUser");
        return modelAndView;
    }
    @RequestMapping(method = RequestMethod.GET, value = "/list",
    produces = MediaType.APPLICATION_JSON_VALUE)
    public List<User> findAll(){
        return userService.findAll();
    }
}

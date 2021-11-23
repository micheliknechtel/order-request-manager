package com.example.delta.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class IndexController {

    @RequestMapping(method = RequestMethod.GET, value = "/")
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;

    }
    @PostMapping( value = "/doLogin")
    public ModelAndView doLogin() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("listOs");
        return modelAndView;

    }
}

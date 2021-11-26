
package com.example.delta.controller;


import com.example.delta.domain.Os;
import com.example.delta.dto.OsDto;
import com.example.delta.service.OsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
public class OsController {

    @Autowired
    private OsService osService;

    @PostMapping( value = "/createOs",
            consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ModelAndView create(@ModelAttribute OsDto osDto) {
        Os os = osDto.build(osDto);
osService.create(os); ModelAndView modelAndView = new ModelAndView("listOs"); 
return modelAndView;}

    @RequestMapping(method = RequestMethod.GET, value = "/admin/listOs",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Os> findAll() {
        return osService.findAll();
    }

    @RequestMapping("/admin/details/{id}")
    public ModelAndView read(@PathVariable("id") int id, Model model) {
        model.addAttribute("id", id);
        ModelAndView modelAndView = new ModelAndView("editOs");
        Os os = osService.findById(id);
        modelAndView.addObject("os",os);
        return modelAndView;
    }

    @PostMapping( value = "/admin/editOs",
            consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ModelAndView edit(@ModelAttribute OsDto osDto) {
        Os os =osDto.build(osDto);
        osService.edit(os);
        ModelAndView modelAndView = new ModelAndView("listOs");
        return modelAndView;
    }
    @GetMapping(value = "/admin/createOsNew")
    public ModelAndView createNew(@ModelAttribute OsDto osDto) {
        ModelAndView modelAndView = new ModelAndView("createOsNew");
        return modelAndView;
    }
}

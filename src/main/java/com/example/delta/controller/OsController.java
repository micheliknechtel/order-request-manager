
package com.example.delta.controller;


import com.example.delta.domain.Os;
import com.example.delta.dto.OsDto;
import com.example.delta.service.OsService;
import net.sf.jasperreports.engine.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
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

    @RequestMapping( value="/geraRelatorio",method = RequestMethod.GET)
    public ResponseEntity<byte[]> getRelatorio(HttpServletResponse response, HttpServletRequest request) throws Exception {

        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/loja", "root", "123");

            HashMap parametros = new HashMap();

            parametros.put("ID",  new Integer(request.getParameter("id")));
            parametros.put("image",System.getProperty("user.dir")+"/image/Delta-Arrow-logo.png");

            JasperReport jasperReport = JasperCompileManager.compileReport(System.getProperty("user.dir")+"/report/Blank_A4.jrxml");

            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parametros,conn);
            System.out.println("Done! filling Jasper Report ");
            JasperExportManager.exportReportToPdfFile(jasperPrint, System.getProperty("user.dir")+"/pdf/dynamic1.pdf");
            System.out.println("Done!!!exporting the pdf report");
        } catch (Exception e1) {
            e1.printStackTrace();
        }

        InputStream n = new FileInputStream(new File(System.getProperty("user.dir")+"/pdf/dynamic1.pdf"));
        InputStreamResource inputStreamResource = new InputStreamResource(n);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentLength(Files.size(Paths.get(System.getProperty("user.dir")+"/pdf/dynamic1.pdf")));
        headers.setContentType(MediaType.APPLICATION_PDF);
        return new ResponseEntity(inputStreamResource, headers, HttpStatus.OK);

    }

}

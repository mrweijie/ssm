package com.ssm.controller;

import com.ssm.service.MessageService;
import com.ssm.until.Tools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

@Controller
@RequestMapping(value = "/home")
public class HomeController {
    @Autowired
    public MessageService messageService;

    @ResponseBody
    @RequestMapping(value = "/getAll", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String System() {
        return Tools.toJson(messageService.getAll());
    }
}

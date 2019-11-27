package com.ssm.controller;

import com.ssm.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/sys")
public class SystemController {

    @Autowired
    public EmailService emailService;

    @ResponseBody
    @RequestMapping(value = "/send", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String get() {
        emailService.send();
        return Integer.toString(1);
    }


}

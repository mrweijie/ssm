package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class APIController {
    @RequestMapping(value = "11")
    public String abc() {
        return "";
    }
}

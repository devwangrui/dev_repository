package com.example.zhengai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/upNorm")
public class UpNormController {

    @RequestMapping("/toUpNorm")
    public String upNorm(Model model){

        return "HomePage/upNorm";
    }
}

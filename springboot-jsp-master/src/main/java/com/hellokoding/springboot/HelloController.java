package com.hellokoding.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HelloController {
    @RequestMapping("/hello")
    public String hello(Model model, @RequestParam(value="name", required=false, defaultValue="World") String name) {
        model.addAttribute("name", name);
        return "hello";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/join")
    public String join() {
        return "join";
    }

    @RequestMapping("/write")
    public String write() {
        return "write";
    }

    @RequestMapping("/main")
    public String main() {
        return "main";
    }

    @RequestMapping("/bbs")
    public String bbs() {
        return "bbs";
    }
}

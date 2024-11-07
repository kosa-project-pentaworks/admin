package com.example.admin.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Slf4j
@Controller
@RequestMapping("/view")
public class ViewController {

    @GetMapping("/admin")
    public String pageView() {
        log.info("pageView()");
        return "admin"; // admin.jsp를 호출합니다.
    }

    @GetMapping("/admin2")
    public String pageView2() {
        log.info("pageView2()");
        return "admin2"; // admin.jsp를 호출합니다.
    }
    @GetMapping("/admin3")
    public String pageView3() {
        log.info("pageView3()");
        return "admin3"; // admin.jsp를 호출합니다.
    }

    @GetMapping("/dashboard")
    public String dashboardView() {
        log.info("dashboardView()");
        return "dashboard"; // dashboard.jsp를 호출합니다.
    }
}
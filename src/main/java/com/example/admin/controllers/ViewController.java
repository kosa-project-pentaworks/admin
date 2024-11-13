package com.example.admin.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Slf4j
@Controller
@RequestMapping("/view")
public class ViewController {

    @GetMapping("/index")
    public String indexView() {
        log.info("indexView()");
        return "admin/index"; // admin.jsp를 호출합니다.
    }

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

    //회원 리스트
    @GetMapping("/userList")
    public String userListView() {
        log.info("userListView()");
        return "userList";
    }
    // 병원 예약 리스트
    @GetMapping("/hospitalReservatioList")
    public String hospitalReservatioListView() {
        log.info("hospitalReservatioListView()");
        return "hospitalReservatioList"; // dashboard.jsp를 호출합니다.
    }

    // 유저 통계 대시보드 : 유저
    @GetMapping("/userdashboard")
    public String userDashboardView() {
        log.info("userDashboardView()");
        return "userdashboard"; // dashboard.jsp를 호출합니다.
    }
    // 병원 예약 통계 대시보드 : 요일별 예약
    @GetMapping("/reservationDashboard")
    public String reservationDashboardView() {
        log.info("reservationDashboardView()");
        return "reservationDashboard"; // dashboard.jsp를 호출합니다.
    }


    // text page
    @GetMapping("/userdata")
    public String userdata() {
        log.info("userdata()");
        return "userdata"; // dashboard.jsp를 호출합니다.
    }
}
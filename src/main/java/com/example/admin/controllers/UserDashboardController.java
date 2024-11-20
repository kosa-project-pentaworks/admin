package com.example.admin.controllers;


import com.example.admin.dto.StatusDTO;
import com.example.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/api/v1/admin")
public class UserDashboardController {

    @Autowired
    private AdminService adminService;

    // 유저 통계 대시보드 : 유저
    @GetMapping("/userdashboard")
    public String userDashboardAdmin( Model model) {
        log.info("userDashboardView()");

        int activeUserCount  =   adminService.selectActiveUserCount();
        int userCount  = adminService.selectUserCount();
        int deactivatedUserCount =  adminService.selectDeactivatedUserCount();
        log.info("UserDashboardControlle():: selectDeactivatedUserCount()  = {}",adminService.selectActiveUserCount());
        log.info("UserDashboardControlle()::selectUserCount() :: = {}",adminService.selectUserCount());
        log.info("UserDashboardControlle()::selectDeactivatedUserCount() :: = {}",adminService.selectDeactivatedUserCount());

        model.addAttribute("activeUserCount",activeUserCount);
        model.addAttribute("deactivatedUserCount",deactivatedUserCount);
        model.addAttribute("userCount",userCount);
        return "userdashboard";
    }
}

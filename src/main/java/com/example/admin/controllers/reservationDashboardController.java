package com.example.admin.controllers;

import com.example.admin.dto.ReservationStatusDTO;
import com.example.admin.dto.StatusDTO;
import com.example.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


@Slf4j
@Controller
@RequestMapping("/api/v1/admin")
public class reservationDashboardController {

    @Autowired
    private AdminService adminService;


    // 병원 통계:지역
    @GetMapping("/reservationDashboard")
    public String reservationDashboardAdmin(@RequestParam HashMap<String, Object> paramMap, Model model) {
        log.info("reservationDashboardAdmin()");

        // ============================================================
        //  searchType별 분기
        // ============================================================
        if(paramMap.isEmpty()){
            paramMap.put("all", "all");
            log.info("selectUserListAll() if");
        }
        else {
            String selectType = (String) paramMap.get("selectType");


            switch (selectType) {
                case "all":
                    paramMap.put("all", "all");
                    break;
                case "asc":
                    paramMap.put("asc", "asc");
                    break;
                case "desc":
                    paramMap.put("desc","desc");
                    break;
                default:

            }

        }
        model.addAttribute("selectType",(String) paramMap.get("selectType"));
        log.info("selectUserListAll() = {}", paramMap);

        List<StatusDTO> hospCount  = adminService.selectHospCount(paramMap);

        log.info("reservationDashboardAdmin()::selectUserCount() :: = {}",hospCount);

        // list 생성
        List<String> sidoCdNm = new ArrayList<>();
        List<Integer> cnt = new ArrayList<>();
        for (int i=0; i < hospCount.size();i++ ){
            sidoCdNm.add(hospCount.get(i).getSidoCdNm());
            cnt.add(hospCount.get(i).getCnt());

        }
        model.addAttribute("sidoCdNm",sidoCdNm);
        model.addAttribute("cnt",cnt);
        log.info("reservationDashboardAdmin()::cnt() :: = {}",cnt);
        model.addAttribute("deactivatedHospCount",hospCount);
        return "reservationDashboard";
    }


    // 진요얘약: 기간(최근 3개월)
    @GetMapping("/selectYearmonthCount")
    public String selectYearmonthCount( Model model) {
        log.info("selectYearmonthCount()");



        List<ReservationStatusDTO> hospCount  = adminService.selectYearmonthCount();

        log.info("reservationDashboardAdmin()::selectUserCount() :: = {}",hospCount);

        // list 생성
        List<String> yearmonth = new ArrayList<>();
        List<Integer> cnt = new ArrayList<>();
        for (int i=0; i < hospCount.size();i++ ){
            yearmonth.add(hospCount.get(i).getYearmonth());
            cnt.add(hospCount.get(i).getCnt());

        }
        model.addAttribute("yearmonth",yearmonth);
        model.addAttribute("cnt",cnt);
        log.info("reservationDashboardAdmin()::cnt() :: = {}",cnt);
        model.addAttribute("deactivatedHospCount",hospCount);
        return "hospReservationDashboard";
    }





}

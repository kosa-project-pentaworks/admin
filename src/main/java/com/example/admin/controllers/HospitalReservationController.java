package com.example.admin.controllers;


import com.example.admin.dto.HospitalReservationDTO;
import com.example.admin.dto.ReservationDTO;
import com.example.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/admin")
public class HospitalReservationController {

    @Autowired
    private AdminService adminService;

    // ============================================================
    //  유저 목록 조회
    // ============================================================
    @GetMapping(value = "/selectHospitalReservationListAll")
    public String selectHospitalReservationListAll(@RequestParam HashMap<String, Object> paramMap ,Model model) {

        // 요청
        log.info("selectHospitalReservationListAll()");
        log.info("selectHospitalReservationListAll() = {}",paramMap);
        // ============================================================
        //  searchType별 분기
        // ============================================================
        if(paramMap.isEmpty()){
            log.info("selectHospitalReservationListAll() if");
        }
        else {
            String searchType = (String) paramMap.get("searchType");
            switch (searchType) {
                case "all":
                    paramMap.put("search", null);
                    break;
                case "yadmNm":
                    paramMap.put("yadmNm", paramMap.get("search"));
                    break;
                case "username":
                    paramMap.put("username", paramMap.get("search"));
                    break;
                case "reservationStatus":
                    paramMap.put("reservationStatus", paramMap.get("search"));
                    break;
                default:

            }
            log.info("selectHospitalReservationListAll() = {}", paramMap);
        }
        // 요청 실행: 조회
        List<ReservationDTO> returnReservationList =adminService.selectHospitalReservationListAll(paramMap);
        log.info("returnHospitalReservationDTOList= {}",returnReservationList);
        for(int i=0; i < returnReservationList.size() ; i++ ){
            log.info("returnUserDTOList= {}",returnReservationList.get(i).toString());
        }

        // 모델에 유저 리스트를 담음
        model.addAttribute("reservationList",returnReservationList);

        // 검색 조건 유지를 위해 모델에 검색 조건 , 검색단어 를 담음
        model.addAttribute("searchType",(String) paramMap.get("searchType"));
        model.addAttribute("search",(String) paramMap.get("search"));

        log.info("searchType= {}",model.getAttribute("searchType"));
        log.info("search= {}",model.getAttribute("search"));

        //리턴
        return "hospitalReservatioList";
    }






}

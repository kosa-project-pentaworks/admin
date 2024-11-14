package com.example.admin.controllers;

import com.example.admin.dto.HospitalDTO;
import com.example.admin.dto.HospitalReservationDTO;
import com.example.admin.dto.UserDTO;
import com.example.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api/admin")
@Slf4j
public class AdminController {

    @Autowired
    private AdminService adminService;



    // 병원 목록 전체 조회
    @GetMapping(value = "/selectHospListAll")
    public ResponseEntity<List<HospitalDTO>> selectHospListAll() {
        // 요청
        log.info("selectHospListAll()");

        // 요청 실행: 전체조회
        List<HospitalDTO> returnMenusDtoList =adminService.selectHospListAll();
        log.info("returnMessageDtoList= {}",returnMenusDtoList);
        ResponseEntity<List<HospitalDTO>> results = ResponseEntity.status(HttpStatus.OK).body(returnMenusDtoList);

        //리턴
        return results;
    }




    // 유저 목록 전체 조회
    @GetMapping("/selectUserListAll")
    public ResponseEntity<List<UserDTO>> selectUserListAll(@RequestParam HashMap<String, Object> paramMap) {
        // 요청
        log.info("selectUserListAll()");
        log.info("selectUserListAll() = {}",paramMap);
        // ============================================================
        //  searchType별 분기
        // ============================================================
        if(paramMap.isEmpty()){
            log.info("selectUserListAll() if");
        }
        else {
            String searchType = (String) paramMap.get("searchType");


            switch (searchType) {
                case "all":
                    break;
                case "email":
                    paramMap.put("email", paramMap.get("search"));
                    break;
                case "username":
                    paramMap.put("username", paramMap.get("search"));
                    break;
                case "phone":
                    paramMap.put("phone", paramMap.get("search"));
                    break;
                default:

            }
            log.info("selectUserListAll() = {}", paramMap);
        }

        // 요청 실행: 전체조회
        List<UserDTO> returnUserList =adminService.selectUserListAll(paramMap);
//        log.info("returnUserDTOList= {}",returnMenusDtoList);
        for(int i=0; i < returnUserList.size() ; i++ ){
            log.info("returnUserDTOList= {}",returnUserList.get(i).toString());
        }


        ResponseEntity<List<UserDTO>> results = ResponseEntity.status(HttpStatus.OK).body(returnUserList);

        //리턴
        return results;
    }









    //병원 예약 목록 전체 조회
    @GetMapping(value = "/selectHospitalReservationListAll")
    public ResponseEntity<List<HospitalReservationDTO>> selectHospitalReservationListAll() {
        // 요청
        log.info("selectHospitalReservationListAll()");

        // 요청 실행: 전체조회
        List<HospitalReservationDTO> returnReservationList =adminService.selectHospitalReservationListAll();
        log.info("returnHospitalReservationDTOList= {}",returnReservationList);
        for(int i=0; i < returnReservationList.size() ; i++ ){
            log.info("returnUserDTOList= {}",returnReservationList.get(i).toString());
        }

        ResponseEntity<List<HospitalReservationDTO>> results = ResponseEntity.status(HttpStatus.OK).body(returnReservationList);

        //리턴
        return results;
    }


}

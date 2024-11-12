package com.example.admin.controllers;

import com.example.admin.dto.HospitalDTO;
import com.example.admin.dto.HospitalReservationDTO;
import com.example.admin.dto.UserDTO;
import com.example.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
import java.util.Map;

// AdminController 클래스: 클라이언트로부터의 요청을 처리하고 응답을 제공합니다.

@RestController
@RequestMapping("/admin")
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
    @GetMapping(value = "/selectUserListAll")
    public ResponseEntity<List<UserDTO>> selectUserListAll() {
        // 요청
        log.info("selectUserListAll()");

        // 요청 실행: 전체조회
        List<UserDTO> returnUserList =adminService.selectUserListAll();
//        log.info("returnUserDTOList= {}",returnMenusDtoList);
        for(int i=0; i < returnUserList.size() ; i++ ){
            log.info("returnUserDTOList= {}",returnUserList.get(i).toString());
        }


        ResponseEntity<List<UserDTO>> results = ResponseEntity.status(HttpStatus.OK).body(returnUserList);

        //리턴
        return results;
    }

    // 유저 목록 전체 조회
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

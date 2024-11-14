package com.example.admin.service;

import com.example.admin.dto.HospitalDTO;
import com.example.admin.dto.HospitalReservationDTO;
import com.example.admin.dto.UserDTO;
import org.springframework.http.ResponseEntity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AdminService {

    // 병원 목록 전체 조회
    List<HospitalDTO> selectHospListAll();

    // 사용자 목록 전체 조회
    List<UserDTO> selectUserListAll(HashMap<String, Object> paramMap);

    // 병원 예약 전체 조회
    List<HospitalReservationDTO> selectHospitalReservationListAll();

    // 회원 id로 회원 정보 조회
    // 회원 id로 회원 정보 조회
    ResponseEntity<UserDTO> getUserInfoRest(HashMap<String, Object> paramMap);

    UserDTO getUserInfo(HashMap<String, Object> paramMap);

}

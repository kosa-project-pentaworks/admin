package com.example.admin.service;

import com.example.admin.dto.*;
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
    List<ReservationDTO> selectHospitalReservationListAll(HashMap<String, Object> paramMap);

    // 회원 id로 회원 정보 조회
    // 회원 id로 회원 정보 조회
    ResponseEntity<UserDTO> getUserInfoRest(HashMap<String, Object> paramMap);

    UserDTO getUserInfo(long paramId);

    int userUpdate(UserDTO userDTO);


    // 예약ID로 예약 정보 조회
    ReservationDTO getReservationInfo(long paramId);

    // 예약 정보 수정
    int reservationUpdate(ReservationDTO reservationDTO);


    // 통계
    int selectActiveUserCount();

    int selectDeactivatedUserCount();

    int selectUserCount();

    List<StatusDTO> selectHospCount(HashMap<String, Object> paramMap);

    List<ReservationStatusDTO> selectYearmonthCount();

}

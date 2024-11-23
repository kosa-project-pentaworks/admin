package com.example.admin.dao;

import com.example.admin.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.http.ResponseEntity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

// AdminMapper 인터페이스: 데이터베이스와 상호작용하는 메서드를 선언합니다.

@Mapper
public interface AdminMapper {

    // 병원 목록 전체 조회
    List<HospitalDTO> selectHospListAll(HashMap<String, Object> paramMap);

    // 회원 목록 전체 조회
    List<UserDTO> selectUserListAll(HashMap<String, Object> paramMap);

    // 병원 예약 전체 조회 getUserInfo
    List<ReservationDTO> selectHospitalReservationListAll(HashMap<String, Object> paramMap);

    // 회원 id로 회원 정보 조회
    ResponseEntity<UserDTO> getUserInfoRest(HashMap<String, Object> paramMap);

    UserDTO getUserInfo(long paramId);

    // 회원 정보 수정 처리
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
//     reservationCount
//    List<ReservationStatusDTO> reservationCount();



}

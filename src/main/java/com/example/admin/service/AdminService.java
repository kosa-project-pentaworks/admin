package com.example.admin.service;

import com.example.admin.dto.HospitalDTO;
import com.example.admin.dto.HospitalReservationDTO;
import com.example.admin.dto.UserDTO;

import java.util.List;
import java.util.Map;

// AdminService 인터페이스: 비즈니스 로직을 처리하는 메서드를 선언합니다.
public interface AdminService {

    // 병원 목록 전체 조회
    List<HospitalDTO> selectHospListAll();

    // 사용자 목록 전체 조회
    List<UserDTO> selectUserListAll();

    // 병원 예약 전체 조회
    List<HospitalReservationDTO> selectHospitalReservationListAll();

}

package com.example.admin.dao;

import com.example.admin.dto.HospitalDTO;
import com.example.admin.dto.HospitalReservationDTO;
import com.example.admin.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

// AdminMapper 인터페이스: 데이터베이스와 상호작용하는 메서드를 선언합니다.

@Mapper
public interface AdminMapper {

    // 병원 목록 전체 조회
    List<HospitalDTO> selectHospListAll();

    // 사용자 목록 전체 조회
    List<UserDTO> selectUserListAll(HashMap<String, Object> paramMap);

    // 병원 예약 전체 조회
    List<HospitalReservationDTO> selectHospitalReservationListAll();

}

package com.example.admin.service;


import com.example.admin.dao.AdminMapper;
import com.example.admin.dto.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;


    // 병원 목록 전체 조회 구현
    @Override
    public List<HospitalDTO> selectHospListAll() {
        log.info("AdminService :: selectHospListAll() = {}",adminMapper.selectHospListAll());
        return adminMapper.selectHospListAll();
    }

    // 유저 전체 조회
    @Override
    public List<UserDTO> selectUserListAll(HashMap<String, Object> paramMap) {
        log.info("AdminService :: selectUserListAll() = {}", paramMap);

        return adminMapper.selectUserListAll(paramMap);
    }


    // 병원 예약 전체 조회
    @Override
    public List<ReservationDTO> selectHospitalReservationListAll(HashMap<String, Object> paramMap) {
        log.info("AdminService :: selectHospitalReservationListAll() =");

        return adminMapper.selectHospitalReservationListAll(paramMap);
    }

    // 유저 정보 조회
    @Override
    public ResponseEntity<UserDTO> getUserInfoRest(HashMap<String, Object> paramMap) {
        return  adminMapper.getUserInfoRest(paramMap);
    }

    @Override
    public UserDTO getUserInfo(long paramId) {
        return adminMapper.getUserInfo(paramId);
    }

    
    // 회원 수정
    @Override
    public int userUpdate(UserDTO userDTO) {
        log.info("Service userUpdate() :: = {}",userDTO);
        return adminMapper.userUpdate(userDTO);
    }

    @Override
    public ReservationDTO getReservationInfo(long paramId) {
        log.info("Service getReservationInfo() :: = {}",paramId);
        return adminMapper.getReservationInfo(paramId);
    }

    @Override
    public int reservationUpdate(ReservationDTO reservationDTO) {
        log.info("Service reservationUpdate() :: = {}",reservationDTO);
        return adminMapper.reservationUpdate(reservationDTO);
    }

    @Override
    public int selectActiveUserCount() {
        log.info("Service selectActiveUserCount()");
        return adminMapper.selectActiveUserCount();
    }

    @Override
    public int selectDeactivatedUserCount() {
        log.info("Service selectDeactivatedUserCount()");
        return adminMapper.selectDeactivatedUserCount();
    }

    @Override
    public int selectUserCount() {
        log.info("Service selectUserCount()");
        return adminMapper.selectUserCount();
    }

    @Override
    public List<StatusDTO> selectHospCount(HashMap<String, Object> paramMap ) {
        log.info("Service selectHospCount()");
        return adminMapper.selectHospCount(paramMap);
    }

    @Override
    public List<ReservationStatusDTO> selectYearmonthCount() {
        return adminMapper.selectYearmonthCount();
    }


}

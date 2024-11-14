package com.example.admin.service;


import com.example.admin.dao.AdminMapper;
import com.example.admin.dto.HospitalDTO;
import com.example.admin.dto.HospitalReservationDTO;
import com.example.admin.dto.UserDTO;
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
    public List<HospitalReservationDTO> selectHospitalReservationListAll() {
        log.info("AdminService :: selectHospitalReservationListAll() =");

        return adminMapper.selectHospitalReservationListAll();
    }

    @Override
    public ResponseEntity<UserDTO> getUserInfoRest(HashMap<String, Object> paramMap) {
        return  adminMapper.getUserInfoRest(paramMap);
    }

    @Override
    public UserDTO getUserInfo(HashMap<String, Object> paramMap) {
        return adminMapper.getUserInfo(paramMap);
    }


}

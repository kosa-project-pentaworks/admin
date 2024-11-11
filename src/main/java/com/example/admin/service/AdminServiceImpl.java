package com.example.admin.service;


import com.example.admin.dao.AdminMapper;
import com.example.admin.dto.HospitalDTO;
import com.example.admin.dto.HospitalReservationDTO;
import com.example.admin.dto.UserDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

// AdminServiceImpl 클래스: 서비스 로직을 구현하고 데이터 접근 계층과 상호작용합니다.
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
    public List<UserDTO> selectUserListAll() {
        log.info("AdminService :: selectUserListAll() = {}", adminMapper.selectUserListAll());

        return adminMapper.selectUserListAll();
    }


    // 병원 예약 전체 조회
    @Override
    public List<HospitalReservationDTO> selectHospitalReservationListAll() {
        log.info("AdminService :: selectHospitalReservationListAll() = {}", adminMapper.selectHospitalReservationListAll());

        return adminMapper.selectHospitalReservationListAll();
    }


}

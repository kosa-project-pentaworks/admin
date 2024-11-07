package com.example.admin.service;


import com.example.admin.dao.AdminMapper;
import com.example.admin.dto.HospitalDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

// AdminServiceImpl 클래스: 서비스 로직을 구현하고 데이터 접근 계층과 상호작용합니다.
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;



    // 병원 목록 전체 조회 구현
    @Override
    public List<HospitalDTO> selectMenuListAll() {
        return adminMapper.selectMenuListAll();
    }

    // 전체 사용자 수 조회 구현
    @Override
    public int getTotalUsers() {
        return adminMapper.getTotalUsers();
    }

    // 활성 사용자 수 조회 구현
    @Override
    public int getActiveUsers() {
        return adminMapper.getActiveUsers();
    }

    // 전체 병원 수 조회 구현
    @Override
    public int getTotalHospitals() {
        return adminMapper.getTotalHospitals();
    }

    // 도시별 사용자 수 조회 구현
    @Override
    public List<Map<String, Object>> getUserCountByCity() {
        return adminMapper.getUserCountByCity();
    }

    // 지역(시,도)별 병원 수 조회 구현
    @Override
    public List<Map<String, Object>> getHospitalCountByProvince() {
        return adminMapper.getHospitalCountByProvince();
    }

    // 병원 예약 건수 조회 구현
    @Override
    public List<Map<String, Object>> getReservationCountByHospital() {
        return adminMapper.getReservationCountByHospital();
    }

    // 월별 예약 건수 추이 조회 구현
    @Override
    public List<Map<String, Object>> getMonthlyReservationTrend() {
        return adminMapper.getMonthlyReservationTrend();
    }

    // 병원별 평균 리뷰 평점 조회 구현
    @Override
    public List<Map<String, Object>> getAverageRatingByHospital() {
        return adminMapper.getAverageRatingByHospital();
    }

    // 병원별 총 결제 금액 조회 구현
    @Override
    public List<Map<String, Object>> getTotalPaymentAmountByHospital() {
        return adminMapper.getTotalPaymentAmountByHospital();
    }

    // 병원별 참석률 계산 구현
    @Override
    public List<Map<String, Object>> getAttendanceRateByHospital() {
        return adminMapper.getAttendanceRateByHospital();
    }

    // 일별 신규 회원 가입 수 조회 구현
    @Override
    public List<Map<String, Object>> getDailyNewUsers() {
        return adminMapper.getDailyNewUsers();
    }

    // 리뷰 수 상위 10개 병원 조회 구현
    @Override
    public List<Map<String, Object>> getTop10HospitalsByReviewCount() {
        return adminMapper.getTop10HospitalsByReviewCount();
    }

    // 시,도 별 유저 병원 수 getHospitalAndUserCountByCity
    @Override
    public List<Map<String, Object>> getHospitalAndUserCountByCity() {
        return adminMapper.getHospitalAndUserCountByCity();
    }

    //  날짜별 병원 평균 평점 getAverageRatingByDate
    @Override
    public List<Map<String, Object>> getAverageRatingByDate() {
        return adminMapper.getAverageRatingByDate();
    }


}

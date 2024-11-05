package com.example.admin.service;

import com.example.admin.dto.HospitalDTO;

import java.util.List;
import java.util.Map;

// AdminService 인터페이스: 비즈니스 로직을 처리하는 메서드를 선언합니다.
public interface AdminService {

    // 병원 목록 전체 조회
    List<HospitalDTO> selectMenuListAll();

    // 전체 사용자 수 조회
    int getTotalUsers();

    // 활성 사용자 수 조회
    int getActiveUsers();

    // 전체 병원 수 조회
    int getTotalHospitals();

    // 도시별 사용자 수 조회
    List<Map<String, Object>> getUserCountByCity();

    // 지역(시,도)별 병원 수 조회
    List<Map<String, Object>> getHospitalCountByProvince();

    // 병원 예약 건수 조회
    List<Map<String, Object>> getReservationCountByHospital();

    // 월별 예약 건수 추이 조회
    List<Map<String, Object>> getMonthlyReservationTrend();

    // 병원별 평균 리뷰 평점 조회
    List<Map<String, Object>> getAverageRatingByHospital();

    // 병원별 총 결제 금액 조회
    List<Map<String, Object>> getTotalPaymentAmountByHospital();

    // 병원별 참석률 계산
    List<Map<String, Object>> getAttendanceRateByHospital();

    // 일별 신규 회원 가입 수 조회
    List<Map<String, Object>> getDailyNewUsers();

    // 리뷰 수 상위 10개 병원 조회
    List<Map<String, Object>> getTop10HospitalsByReviewCount();
}

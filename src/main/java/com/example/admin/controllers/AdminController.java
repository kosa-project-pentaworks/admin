package com.example.admin.controllers;

import com.example.admin.dto.HospitalDTO;
import com.example.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
import java.util.Map;

// AdminController 클래스: 클라이언트로부터의 요청을 처리하고 응답을 제공합니다.
@RestController
@RequestMapping("/admin")
@Slf4j
public class AdminController {

    @Autowired
    private AdminService adminService;



    // 병원 목록 전체 조회 엔드포인트
    @GetMapping("/selectMenuListAll")
    public List<HospitalDTO> selectMenuListAll() {
        return adminService.selectMenuListAll();
    }

    // 전체 사용자 수 조회 엔드포인트
    @GetMapping("/totalUsers")
    public int getTotalUsers() {
        return adminService.getTotalUsers();
    }

    // 활성 사용자 수 조회 엔드포인트
    @GetMapping("/activeUsers")
    public int getActiveUsers() {
        return adminService.getActiveUsers();
    }

    // 전체 병원 수 조회 엔드포인트
    @GetMapping("/totalHospitals")
    public int getTotalHospitals() {
        return adminService.getTotalHospitals();
    }

    // 도시별 사용자 수 조회 엔드포인트
    @GetMapping("/userCountByCity")
    public List<Map<String, Object>> getUserCountByCity() {
        return adminService.getUserCountByCity();
    }

    // 지역(시,도)별 병원 수 조회 엔드포인트
    @GetMapping("/hospitalCountByProvince")
    public List<Map<String, Object>> getHospitalCountByProvince() {
        return adminService.getHospitalCountByProvince();
    }

    // 병원 예약 건수 조회 엔드포인트
    @GetMapping("/reservationCountByHospital")
    public List<Map<String, Object>> getReservationCountByHospital() {
        return adminService.getReservationCountByHospital();
    }

    // 월별 예약 건수 추이 조회 엔드포인트
    @GetMapping("/monthlyReservationTrend")
    public List<Map<String, Object>> getMonthlyReservationTrend() {
        return adminService.getMonthlyReservationTrend();
    }

    // 병원별 평균 리뷰 평점 조회 엔드포인트
    @GetMapping("/averageRatingByHospital")
    public List<Map<String, Object>> getAverageRatingByHospital() {
        return adminService.getAverageRatingByHospital();
    }

    // 병원별 총 결제 금액 조회 엔드포인트
    @GetMapping("/totalPaymentAmountByHospital")
    public List<Map<String, Object>> getTotalPaymentAmountByHospital() {
        return adminService.getTotalPaymentAmountByHospital();
    }

    // 병원별 참석률 계산 엔드포인트
    @GetMapping("/attendanceRateByHospital")
    public List<Map<String, Object>> getAttendanceRateByHospital() {
        return adminService.getAttendanceRateByHospital();
    }

    // 일별 신규 회원 가입 수 조회 엔드포인트
    @GetMapping("/dailyNewUsers")
    public List<Map<String, Object>> getDailyNewUsers() {
        return adminService.getDailyNewUsers();
    }

    // 리뷰 수 상위 10개 병원 조회 엔드포인트
    @GetMapping("/top10HospitalsByReviewCount")
    public List<Map<String, Object>> getTop10HospitalsByReviewCount() {
        return adminService.getTop10HospitalsByReviewCount();
    }

    // 리뷰 수 상위 10개 병원 조회 엔드포인트
    @GetMapping("/hospitalAndUserCountByCity")
    public List<Map<String, Object>> getHospitalAndUserCountByCity() {
        return adminService.getHospitalAndUserCountByCity();
    }

    // 리뷰 수 상위 10개 병원 조회 엔드포인트
    @GetMapping("/averageRatingByDate")
    public List<Map<String, Object>> getAverageRatingByDate() {
        return adminService.getAverageRatingByDate();
    }

    // 예약 리스트 보여주기
    @GetMapping("/reservations")
    public List<Map<String, Object>> getHospitalReservationHistory() {
        log.info("예약 리스트 :: = {}",adminService.getHospitalReservationHistory());
        return adminService.getHospitalReservationHistory();
    }
}

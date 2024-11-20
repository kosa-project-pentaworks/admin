package com.example.admin.controllers;


import com.example.admin.dto.ReservationDTO;
import com.example.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
@Slf4j
public class HospitalReservationUpdateController {

    @Autowired
    private AdminService adminService;


    // ============================================================
    // 업데이트를 위한 예약ID로 예약 정보 조회 후 정보 수정 창으로 전달
    // ============================================================
    @GetMapping("/getReservationInfo")
    public String getReservationInfo(@RequestParam long paramId, Model model) {
        // 요청
        log.info("getReservationInfo()");
        log.info("getReservationInfo()= {}", paramId);



        // 요청 실행:조회 (조건 : 예약 ID)
        ReservationDTO returnReservationInfo = adminService.getReservationInfo(paramId);
        log.info("returnUserDTOList= {}", returnReservationInfo.toString());

        model.addAttribute("reservation",returnReservationInfo);
        //리턴
        return "hospitalReservationInfo";
    }

    // ============================================================
    // 예약 정보 업데이트 실향
    // ============================================================
    @PostMapping(value = "/reservation/update")
    public String reservationUpdate(@ModelAttribute ReservationDTO reservationDTO) {
        //요청
        log.info("reservationUpdate() :: ReservationDTO = {}",reservationDTO);

        //요청 처리
        // - 회원 정보를 업데이트
        int returnCnt = adminService.reservationUpdate(reservationDTO);
        log.info("userUpdate() :: returnCnt = {} ",returnCnt);
        log.info("userUpdate() :: getUserId = {} ",reservationDTO.getHospReservationId());
        long uid = reservationDTO.getHospReservationId();

        String url = "redirect:/api/v1/admin/getReservationInfo?paramId="+uid;

        // 리턴
        // returnCnt = 0; // 태스트용
        if (returnCnt == 1){
            return url;
        }else {
            return "/admin/getUserInfo?paramId="+reservationDTO.getUserId();
        }
    }

}

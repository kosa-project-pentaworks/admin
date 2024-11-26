package com.example.admin.controllers;


import com.example.admin.dto.HospitalDTO;
import com.example.admin.dto.ReservationDTO;
import com.example.admin.dto.UserDTO;
import com.example.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.HashMap;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/admin")
public class HospitalController {

    @Autowired
    private AdminService adminService;

    // ============================================================
    //  병원 목록 조회
    // ============================================================

    @GetMapping(value = "/selectHospitalListAll")
    public String selectHospitalListAll(@RequestParam HashMap<String, Object> paramMap , Model model) {

        // 요청
        log.info("selectHospitalListAll()");
        log.info("selectHospitalListAll() = {}",paramMap);
        // ============================================================
        //  searchType별 분기
        // ============================================================
        if(paramMap.isEmpty()){
            log.info("selectHospitalListAll() if");
        }
        else {
            String searchType = (String) paramMap.get("searchType");
            switch (searchType) {
                case "all":
                    paramMap.put("search", null);
                    break;
                case "yadmNm":
                    paramMap.put("yadmNm", paramMap.get("search"));
                    break;
                case "addr":
                    paramMap.put("addr", paramMap.get("search"));
                    break;
                case "telno":
                    paramMap.put("telno", paramMap.get("search"));
                    break;
                case "hospId":
                    paramMap.put("hospId", paramMap.get("search"));
                    break;
                default:

            }
            log.info("selectHospitalListAll() = {}", paramMap);
        }
        // 요청 실행: 조회
        List<HospitalDTO> returnHospitalList =adminService.selectHospListAll(paramMap);
//        log.info("selectHospitalListAll= {}",returnHospitalList.get(1));
//        for(int i=0; i < returnHospitalList.size() ; i++ ){
//            log.info("returnUserDTOList= {}",returnHospitalList.get(i).toString());
//        }
//        log.info("returnUserDTOList= {}",returnHospitalList.get(10).toString());
        // 모델에 유저 리스트를 담음

        model.addAttribute("hospitalList",returnHospitalList);

        // 검색 조건 유지를 위해 모델에 검색 조건 , 검색단어 를 담음
        model.addAttribute("searchType",(String) paramMap.get("searchType"));
        model.addAttribute("search",(String) paramMap.get("search"));

        log.info("searchType= {}",model.getAttribute("searchType"));
        log.info("search= {}",model.getAttribute("search"));

        //리턴
        return "hospitalList";
    }

    // ============================================================
    // 병원 id기준으로 병원 정보 하나 조회
    // ============================================================
    @GetMapping("/getHospitalInfo")
    public String getHospitalInfo(@RequestParam long paramId, Model model) {
        // 요청
        log.info("getHospitalInfo()2");
        log.info("getHospitalInfo()2 = {}", paramId);
        // ============================================================
        //  searchType = user_id 입력 받은 user_id로 정보 조회 후 전달
        // ============================================================
        HashMap<String, Object> map = new HashMap<>();
        map.put("hospId",paramId);


        List<HospitalDTO> returnHospitalList =adminService.selectHospListAll(map);

        HospitalDTO hospital = returnHospitalList.get(0);
        // 요청 실행:전체조회
//        UserDTO returnUserInfo = adminService.getUserInfo(paramId);
        log.info("getHospitalInfo= {}", hospital.getHospUrl());
        log.info("getHospitalInfo= {}", hospital.toString());
        model.addAttribute("hosp", hospital);
        //리턴
        return "hospitalInfo";
    }

}

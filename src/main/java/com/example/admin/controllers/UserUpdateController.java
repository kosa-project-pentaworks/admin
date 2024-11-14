package com.example.admin.controllers;


import com.example.admin.dto.UserDTO;
import com.example.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
@RequestMapping("/admin")
@Slf4j
public class UserUpdateController {

    @Autowired
    private AdminService adminService;


    // ============================================================
    // 업데이트를 위한 회원id로 회원 정보 조회 후 정보 전달
    // ============================================================
    @GetMapping("/getUserInfo")
    public String selectUserListAll(@RequestParam HashMap<String, Object> paramMap, Model model) {
        // 요청
        log.info("selectUserListAll()");
        log.info("selectUserListAll() = {}", paramMap);
        // ============================================================
        //  searchType = user_id 입력 받은 user_id로 정보 조회 후 전달
        // ============================================================


        // 요청 실행:전체조회
        UserDTO returnUserInfo = adminService.getUserInfo(paramMap);
        log.info("returnUserDTOList= {}", returnUserInfo.toString());

        model.addAttribute("userInfo",returnUserInfo);
        //리턴
        return "userInfo";
    }

    //---------------------------------
    // 방법 : @RequestParam
    //---------------------------------
    @ResponseBody
    @GetMapping(value ="/getUserInfoRest")
    public ResponseEntity<UserDTO> getMemberByIdRP(@RequestParam HashMap<String, Object> paramMap) {
        // 요청
        log.info("getMemberByIdRP() :: id = {}",paramMap);

        // 요청 실행
        // 조회 :아이디
        ResponseEntity<UserDTO> retult = adminService.getUserInfoRest(paramMap);


        //리턴
        return retult;
    }


}

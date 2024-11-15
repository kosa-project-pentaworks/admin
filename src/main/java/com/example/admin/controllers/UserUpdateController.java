package com.example.admin.controllers;


import com.example.admin.dto.UserDTO;
import com.example.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@Controller
@RequestMapping("/admin")
@Slf4j
public class UserUpdateController {

    @Autowired
    private AdminService adminService;


    // ============================================================
    // 업데이트를 위한 회원id로 회원 정보 조회 후  정보 수정 창으로 전달
    // ============================================================
    @GetMapping("/getUserInfo")
    public String selectUserListAll(@RequestParam long paramId, Model model) {
        // 요청
        log.info("selectUserListAll()2");
        log.info("selectUserListAll()2 = {}", paramId);
        // ============================================================
        //  searchType = user_id 입력 받은 user_id로 정보 조회 후 전달
        // ============================================================


        // 요청 실행:전체조회
        UserDTO returnUserInfo = adminService.getUserInfo(paramId);
        log.info("returnUserDTOList= {}", returnUserInfo.toString());

        model.addAttribute("user",returnUserInfo);
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


    // ============================================================
    // 업데이트 실향
    // ============================================================
    @PostMapping(value = "/update")
    public String userUpdate(@ModelAttribute UserDTO userDTO) {
        //요청
        log.info("userUpdate() :: userModel = {}",userDTO);

        //요청 처리
        // - 회원 정보를 업데이트
        int returnCnt = adminService.userUpdate(userDTO);
        log.info("userUpdate() :: returnCnt = {} ",returnCnt);
        log.info("userUpdate() :: getUserId = {} ",userDTO.getUserId());
        long uid = userDTO.getUserId();

        String url = "redirect:/admin/getUserInfo?paramId="+uid;

        // 리턴
        // returnCnt = 0; // 태스트용
        if (returnCnt == 1){
            return url;
        }else {
            return "/admin/getUserInfo?paramId="+userDTO.getUserId();
        }
    }

}

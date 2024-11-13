package com.example.admin.controllers;


import com.example.admin.dto.UserDTO;
import com.example.admin.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Objects;

@Slf4j
@Controller
@RequestMapping("/admin")
public class UserController {

    @Autowired
    private AdminService adminService;

    //회원 리스트 페이지로 이동
    @GetMapping("/userList")
    public String userListView() {
        log.info("userListView()");
        return "userList";
    }

    // ============================================================
    //  유저 목록 조회
    // ============================================================
    @GetMapping("/selectUserListAll")
    public String selectUserListAll(@RequestParam HashMap<String, Object> paramMap, Model model) {
        // 요청
        log.info("selectUserListAll()");
        log.info("selectUserListAll() = {}",paramMap);
        // ============================================================
        //  searchType별 분기
        // ============================================================
        if(paramMap.isEmpty()){
            log.info("selectUserListAll() if");
        }
        else {
            String searchType = (String) paramMap.get("searchType");


            switch (searchType) {
                case "all":
                    break;
                case "email":
                    paramMap.put("email", paramMap.get("search"));
                    break;
                case "username":
                    paramMap.put("username", paramMap.get("search"));
                    break;
                case "phone":
                    paramMap.put("phone", paramMap.get("search"));
                    break;
                default:

            }
            log.info("selectUserListAll() = {}", paramMap);
        }


        // 요청 실행: 전체조회
        List<UserDTO> returnUserList =adminService.selectUserListAll(paramMap);
        for(int i=0; i < returnUserList.size() ; i++ ){
            log.info("returnUserDTOList= {}",returnUserList.get(i).toString());
        }
//        log.info("returnUserDTOList= {}",returnMenusDtoList);
        // 모델에 유저 리스트를 담음
        model.addAttribute("userList",returnUserList);
        log.info("returnUserDTOList= {}",model.getAttribute("userList"));


        ResponseEntity<List<UserDTO>> results = ResponseEntity.status(HttpStatus.OK).body(returnUserList);

        //리턴
        return "userList";
    }




}

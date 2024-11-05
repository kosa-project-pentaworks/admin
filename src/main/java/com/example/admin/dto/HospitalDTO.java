package com.example.admin.dto;


import lombok.*;

import java.time.LocalDate;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class HospitalDTO {
    private Long hospId;
    private Integer clCd;
    private String addr;
    private String clCdNm;
    private String emdongNm;
    private LocalDate estbDd;
    private String hospUrl;
    private Integer postNo;
    private Integer sgguCd;
    private String sgguCdNm;
    private Integer sidoCd;
    private String sidoCdNm;
    private String telno;
    private String yadmNm;
    private String ykiho;
    private String hospStatus;

}


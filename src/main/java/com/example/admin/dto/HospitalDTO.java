package com.example.admin.dto;


import lombok.*;

import java.time.LocalDate;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class HospitalDTO {
    private Long hospId;
    private Integer clCd;
    private String addr;
    private String clCdNm;
    private String emdongNm;
    private String estbDd;
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


    private String hospStatusStr;

    @Override
    public String toString() {
        return "HospitalDTO{" +
                "hospId=" + hospId +
                ", clCd=" + clCd +
                ", addr='" + addr + '\'' +
                ", clCdNm='" + clCdNm + '\'' +
                ", emdongNm='" + emdongNm + '\'' +
                ", estbDd='" + estbDd + '\'' +
                ", hospUrl='" + hospUrl + '\'' +
                ", postNo=" + postNo +
                ", sgguCd=" + sgguCd +
                ", sgguCdNm='" + sgguCdNm + '\'' +
                ", sidoCd=" + sidoCd +
                ", sidoCdNm='" + sidoCdNm + '\'' +
                ", telno='" + telno + '\'' +
                ", yadmNm='" + yadmNm + '\'' +
                ", ykiho='" + ykiho + '\'' +
                ", hospStatus='" + hospStatus + '\'' +
                ", hospStatusStr='" + hospStatusStr + '\'' +
                '}';
    }
}


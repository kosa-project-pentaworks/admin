package com.example.admin.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ReservationStatusDTO {
    private int cnt;
    private String yearmonth;
    private String yadmNm;
    private String sidoCdNm;

    @Override
    public String toString() {
        return "ReservationStatusDTO{" +
                "cnt=" + cnt +
                ", yearmonth='" + yearmonth + '\'' +
                ", yadmNm='" + yadmNm + '\'' +
                ", sidoCdNm='" + sidoCdNm + '\'' +
                '}';
    }
}

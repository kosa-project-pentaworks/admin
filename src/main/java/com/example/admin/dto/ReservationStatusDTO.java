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

    @Override
    public String toString() {
        return "ReservationStatusDTO{" +
                "cnt=" + cnt +
                ", yearmonth='" + yearmonth + '\'' +
                '}';
    }
}

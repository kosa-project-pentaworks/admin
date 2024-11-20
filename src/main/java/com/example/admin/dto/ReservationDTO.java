package com.example.admin.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ReservationDTO {

    private Long hospReservationId;
    private String yadmNm;
    private Long userId;
    private String username;
    private String reservationAt;
    private String reservationTime;
    private String reservationStatus;


    @Override
    public String toString() {
        return "ReservationDTO{" +
                "hospReservationId=" + hospReservationId +
                ", yadmNm='" + yadmNm + '\'' +
                ", userId=" + userId +
                ", username='" + username + '\'' +
                ", reservationAt='" + reservationAt + '\'' +
                ", reservationTime='" + reservationTime + '\'' +
                ", reservationStatus='" + reservationStatus + '\'' +
                '}';
    }
}

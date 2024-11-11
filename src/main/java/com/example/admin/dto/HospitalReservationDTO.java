package com.example.admin.dto;


import lombok.*;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class HospitalReservationDTO {
    private Long hospReservationId;
    private LocalDateTime reservationAt;
    private String reservationTime;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
    private String reservationStatus;
    private Long userId;
    private Long paymentId;
    private Long hospId;

}
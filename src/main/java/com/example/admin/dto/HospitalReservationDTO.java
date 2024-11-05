package com.example.admin.dto;


import lombok.*;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class HospitalReservationDTO {
    private Long hospReservationId;
    private LocalDateTime reservationAt;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
    private Integer status;
    private Integer attended;
    private Long userId;
    private Long paymentId;
    private Long hospId;

}
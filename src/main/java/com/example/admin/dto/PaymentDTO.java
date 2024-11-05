package com.example.admin.dto;


import lombok.*;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PaymentDTO {
    private Long paymentId;
    private Long userId;
    private Long hospId;
    private String importUid;
    private String paymentStatus;
    private Integer amount;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;


}
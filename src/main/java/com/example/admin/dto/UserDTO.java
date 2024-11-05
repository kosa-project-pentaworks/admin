package com.example.admin.dto;


import lombok.*;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserDTO {
    private Long userId;
    private String providerId;
    private String email;
    private String username;
    private String phone;
    private String role;
    private String provider;
    private String status;
    private String zipcode;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private LocalDateTime createdAt;
    private String createdBy;
    private LocalDateTime modifiedAt;
    private String modifiedBy;


}
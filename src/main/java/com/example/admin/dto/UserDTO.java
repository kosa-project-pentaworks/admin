package com.example.admin.dto;


import lombok.*;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
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


    private String phoneStr;
    private String addressStr;
    private String createdAtStr;
    private String modifiedAtStr;

    @Override
    public String toString() {
        return "UserDTO{" +
                "userId=" + userId +
                ", providerId='" + providerId + '\'' +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", phone='" + phone + '\'' +
                ", role='" + role + '\'' +
                ", provider='" + provider + '\'' +
                ", status='" + status + '\'' +
                ", zipcode='" + zipcode + '\'' +
                ", addressLine1='" + addressLine1 + '\'' +
                ", addressLine2='" + addressLine2 + '\'' +
                ", city='" + city + '\'' +
                ", state='" + state + '\'' +
                ", createdAt=" + createdAt +
                ", createdBy='" + createdBy + '\'' +
                ", modifiedAt=" + modifiedAt +
                ", modifiedBy='" + modifiedBy + '\'' +
                ", phoneStr='" + phoneStr + '\'' +
                ", addressStr='" + addressStr + '\'' +
                ", createdAtStr='" + createdAtStr + '\'' +
                ", modifiedAtStr='" + modifiedAtStr + '\'' +
                '}';
    }
}

package com.example.admin.dto;

import lombok.*;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class UserHistoryDTO {
    private Long userHistoryId;
    private Long userId;
    private String userRole;
    private String reqIp;
    private String reqMethod;
    private String reqUrl;
    private String reqHeader;
    private String reqPayload;
    private LocalDateTime createdAt;
    private String createdBy;
    private LocalDateTime modifiedAt;
    private String modifiedBy;

}

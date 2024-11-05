package com.example.admin.dto;

import lombok.*;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserHistoryDTO {
    private Long historyId;
    private Long userId;
    private String status;
    private String actionType;
    private String ipAddress;
    private String userAgent;
    private String performedBy;
    private String oldValue;
    private String newValue;
    private LocalDateTime changeDate;

}

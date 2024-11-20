package com.example.admin.dto;


import lombok.*;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class HospitalReviewDTO {
    private Long hospReviewId;
    private String hospReviewContent;
    private Integer hospReviewRating;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
    private Long userId;
    private Long hospId;

}

package com.example.admin.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class StatusDTO {

    private int activeUser;
    private int deactivatedUser;
    private int allUser;
    private int cnt;
    private String sidoCdNm;

    @Override
    public String toString() {
        return "StatusDTO{" +
                "activeUser=" + activeUser +
                ", deactivatedUser=" + deactivatedUser +
                ", allUser=" + allUser +
                ", cnt=" + cnt +
                ", sidoCdNm='" + sidoCdNm + '\'' +
                '}';
    }
}

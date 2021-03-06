package com.example.h5api.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@Builder
public class UserDto {

    private int id;
    private LocalDate createAt;
    private LocalDate updateAt;
    private LocalDate deleteAt;
    private String name;
    private String email;
    private String company;
    private String password;
    private Boolean role; //Admin true
    private Boolean status;

    public UserDto() {
        this.createAt = LocalDate.now();
    }
}

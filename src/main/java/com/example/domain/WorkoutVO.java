package com.example.domain;

import java.math.BigDecimal;
import java.util.Date;

import lombok.Data;

@Data
public class WorkoutVO {
    private int workoutid;
    private String catename;
    private String workoutname;
    private BigDecimal kcal;
    private Integer photoid;
    private String workvideoid;
}

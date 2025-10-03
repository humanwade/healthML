package com.example.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserVO {

	private String email;
	private String username;
	private String password;
	private Date joindate ;
	private String goal;
	private String goalsuccess;
	private String height;
	private Integer age;
	private String gender;
	private String activity;
	private Integer photoid;
	private Date successdate;

	// 관리자 차트 불러오는 변수
	private int month;
	private int year;
	private int email_count;
	private int first_month;
	private int second_month;
	private int first_month_users;
	private int second_month_users;
	private double change_percentage;
	private int male_count;
	private int female_count;
	private String age_group;
	private int age_group_count;
	private int gender_count;
	
}


package com.example.domain;

import lombok.Data;

@Data
public class RecipeVO {

	private Integer recipeno;
	private String menuname;
	private String ingredient;
	private String imgurl;
	private String cooking;
	private Integer rcalorie;
}


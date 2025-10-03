package com.example.domain;

import lombok.Data;

@Data
public class NewsVO {

	private int newsid;
	private String title;
	private String newsurl;
	private String content;
	private String newsdate;
	private String nimgurl;
}


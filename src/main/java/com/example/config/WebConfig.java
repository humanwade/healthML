package com.example.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    // ✅ "/mypage" 같은 단순 뷰 매핑은 주석 처리 (Controller 충돌 방지)
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        // registry.addViewController("/mypage").setViewName("mypage/mypage"); ❌ 이거 있으면 컨트롤러 못 탐
    }

    // ✅ 정적 자원 매핑 설정
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        // 🔹 1️⃣ Flask 업로드 이미지 매핑
        registry
                .addResourceHandler("/uploads/**")
                .addResourceLocations("file:///C:/Users/wadeJung/Desktop/project/healthML/finalproject_py/uploads/");

        // 🔹 2️⃣ 유저 프로필 사진 (이미 있던 userphotos 설정)
        registry
                .addResourceHandler("/userphotos/**")
                .addResourceLocations("file:///C:/절대경로/userphotos/");

        // 🔹 3️⃣ (선택) 추가 static 폴더가 있다면 여기도 명시 가능
        // registry
        //     .addResourceHandler("/files/**")
        //     .addResourceLocations("classpath:/static/files/");
    }
}

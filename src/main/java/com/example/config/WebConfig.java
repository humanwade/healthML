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

        // Flask 업로드 이미지 (유지)
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:///C:/Users/wade/IdeaProjects/healthML/flask-api/uploads/");

        // User profile 사진 (정확한 경로로 수정)
        registry.addResourceHandler("/userphotos/**")
                .addResourceLocations("classpath:/static/userphotos/");

    }
}

package com.example.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    // ✅ 혹시 "/mypage"를 view로 직접 보내는 설정이 있을 경우 주석처리!
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        // registry.addViewController("/mypage").setViewName("mypage/mypage"); ❌ 이거 있으면 컨트롤러 못 탐
    }

    // ✅ 정적 자원 (이미지 등)만 명확하게 설정
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry
                .addResourceHandler("/userphotos/**")
                .addResourceLocations("file:///C:/절대경로/userphotos/");
        // ↑ 실제 저장된 경로에 맞게 수정하세요
    }
}

package com.example.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Value("${userphotos.path}")
    private String userPhotosPath;

    @Value("${uploads.path}")
    private String uploadsPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        // 사용자 프로필 사진 - 정적 리소스 매핑
        registry.addResourceHandler("/userphotos/**")
                .addResourceLocations(userPhotosPath);
        //System.out.println("[userphotos] 리소스 핸들러 경로 → " + userPhotosPath);

        // Flask 업로드 이미지
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations(uploadsPath);
        //System.out.println("[uploads] 리소스 핸들러 경로 → " + uploadsPath);
    }
}
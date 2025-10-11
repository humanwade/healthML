package com.example.controller;

import org.springframework.web.bind.annotation.*;
import org.jsoup.Jsoup;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.IOException;
import java.net.URI;
import java.net.http.*;
import java.util.Map;

@RestController
public class GptController {

    @PostMapping("/summarizeNews")
    public Map<String, String> summarizeNews(@RequestParam String newsurl) throws IOException, InterruptedException {

        // 1. 뉴스 본문 가져오기
        String html = Jsoup.connect(newsurl)
                .userAgent("Mozilla/5.0")
                .get()
                .text();

        // 2. 프롬프트 구성
        String prompt = "Summarize this news article in 3 sentences:\n" + html;

        // 3. API 키 확인
        String apiKey = System.getenv("OPENAI_API_KEY");
        if (apiKey == null) {
            throw new RuntimeException("Setting the OPENAI_API_KEY");
        }

        // 4. 요청 JSON 생성
        JSONObject message = new JSONObject()
                .put("role", "user")
                .put("content", prompt);

        JSONObject body = new JSONObject()
                .put("model", "gpt-4o-mini")
                .put("messages", new JSONArray().put(message));

        // 5. API 요청
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://api.openai.com/v1/chat/completions"))
                .header("Authorization", "Bearer " + apiKey)
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(body.toString()))
                .build();

        HttpResponse<String> response = HttpClient.newHttpClient()
                .send(request, HttpResponse.BodyHandlers.ofString());

        System.out.println("OpenAI Response: " + response.body());

        // 6. JSON 파싱
        JSONObject json = new JSONObject(response.body());

        if (json.has("error")) {
            throw new RuntimeException("OpenAI API Error: " + json.getJSONObject("error").getString("message"));
        }

        String summary = json.getJSONArray("choices")
                .getJSONObject(0)
                .getJSONObject("message")
                .getString("content");

        return Map.of("summary", summary);
    }
}

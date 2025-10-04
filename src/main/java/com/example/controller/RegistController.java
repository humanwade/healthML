package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.UserVO;
import com.example.domain.WeightVO;
import com.example.service.EmailService;
import com.example.service.UserService;
import com.example.service.WeightService;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/regist")
public class RegistController {

	@Autowired
	private UserService userservice;
	@Autowired
	private WeightService weightservice;
	@Autowired
	private EmailService emailservice;
	@Autowired
    private JavaMailSender mailSender;
	
	@RequestMapping("/start")
	public String home(HttpSession sess) {
        System.out.println("🔥 /regist/start 진입");
		sess.removeAttribute("user");
		return "regist/regist_start";
	}
	@RequestMapping("/goal")
	public String goal() {
		return "regist/regist_goal";
	}
	
	
	@RequestMapping("/activity")
	public String activity() {
		return "regist/regist_activity";
	}
	
	@RequestMapping("/gender")
	public String gender() {
		return "regist/regist_gender";
	}
	
	@RequestMapping("/height")
	public String height() {
		return "regist/regist_height";
	}
	
	@RequestMapping("/birth")
	public String birth() {
		return "regist/regist_birth";
	}
	
	@RequestMapping("/end")
	public String end() {
		return "regist/regist_end";
	}
	
	
	
	//회원가입페이지
	@RequestMapping("/enroll")
	public String enroll() {
		return "regist/enroll";
	}
	
	//이메일 중복검사
    @ResponseBody
    @RequestMapping("/emailDupleCheck")
    public String emailDupleCheck(String email) {
        System.out.println("=== 이메일 중복 확인 디버깅 ===");

        try {
            // 1. 서비스 자체가 null인지 확인
            if (userservice == null) {
                System.out.println("ERROR: UserService is null");
                return "error";
            }

            // 2. getUser 메서드 호출 시도
            System.out.println("Calling getUser with email: " + email);
            UserVO user = userservice.getUser(email);
            System.out.println("getUser result: " + user);

            if(user == null) {
                return "success";
            } else {
                return "fail";
            }
        } catch (Exception e) {
            System.err.println("EXCEPTION in emailDupleCheck:");
            e.printStackTrace();
            return "error";
        }
    }
	
	//회원가입
	@Transactional
	@RequestMapping("/saveUser")
	public String saveUser(UserVO user, HttpSession sess, WeightVO weight) {
		userservice.insertUser(user);
		weightservice.insertWeight(weight);
		return "redirect:login";
	}
	
	@RequestMapping("/login")
	public String login(HttpSession sess) {
		if(sess.getAttribute("user")!=null)
			return "redirect:/index";
		return "regist/login";
	}
	
	@ResponseBody
	@RequestMapping("/loginCheck")
	public String loginCheck(UserVO login, HttpSession sess) {
		UserVO user = userservice.loginCheck(login);
		if(user!=null) {
			sess.setAttribute("user", user.getEmail());
			return "success";
		}
		else return "fail";
		
	}
	
	// 비밀번호 찾기 페이지
	@RequestMapping("/reset")
	public String reset() {
		return "regist/pass_reset";
	}
	
	// 이메일 확인
	@ResponseBody
	@RequestMapping("/emailcheck")
	public String emailcheck(String email, HttpSession sess) {
		UserVO user = userservice.getUser(email);
		
		if(user != null) {
			String subject = "비밀번호 변경시 필요한 인증번호입니다.";
			// 인증번호 생성
			String verify = emailservice.generateVerificationCode();
			String text = "<h1>"+verify+"</h1>"
							+ "<hr/> 잘 기억하세요.!!<br/> <h2>꼭</h2>";
	        // 이메일 메시지 설정
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper;
			try {
				helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setTo(email);
		        helper.setSubject(subject);
		        helper.setText(verify, true);
		        mailSender.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			sess.setAttribute("verificationCode", verify);
			sess.setAttribute("email", email);
			return "확인";
		}
			
		else return "실패";
	}
	
	@RequestMapping("/resetchk")
	public String resetchk(HttpSession sess) {
		if(sess.getAttribute("email") == null)
			return "redirect:/regist/login";
		return "regist/pass_resetchk";
	}
	
	@RequestMapping("/password")
	public String password(HttpSession sess) {
		if(sess.getAttribute("email") == null)
			return "redirect:/regist/login";
		return "regist/new_password";
	}
	
	// 비밀번호 변경
	@ResponseBody
	@RequestMapping("newpassword")
	public String newpassword(UserVO user, HttpSession sess) {
		if(sess.getAttribute("email") == null 
				&& sess.getAttribute("user")==null)
			return "세션만료";
		String email = (String)sess.getAttribute("user");
		user.setEmail(email);
		userservice.passwordchange(user);
		return "변경성공";
	}
	
	// 마이페이지 비밀번호 체크
	@ResponseBody
	@RequestMapping("passwordcheck")
	public String passwordcheck(HttpSession sess, UserVO user) {
		if(sess.getAttribute("user")==null)
			return "세션만료";
		String email = (String)sess.getAttribute("user");
		user.setEmail(email);
		UserVO test = userservice.loginCheck(user);
		if(test == null) return "확인실패";
		return "확인완료";
	}

}

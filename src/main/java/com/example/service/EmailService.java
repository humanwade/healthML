package com.example.service;

import java.security.SecureRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
	
	
	private int length = 12;
	
	public String generateVerificationCode() { 
		
		String charUp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    String charLow = "abcdefghijklmnopqrstuvwxyz";
	    String num = "0123456789";
	    String all = charUp + charLow + num;
	    SecureRandom random = new SecureRandom();
		
		StringBuilder password = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(all.length());
            password.append(all.charAt(randomIndex));
       
        }
        
        return password.toString();
	}


}

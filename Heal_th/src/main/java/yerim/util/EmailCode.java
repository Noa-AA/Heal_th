package yerim.util;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import yerim.dto.Users;

@Component
public class EmailCode {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired JavaMailSender mailSender;
	
	public String sendEmailCode(Users userInfo) {
		
		logger.info("mailSender {}", mailSender);
		
		//인증을 위한 인증번호 생성(숫자 + 문자)
				Random ran = new Random();
				
				StringBuffer emailCode = new StringBuffer();
				
				
				//10 자리 난수 생성하기
				for( int i=0;i<10;i++) {
					if(ran.nextBoolean()) {
						//알파벳 수 = 26 아스키코드 영어 대문자 : 65~90/소문자 97~122
						emailCode.append((char)((int)ran.nextInt(26)+65));
					}else {
						//0~9숫가 넣기 
						emailCode.append(ran.nextInt(10));
					}
					
				}
				logger.info("인증번호 생성 완료 {}",emailCode);

				//이메일 보내기
				logger.info("이메일 : {}", userInfo.getUserEmail());
				logger.info("이름 : {}", userInfo.getUserName());
				
				String from ="yerim_nam@naver.com"; //보내는 사람 메일 주소
				String to = userInfo.getUserEmail(); //받는 사람 메일 주소(사용자가 입력한 메일 주소)
				String title ="[Heal_th] 이메일 인증을 위한 이메일 입니다.";
				String content =
						userInfo.getUserName()+"님의 이메일 인증을 위한 인증 번호 입니다."
						+"<br><br>"
						+"인증 번호는"+ emailCode+"입니다."
						+"<br>"
						+"해당 인증번호를 인증번호 확인란에 기입하여 주세요";
				
					logger.info("이메일 작성 완료");
				try {
					logger.info("이메일 보내기 시작 ");
					MimeMessage emailMsg = mailSender.createMimeMessage();  // --->이부분에서 문제가 있어서 오류가 뜨는거 같습니다.
					MimeMessageHelper helper = new MimeMessageHelper(emailMsg,true,"UTF-8");
					helper.setFrom(from);
					helper.setTo(to);
					helper.setSubject(title);
					helper.setText(content,true);
					mailSender.send(emailMsg);
				} catch (MessagingException e) {
					e.printStackTrace();
				}
				
				
				logger.info("이메일 보내기 완료  : {}",emailCode);
				return emailCode.toString();
				
	}
	
	
	
	
	
	


}

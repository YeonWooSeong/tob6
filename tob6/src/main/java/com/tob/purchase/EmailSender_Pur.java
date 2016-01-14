package com.tob.purchase;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
 
import com.tob.admin.Email;
 
@Component
public class EmailSender_Pur  {
     
     
	public void sendMail(Email_Pur adminEmail) throws MessagingException, UnsupportedEncodingException {

        // SSL // I USED THIS METHOD            
        Properties propsSSL = new Properties();

        // EVEN IF YOU SKIP THESE TWO PROP IT WOULD WORK
        propsSSL.put("mail.transport.protocol", "smtps");
        propsSSL.put("mail.smtps.host", "smtp.gmail.com");

        // THIS IS THE MOST IMPORTANT PROP --> "mail.smtps.auth"
        propsSSL.put("mail.smtps.auth", "true");

        Session sessionSSL = Session.getInstance(propsSSL);
        sessionSSL.setDebug(true);

        Message messageSSL = new MimeMessage(sessionSSL);
        messageSSL.setFrom(new InternetAddress("sellerofkorea@gmail.com", "김수민")); //setFrom: 보내는 사람의 이메일 주소와, 이름
        messageSSL.setRecipients(Message.RecipientType.TO, InternetAddress.parse(adminEmail.getReciver())); // setRecipients: 받는 사람의 이메일 주소
        messageSSL.setSubject(adminEmail.getSubject()); // 메일 제목
        messageSSL.setText(adminEmail.getContent()); // 메일 내용

        Transport transportSSL = sessionSSL.getTransport();
        // EVEN IF YOU SKIP PORT NUMBER , IT WOULD WORK
        transportSSL.connect("smtp.gmail.com", 465, "sellerofkorea@gmail.com", "hjsm0825"); // 이메일주소와, 비번
        transportSSL.sendMessage(messageSSL, messageSSL.getAllRecipients());
        transportSSL.close();
        System.out.println("SSL done.");
        System.out.println("받는 사람"+adminEmail.getReciver());
        System.out.println("메일 제목"+adminEmail.getSubject());
        System.out.println("보내는 내용"+adminEmail.getContent());
    }
    


    
    
    
    
    
    
  /* 이 버전은 com.sun.mail.smtp.SMTPSendFailedException: 530-5.5.1 Authentication Required 에러가 남. 
   * public void SendEmail(Email email) throws Exception {
        System.out.println("센드메일로진입");
        System.out.println("보내는 제목"+email.getSubject());
        System.out.println("받는 사람"+email.getReciver());
        System.out.println("보내는 내용"+email.getContent());
        MimeMessage msg = mailSender.createMimeMessage();
        msg.setSubject(email.getSubject());
        msg.setText(email.getContent());
        msg.setRecipient(RecipientType.TO , new InternetAddress(email.getReciver()));
        
        
        
        String SMTP_HOST_NAME = "gmail-smtp.l.google.com";
        // Properties 설정
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.host", SMTP_HOST_NAME);
        props.put("mail.smtp.auth", "true");
        mailSender.send(msg);
    }*/
}
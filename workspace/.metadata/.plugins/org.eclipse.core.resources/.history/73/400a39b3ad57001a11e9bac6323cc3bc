package com.team.mvc.item.command;

import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.ui.Model;

import com.team.mvc.dto.ItemDto;

public class ItemMailSendCommand implements ItemCommand {

   @Override
   public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) throws Exception {
      
      int authKey = 0;
      
      Map<String, Object> map = model.asMap();
      try {
         String email = request.getParameter("userEmail_");
         int iMonth = Integer.parseInt( request.getParameter("iMonth") );
        int iDay = Integer.parseInt( request.getParameter("iDay") );
        int iTime = Integer.parseInt( request.getParameter("iTime") );
         JavaMailSenderImpl mailSender = (JavaMailSenderImpl)map.get("mailSender");   // mailSender 가 메일을 보냄
         
         MimeMessage message = mailSender.createMimeMessage();
         
         message.setFrom(new InternetAddress("shaykan49@gmail.com"));   // 보내는 사람 메일 주소
         message.addRecipient(RecipientType.TO, new InternetAddress(email));
         authKey = (int)(Math.random() * 10000000) + 1234567;   // 랜덤으로 인증키 값 생성
         message.setSubject("인증메일입니다.");   // 메일 제목
         message.setText("클릭해서 인증하기 : <a style='color:blue; font-weight:bold;' href='http://localhost:9090/mvc/goReserve?iMonth=" + iMonth + "&iTime=" + iTime + "&iDay=" + iDay + "&authKey=" + authKey + "'>여기를 클릭하세요</a>", "UTF-8", "html");   // 메일 내용
         mailSender.send(message);
         
      } catch(MailException e) {
         System.out.println(e.getMessage());
      }
      
      model.addAttribute("authKey", authKey);   // 인증키를 다음 뷰에 전달하여 인증키가 맞는지 확인하기 위함
      
      String userId = request.getParameter("userId");
      int iMonth = Integer.parseInt( request.getParameter("iMonth") );
      int iDay = Integer.parseInt( request.getParameter("iDay") );
      int iTime = Integer.parseInt( request.getParameter("iTime") );
      ItemDto iDto = new ItemDto();
      iDto.setUserId(userId);
      iDto.setiMonth(iMonth);
      iDto.setiDay(iDay);
      iDto.setiTime(iTime);
      
      model.addAttribute("iDto", iDto);
      
   }

}
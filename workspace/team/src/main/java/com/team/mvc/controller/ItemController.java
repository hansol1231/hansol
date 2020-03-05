package com.team.mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.mvc.item.command.ItemCancelCommand;
import com.team.mvc.item.command.ItemCommand;
import com.team.mvc.item.command.ItemListCommand;
import com.team.mvc.item.command.ItemMailSendCommand;
import com.team.mvc.item.command.ItemReserveCommand;
import com.team.mvc.item.command.ItemSetCommand;
import com.team.mvc.item.command.ItemViewCommand;

@Controller
public class ItemController {

   // Field
   @Autowired
   private SqlSession sqlSession;
   @Autowired
   private JavaMailSender mailSender;   // servlet-context.xml 에 작성된 mailSender 자동 생성
   private ItemCommand iCommand;
   
   // Method
   // 예약을 위한 달력 페이지로 이동
   @RequestMapping("/goCalendar")
   public String goCalendar(Model model, HttpServletRequest request) throws Exception {
      iCommand = new ItemListCommand();
      iCommand.execute(sqlSession, model, request);
      return "/reserve/calendar";
   }

   // 예약 정보 입력 페이지로 이동
   // 예약 페이지 이동 시 캘린더에서 클릭한 월, 일, 시간대를 예약 페이지로 넘겨줌
   @RequestMapping("/goReserve")
   public String goReservePage(HttpServletRequest request, Model model) throws Exception {
      iCommand = new ItemSetCommand();
      iCommand.execute(sqlSession, model, request);
      return "/reserve/reservePage";
   }
   
   // 예약
   @RequestMapping("/reserve")
   public String reserve(RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) throws Exception {
      model.addAttribute("redirectAttributes", redirectAttributes);
      iCommand = new ItemReserveCommand();
      iCommand.execute(sqlSession, model, request);
      return "redirect:/goCancelPage";
   }
   
   // 예약 취소 페이지로 이동
   // 로그인 되어있을 때, 세션에 저장된 로그인 정보와 로그인 정보에 해당하는 예약 현황을 가져와서 보여주고
   // 원하는 예약 현황을 클릭하면 정보 입력을 시도. 입력한 정보와 회원 정보가 일치하면 예약 취소 진행
   @RequestMapping("/goCancelPage")
   public String goCancelPage(HttpServletRequest request, Model model) throws Exception {
      iCommand = new ItemViewCommand();
      iCommand.execute(sqlSession, model, request);
      return "/reserve/reserveViewPage";
   }

   // 예약 취소
   // 로그인 되어있을 때, 
   @RequestMapping("/cancel")
   public String cancel(RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) throws Exception {
      model.addAttribute("redirectAttributes", redirectAttributes);
      iCommand = new ItemCancelCommand();
      iCommand.execute(sqlSession, model, request);
      return "redirect:/goCancelPage";
   }
   
   // 관리자의 예약 취소
   @RequestMapping("/cancel2")
   public String cancel2(RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) throws Exception {
      model.addAttribute("redirectAttributes", redirectAttributes);
      iCommand = new ItemCancelCommand();
      iCommand.execute(sqlSession, model, request);
      return "redirect:/goReserveList";
   }
   
   @RequestMapping("sendMail")
   public String sendMail(HttpServletRequest request, Model model) throws Exception {
      model.addAttribute("mailSender", mailSender);
      iCommand = new ItemMailSendCommand();
      iCommand.execute(sqlSession, model, request);
      return "reserve/reservePage";
   }
   
}
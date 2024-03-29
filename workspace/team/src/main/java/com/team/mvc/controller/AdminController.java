package com.team.mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.mvc.admin.command.AdminAckCommand;
import com.team.mvc.admin.command.AdminAddCalendarCommand;
import com.team.mvc.admin.command.AdminCommand;
import com.team.mvc.admin.command.AdminListCommand;
import com.team.mvc.admin.command.AdminModifyCommand;
import com.team.mvc.admin.command.AdminQueryCommand;
import com.team.mvc.admin.command.AdminRemoveCalendarCommand;
import com.team.mvc.admin.command.AdminReserveListCommand;
import com.team.mvc.admin.command.AdminReserveSearchCommand;
import com.team.mvc.admin.command.AdminViewCommand;
import com.team.mvc.admin.command.AdminWriteCommand;
import com.team.mvc.item.command.ItemCommand;
import com.team.mvc.item.command.ItemListCommand;

@Controller
public class AdminController {

   @Autowired
   private SqlSession sqlSession;
   private AdminCommand adminCommand;
   
   @RequestMapping("adminList")
   public String adminlist(Model model, HttpServletRequest request) throws Exception {
      adminCommand = new AdminListCommand();
      adminCommand.execute(sqlSession, model, request);
      return "admin/adminList";
   }
   @RequestMapping("adminView")
   public String adminView(HttpServletRequest request, Model model) throws Exception {
      adminCommand = new AdminViewCommand();
      adminCommand.execute(sqlSession, model, request);      
      return "admin/adminView";
   }
   @RequestMapping("adminModify")
   public String adminModify(RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) throws Exception {
      model.addAttribute("redirectAttributes", redirectAttributes);
      adminCommand = new AdminModifyCommand();
      adminCommand.execute(sqlSession, model, request);      
      return "redirect:adminList";
   }
   @RequestMapping("adminWritePage")
   public String adminWritePage() {
      return "admin/adminWritePage";
   }
   @RequestMapping("adminWrite")
   public String adminWrite(RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) throws Exception {
      model.addAttribute("redirectAttributes", redirectAttributes);
      adminCommand = new AdminWriteCommand();
      adminCommand.execute(sqlSession, model, request);      
      return "redirect:adminList";
   }
   @RequestMapping("dynamicQueryList")
   public String dynamic(HttpServletRequest request, Model model) throws Exception {
      adminCommand = new AdminQueryCommand();
      adminCommand.execute(sqlSession, model, request);      
      return "admin/adminList";
   }
   @RequestMapping("adminCalendar")
      public String adminCalendar(HttpServletRequest request, Model model) throws Exception {
         ItemCommand itemCommand = new ItemListCommand();
         itemCommand.execute(sqlSession, model, request);
         return "admin/adminCalendar";
      }
   @RequestMapping("adminAddCalendar")
   public String adminAddCalendar(RedirectAttributes redirectAttributes, Model model, HttpServletRequest request) throws Exception {
      model.addAttribute("redirectAttributes", redirectAttributes);
      adminCommand = new AdminAddCalendarCommand();
      adminCommand.execute(sqlSession, model, request);      
      return "redirect:/";
   }
   @RequestMapping("ackReserve")
   public String ackReserve(RedirectAttributes redirectAttributes, Model model, HttpServletRequest request) throws Exception {
      model.addAttribute("request", request);
      model.addAttribute("redirectAttributes", redirectAttributes);
      adminCommand = new AdminAckCommand();
      adminCommand.execute(sqlSession, model, request);
      return "redirect:/goReserveList";
   }
   @RequestMapping("adminRemoveCalendar")
   public String adminRemoveCalendar(RedirectAttributes redirectAttributes, Model model, HttpServletRequest request) throws Exception {
      model.addAttribute("redirectAttributes", redirectAttributes);
      adminCommand = new AdminRemoveCalendarCommand();
      adminCommand.execute(sqlSession, model, request);      
      return "redirect:/";
   }
   @RequestMapping("goReserveList")
   public String adminGoReserveList(Model model, HttpServletRequest request) throws Exception {
      adminCommand = new AdminReserveListCommand();
      adminCommand.execute(sqlSession, model, request);      
      return "admin/adminReservedList";
   }
   @RequestMapping("reserveSearch")
   public String reserveSearch(HttpServletRequest request, Model model) throws Exception {
	  adminCommand = new AdminReserveSearchCommand();
	  adminCommand.execute(sqlSession, model, request);	      
	  return "admin/adminReservedList";
   }
}
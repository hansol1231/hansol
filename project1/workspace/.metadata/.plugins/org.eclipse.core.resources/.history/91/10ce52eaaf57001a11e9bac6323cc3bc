package com.team.mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.mvc.board.command.BoardCommand;
import com.team.mvc.board.command.BoardDeleteCommand;
import com.team.mvc.board.command.BoardListCommand;
import com.team.mvc.board.command.BoardModifyCommand;
import com.team.mvc.board.command.BoardMyListCommand;
import com.team.mvc.board.command.BoardQuerySearchCommand;
import com.team.mvc.board.command.BoardReplyCommand;
import com.team.mvc.board.command.BoardTypeSearchCommand;
import com.team.mvc.board.command.BoardViewCommand;
import com.team.mvc.board.command.BoardWriteCommand;

@Controller
public class BoardController {
   
   @Autowired
   private SqlSession sqlSession;
   private BoardCommand boardCommand;
   
   
   // 게시판 목록
   @RequestMapping("boardList")
   public String list(HttpServletRequest request, Model model) {
      boardCommand = new BoardListCommand();
      boardCommand.execute(sqlSession, model, request);
      return "board/boardList";
   }
   
   // 게시글 상세보기
   @RequestMapping("boardView")
   public String view(HttpServletRequest request, Model model) {
      boardCommand = new BoardViewCommand();
      boardCommand.execute(sqlSession, model, request);
      return "board/boardViewPage";
   }
   
   // 게시글 수정
   @RequestMapping("modify")
   public String modify(RedirectAttributes redirectAttributes,
                   HttpServletRequest request,
                   Model model) {
      model.addAttribute("redirectAttributes", redirectAttributes);
      boardCommand = new BoardModifyCommand();
      boardCommand.execute(sqlSession, model, request);
      return "redirect:boardList";
   }
   
   // 게시글쓰기 페이지 단순이동
   @RequestMapping("boardWritePage")
   public String boardWritePage() {
      return "board/boardWritePage";
   }
   
   // 게시글쓰기
   @RequestMapping("write")
   public String write(RedirectAttributes redirectAttributes,
		   MultipartHttpServletRequest request2,
                  Model model, HttpServletRequest request) {
      model.addAttribute("redirectAttributes", redirectAttributes);
      model.addAttribute("request", request);
      boardCommand = new BoardWriteCommand();
      boardCommand.execute(sqlSession, model, request);
      return "redirect:boardList";
   }
   
   // 게시글 삭제
   @RequestMapping("delete")
   public String delete(RedirectAttributes redirectAttributes,
                   HttpServletRequest request,
                   Model model) {
      model.addAttribute("redirectAttributes", redirectAttributes);
      boardCommand = new BoardDeleteCommand();
      boardCommand.execute(sqlSession, model, request);
      return "redirect:boardList";
   }
   
   // 댓글 목록
   @RequestMapping("listReply")
   public String replyList(Model model) {
      boardCommand = new BoardListCommand();
      boardCommand.execute(sqlSession, model, null);
      return "board/boardList";
   }
   
   // 댓글작성(단순이동)
   @RequestMapping("replyPage")
   public String writeReplyPage(@RequestParam("bIdx") int bIdx, Model model) {
     model.addAttribute("bIdx", bIdx);
      return "board/replyPage";
   }
   
   // 댓글작성
   @RequestMapping("reply")
   public String reply(HttpServletRequest request, Model model) {
      boardCommand = new BoardReplyCommand();
      boardCommand.execute(sqlSession, model, request);
      return "redirect:boardList";
   }
   
   // 내 게시판 목록
   @RequestMapping("boardMyList")
   public String MyList(HttpServletRequest request, Model model) {
      boardCommand = new BoardMyListCommand();
      boardCommand.execute(sqlSession, model, request);
      return "board/boardList";
   }
   // 게시글 항목
   @RequestMapping("typeSearch")
   public String typeSearch(HttpServletRequest request, Model model) {
      boardCommand = new BoardTypeSearchCommand();
      boardCommand.execute(sqlSession, model, request);
      return "board/boardList";
   }
   // 게시글 검색
   @RequestMapping("querySearch")
   public String querySearch(HttpServletRequest request, Model model) {
      boardCommand = new BoardQuerySearchCommand();
      boardCommand.execute(sqlSession, model, request);
      return "board/boardList";
   }
   
   
}
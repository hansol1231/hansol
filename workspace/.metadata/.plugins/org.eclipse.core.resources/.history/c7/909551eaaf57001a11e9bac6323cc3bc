package com.team.mvc.board.command;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.mvc.dao.BoardDao;
import com.team.mvc.dto.BoardDto;
import com.team.mvc.dto.MemberDto;

public class BoardWriteCommand implements BoardCommand {

   @Override
   public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) {
	   Map<String, Object> map = model.asMap();
	   BoardDao bDao = sqlSession.getMapper(BoardDao.class);
	   HttpSession session = request.getSession();
	   MemberDto loginDto = (MemberDto) session.getAttribute("loginDto");
	   String bWriter = loginDto.getUserName();
	   String bTitle = request.getParameter("bTitle");
	   String bContent = request.getParameter("bContent");
	   String bIsOpen = request.getParameter("bIsOpen");
	   String userIdx = request.getParameter("userIdx");
	   int bType = Integer.parseInt( request.getParameter("bType") );
	   BoardDto bDto = new BoardDto();
	   bDto.setUserIdx(Integer.parseInt(userIdx));
	   bDto.setbWriter(bWriter);
	   bDto.setbTitle(bTitle);
	   bDto.setbContent(bContent);
	   bDto.setbIsOpen(bIsOpen);
	   bDto.setbType(bType);
	   MultipartHttpServletRequest request2 = (MultipartHttpServletRequest) map.get("request");
	   MultipartFile file = request2.getFile("bImage");
	   String originFilename = file.getOriginalFilename();
	   String extentionName = originFilename.substring(originFilename.lastIndexOf(".") + 1, originFilename.length());
	   String saveFilename = null;
	   try {
		   saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) + "_" + System.currentTimeMillis() + "." + extentionName;
		   String realPath = request.getSession().getServletContext().getRealPath("/resources/upload");
		   File directory = new File(realPath); // File 을 사용했지만 경로만 이용하는 경우에는 파일이 아니라 폴더의 개념이다.
		   if ( !directory.exists() ) {
			   directory.mkdirs(); // 서브디렉토리가 없으면 모두 만든다. (mkdir 이 아니라 mkdirs)
		   }
		   File saveFile = new File(realPath, saveFilename);
		   file.transferTo(saveFile);
	   } catch (Exception e) {
		   e.printStackTrace();
	   }
	   if(saveFilename == null) {
		   saveFilename = "없음";
	   }
	   bDto.setbImage(saveFilename);
	   int writeResult = bDao.write(bDto);
  
	   RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
	   redirectAttributes.addFlashAttribute("writeResult", writeResult);
	   redirectAttributes.addFlashAttribute("isWrite", "yes");
      
   }

}
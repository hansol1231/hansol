package com.team.mvc.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.mvc.dao.MemberDao;
import com.team.mvc.dto.MemberDto;
import com.team.mvc.member.command.MemberCommand;
import com.team.mvc.member.command.MemberInfoModifyCommand;
import com.team.mvc.member.command.MemberLeaveCommand;
import com.team.mvc.member.command.MemberLoginCommand;
import com.team.mvc.member.command.MemberLogoutCommand;
import com.team.mvc.member.command.MemberPwChangePage;
import com.team.mvc.member.command.MemberPwModifyCommand;


@Controller
public class MemberController {

	@Autowired
	private SqlSession sqlSession;
	
	private MemberCommand memberCommand;
	
	// 단순 페이지 이동ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	@RequestMapping("loginPage")
	public String loginPage() {
		return "login/loginPage";
	}
	@RequestMapping("searchIdPage")
	public String searchIdPage() {
		return "login/searchIdPage";
	}
	@RequestMapping("searchPwPage")
	public String searchPwPage() {
	   return "login/searchPwPage";
	}
	@RequestMapping("myPage")
	public String myPage() {
	   return "join/myPage";
	}
	@RequestMapping("sessionClear")
    public String sessionClear() {
       return "sessionClear";
	}
	@RequestMapping("leavePage")
	public String leavePage() {
	   return "join/leavePage";
	}
	@RequestMapping("infoPage")
	public String infoPage() {
	   return "menu/infoPage";
	}
	@RequestMapping("introPage")
	public String introPage() {
	   return "menu/introPage";
	}
	@RequestMapping("weatherPage")
	public String weatherPage() {
	   return "menu/weatherPage";
	}
	@RequestMapping("parkingPage")
	public String parkingPage() {
	   return "menu/parkingPage";
	}
	
	// 단순 페이지 이동 여기까지ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	// Command 이용ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	@RequestMapping("changePwPage")
	public String pwChangePage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		memberCommand = new MemberPwChangePage();
		memberCommand.execute(sqlSession, model);
	    return "login/changePwPage";
	}
	@RequestMapping("login")
	public String login(RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes", redirectAttributes);
		memberCommand = new MemberLoginCommand();
		memberCommand.execute(sqlSession, model);
		return "redirect:/";
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		memberCommand = new MemberLogoutCommand();
		memberCommand.execute(sqlSession, model);
		return "index";
	}
	
	@RequestMapping("infoModify")
	public String infoModify(RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes", redirectAttributes);
		memberCommand = new MemberInfoModifyCommand();
		memberCommand.execute(sqlSession, model);
		return "redirect:/loginPage";
	}
	
	@RequestMapping("leave")
	public String leave(RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes", redirectAttributes);
		memberCommand = new MemberLeaveCommand();
		memberCommand.execute(sqlSession, model);
		return "redirect:/loginPage";
	}
	
	@RequestMapping("changePw")
	public String changePw(RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes", redirectAttributes);
		memberCommand = new MemberPwModifyCommand();
		memberCommand.execute(sqlSession, model);
		return "redirect:/loginPage";
	}
	   @RequestMapping("joinPage")
	   public String joinPage(HttpServletRequest request, Model model) {
	   // 각자 오픈API 사용 신청으로 받은 id, secret
	   String clientId = "tdHhSZ64BoV_AaSjgNbu";//애플리케이션 클라이언트 아이디값";
	   String clientSecret = "b9EUS3zKkC";//애플리케이션 클라이언트 시크릿값";
	   
	   try {
		   /***** 1. 캡차 키 발급 요청 *****/
		   String code = "0"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
		   String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
		   URL url = new URL(apiURL);
		   HttpURLConnection con = (HttpURLConnection)url.openConnection();
		   con.setRequestMethod("GET");
		   con.setRequestProperty("X-Naver-Client-Id", clientId);
		   con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		   int responseCode = con.getResponseCode();
		   BufferedReader br;
		   if(responseCode==200) { // 정상 호출
			   br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		   } else {  // 에러 발생
			   br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		   }
		   String inputLine;
		   StringBuffer sb = new StringBuffer();
		   while ((inputLine = br.readLine()) != null) {
			   sb.append(inputLine);
		   }
		   br.close();
		   System.out.println(sb.toString());	// sb -> {"key":"hACfGJuf0Cp2xgvX"} JSON 형식의 자바 String
		   
		   
		   /***** 밑에서 부터는 내가 짜야하는 코드 *****/
		   
		   // 무엇이 필요? key 값을 구해서 이미지 요청 시에 사용
		   
		   // sb.toString() : JSON 형식의 자바 String
		   // 1) JSONParser 를 통해서 parse() 메소드를 호출하고 JSONObject 객체를 생성한다.
		   JSONParser parser = new JSONParser();
		   JSONObject obj = (JSONObject)parser.parse(sb.toString());
		   
		   // 2) 생성된 JSONObject 객체의 get("key") 메소드를 호출하면 key 값("hACfGJuf0Cp2xgvX" 이 값은 랜덤)을 구한다.
		   // 3) session 에 key 값 저장
		   HttpSession session = request.getSession();
		   session.setAttribute("key", obj.get("key"));	// session.setAttribute("key", "hACfGJuf0Cp2xgvX");
		   
		   /***** 위에는 내가 짜야하는 코드 *****/
		   
		   /***** 2. 캡차 이미지 요청 *****/
		   
		   String key = (String)obj.get("key"); // https://openapi.naver.com/v1/captcha/nkey 호출로 받은 키값
		   apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;
		   url = new URL(apiURL);
		   con = (HttpURLConnection)url.openConnection();
		   con.setRequestMethod("GET");
		   con.setRequestProperty("X-Naver-Client-Id", clientId);
		   con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		   responseCode = con.getResponseCode();
		   if(responseCode==200) { // 정상 호출
			   InputStream is = con.getInputStream();
			   int read = 0;
			   byte[] bytes = new byte[1024];
			   // 랜덤한 이름으로  파일 생성
			   String tempname = Long.valueOf(new Date().getTime()).toString();
			   
			   // upload 폴더로 파일 저장 경로를 바꾸자.
			   // realPath 를 알아내자
			   String realPath = session.getServletContext().getRealPath("/resources/captcha");
			   
			   // realPath 를 반영하도록 File 경로 변경
			   File f = new File(realPath + "/" + tempname + ".jpg");
			   
			   
			   f.createNewFile();
			   OutputStream os = new FileOutputStream(f);
			   while ((read =is.read(bytes)) != -1) {
				   os.write(bytes, 0, read);
			   }
			   os.close();
			   is.close();
			   
			   // 다른 view 에서 <img> 태그로 발급 받은 이미지를 보여주려면
			   // tempname 을 전달해야 한다.
			   session.setAttribute("tempname", tempname + ".jpg");
			   
		   } else {  // 에러 발생
			   br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			   sb  = new StringBuffer();
			   while ((inputLine = br.readLine()) != null) {
				   sb.append(inputLine);
			   }
			   br.close();
			   System.out.println(sb.toString());
		   }
		   
		   
	   } catch (Exception e) {
		   System.out.println(e);
	   }
	   
	   // 이동 (request 보내기)
	   //model.addAttribute("request", request);
	   
	   return "join/joinPage";
   }
	// Command 이용 여기까지ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
	
	
	
	
	// start ajax ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	@SuppressWarnings("unchecked")
	@RequestMapping(value="join", produces="application/json")
	@ResponseBody
	public String join(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userSN = request.getParameter("userSN");
		String userAddr = request.getParameter("userAddr");
		String userEmail = request.getParameter("userEmail");
		String userTel = request.getParameter("userTel");
		MemberDto mDto = new MemberDto();
		mDto.setUserId(userId);
		mDto.setUserPw(userPw);
		mDto.setUserName(userName);
		mDto.setUserEmail(userEmail);
		mDto.setUserTel(userTel);
		mDto.setUserAddr(userAddr);
		mDto.setUserSN(userSN);
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		JSONObject obj = new JSONObject();
		int result = mDao.join(mDto);
		obj.put("joinResult", result + "");
		return obj.toJSONString();
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value="idCheck", produces="application/json")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		JSONObject obj = new JSONObject();
		MemberDto mDto = mDao.select_by_userId(userId);
		int result;
		if(mDto != null){result = 1;}
		else 			{result = 0;}
		obj.put("idCheckResult", result + "");
		return obj.toJSONString();
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value="snCheck", produces="application/json")
	@ResponseBody
	public String snCheck(HttpServletRequest request) {
		String userSN = request.getParameter("userSN");
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		JSONObject obj = new JSONObject();
		MemberDto mDto = mDao.select_by_userSN(userSN);
		int result;
		if(mDto != null){result = 1;}
		else 			{result = 0;}
		obj.put("SNCheckResult", result + "");
		return obj.toJSONString();
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value="emailCheck", produces="application/json")
	@ResponseBody
	public String emailCheck(HttpServletRequest request) {
		String userEmail = request.getParameter("userEmail");
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		JSONObject obj = new JSONObject();
		MemberDto mDto = mDao.select_by_userEmail(userEmail);
		int result;
		if(mDto != null){result = 1;}
		else 			{result = 0;}
		obj.put("emailCheckResult", result + "");
		return obj.toJSONString();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="telCheck", produces="application/json")
	@ResponseBody
	public String telCheck(HttpServletRequest request) {
		String userTel = request.getParameter("userTel");
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		JSONObject obj = new JSONObject();
		MemberDto mDto = mDao.select_by_userTel(userTel);
		int result;
		if(mDto != null){result = 1;}
		else 			{result = 0;}
		obj.put("telCheckResult", result + "");
		return obj.toJSONString();
	}
	
	@SuppressWarnings({ "unchecked", "unused" })
	@RequestMapping(value="searchId", produces="application/json")
	@ResponseBody
	public String searchId(HttpServletRequest request) {
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		
		JSONObject obj = new JSONObject();
		
		MemberDto mDto = new MemberDto();
		mDto.setUserName(userName);
		mDto.setUserEmail(userEmail);
		
		MemberDto searchResult = mDao.select_by_userName_userEmail(userName, userEmail);
		String idResult = searchResult.getUserId();
		
		if(searchResult != null){obj.put("searchIdResult", idResult);}
		else 					{obj.put("searchIdResult", "fail");}
		
		return obj.toJSONString();
	}
	
	@SuppressWarnings({ "unchecked", "unused" })
	@RequestMapping(value="searchPw", produces="application/json")
	@ResponseBody
	public String searchPw(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		String userTel = request.getParameter("userTel");
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		
		JSONObject obj = new JSONObject();
		
		MemberDto mDto = new MemberDto();
		mDto.setUserId(userId);
		mDto.setUserTel(userTel);
		
		MemberDto searchResult = mDao.select_by_userId_userTel(userId, userTel);
		String pwResult = searchResult.getUserPw();
		
		if(searchResult != null){obj.put("searchPwResult", pwResult);}
		else 					{obj.put("searchPwResult", "fail");}
		
		return obj.toJSONString();
	}
	@RequestMapping(value="weather", produces="application/text; charset=utf-8")
    @ResponseBody
    public String weather(HttpServletRequest request, HttpServletResponse response) throws Exception{
       request.setCharacterEncoding("utf-8");
       response.setContentType("text/html; charset=utf-8"); 
       String addr = "http://www.kma.go.kr/XML/weather/sfc_web_map.xml";
       URL url = null;
       HttpURLConnection conn = null;
       StringBuffer sb = new StringBuffer();
       InputStream is = null;
       BufferedReader br = null;
       String line = null;
       try {
          url = new URL(addr);
          conn = (HttpURLConnection)url.openConnection();
          is = conn.getInputStream();
          br = new BufferedReader(new InputStreamReader(is));
          while(true) {
             line = br.readLine();   
             if(line == null) {break;}
             sb.append(line);
          }
       } 
       catch (Exception e) { e.printStackTrace(); } 
       finally {
          try {
             if(br != null)     {br.close();     		}
             if(is != null)     {is.close();      		}
             if(conn != null)   {conn.disconnect();   	}
          } 
          catch (Exception e) { e.printStackTrace(); 	} 
       }
       return sb.toString();
    }
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="checkImg", produces="application/json")
    @ResponseBody
    public String checkImg(HttpServletRequest request) throws Exception {
	   JSONObject obj = new JSONObject();
	   String clientId = "tdHhSZ64BoV_AaSjgNbu";
       String clientSecret = "b9EUS3zKkC";
       String key = (String)request.getSession().getAttribute("key");
       request.setCharacterEncoding("utf-8");
       String value = request.getParameter("inputCaptcha");
       try {
           String code = "1";
           String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code +"&key="+ key + "&value="+ value;
           URL url = new URL(apiURL);
           HttpURLConnection con = (HttpURLConnection)url.openConnection();
           con.setRequestMethod("GET");
           con.setRequestProperty("X-Naver-Client-Id", clientId);
           con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
           int responseCode = con.getResponseCode();
           BufferedReader br;
           if(responseCode==200) {
               br = new BufferedReader(new InputStreamReader(con.getInputStream()));
           } else {
               br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
           }
           String inputLine;
           StringBuffer sb = new StringBuffer();
           while ((inputLine = br.readLine()) != null) {sb.append(inputLine); }
           br.close();
           JSONParser parser = new JSONParser();
           obj = (JSONObject)parser.parse(sb.toString());
           if(obj.get("result") != null){obj.put("captchaResult", obj.get("result"));}
   		   else 				        {obj.put("captchaResult", "fail");}
       } catch (Exception e) {
           System.out.println(e);
       }
       return obj.toJSONString();
    }
	// end ajaxㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
}

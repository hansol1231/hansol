package com.team.mvc.admin.command;

import java.awt.Robot;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.mvc.dao.AdminDao;
import com.team.mvc.dto.ItemDto;

public class AdminAddCalendarCommand implements AdminCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model, HttpServletRequest request) throws Exception {
		
		Calendar cal = Calendar.getInstance();
		int nowMonth = cal.get(Calendar.MONTH) + 1;
		int addResult = 1;
		
		for(int iMonth=nowMonth; iMonth <= nowMonth+2; iMonth++) {
			AdminDao aDao = sqlSession.getMapper(AdminDao.class);
			ArrayList<ItemDto> list = aDao.adminSearchCalendar(iMonth, 1);
			Robot robot = new Robot();
			
			if( iMonth == 13 ) {
				iMonth = 1;
			}
			if( iMonth == 14 ) {
				iMonth = 2;
			}
			
			if( !(list.isEmpty()) ) {
				continue;
			} else {
				if( iMonth==1 || iMonth==3 || iMonth==5 || iMonth==7 || iMonth==8 || iMonth==10 || iMonth==12 ) {
					for(int iDay=1; iDay<=31; iDay++) {
						for(int j=1; j<=3; j++) {
							addResult *= aDao.adminAddCalendar(iMonth, iDay, j);
							robot.delay(50);
						}
					}
				} else if( iMonth==4 || iMonth==6 || iMonth==9 || iMonth==11 ) {
					for(int iDay=1; iDay<=30; iDay++) {
						for(int j=1; j<=3; j++) {
							addResult *= aDao.adminAddCalendar(iMonth, iDay, j);
							robot.delay(50);
						}
					}
				} else if( iMonth==2 ) {
					GregorianCalendar gc = new GregorianCalendar();
					if( gc.isLeapYear(cal.get(Calendar.YEAR)) ) {	// ���� �⵵�� �����̶��
						for(int iDay=1; iDay<=29; iDay++) {
							for(int j=1; j<=3; j++) {
								addResult *= aDao.adminAddCalendar(iMonth, iDay, j);
								robot.delay(50);
							}
						}
					} else {
						for(int iDay=1; iDay<=28; iDay++) {
							for(int j=1; j<=3; j++) {
								addResult *= aDao.adminAddCalendar(iMonth, iDay, j);
								robot.delay(10);
							}
						}
					}
				}
			}
		}
		
		Map<String, Object> map = model.asMap();
		RedirectAttributes redirectAttributes = (RedirectAttributes)map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("addResult", addResult);
		redirectAttributes.addFlashAttribute("isCalendarAdd", "yes");
		
		
	}

}

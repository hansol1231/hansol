<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="달력" name="title" />
</jsp:include>

<script src="https://kit.fontawesome.com/69d88719f9.js" crossorigin="anonymous"></script>

<script type="text/javascript">
    var today = new Date(); //오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
    var date = new Date(); //today의 Date를 세어주는 역할
    function prevCalendar() { //이전 달
        today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
        buildCalendar(); //달력 cell 만들어 출력 
    }

    function nextCalendar() { //다음 달
        today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        buildCalendar(); //달력 cell 만들어 출력
    }

    function buildCalendar() { //현재 달 달력 만들기
        var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
        var tbCalendar = document.getElementById("calendar");
        var tbCalendarYM = document.getElementById("tbCalendarYM");
        tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";

        while (tbCalendar.rows.length > 2) {
            tbCalendar.deleteRow(tbCalendar.rows.length - 1);
        }
        var row = null;
        row = tbCalendar.insertRow();
        var cnt = 0; // count, 셀의 갯수를 세어주는 역할
        for (i = 0; i < doMonth.getDay(); i++) {
            cell = row.insertCell(); //열 한칸한칸 계속 만들어주는 역할
            cnt = cnt + 1; //열의 갯수를 계속 다음으로 위치하게 해주는 역할
        }
        for (i = 1; i <= lastDate.getDate(); i++) {
            cell = row.insertCell(); //열 한칸한칸 계속 만들어주는 역할
            cell.innerHTML = "<span class='info' style='font-size:17px; font-weight:bold'>" + i + "일 " + "예약현황</span><br><br><span style='font-size:14px; color:red;'>예약 기간이 아닙니다.</span><br>";

            <c:forEach var = 'iDto' items = '${iList}'>
                var iTime = '${iDto.iTime}';
            var iMonth = '${iDto.iMonth}';
            var iDay = '${iDto.iDay}';
            var iReserve = '${iDto.iReserve}';

            if (iMonth == (today.getMonth() + 1) && iDay == i) {
                if (i > iDay) {
                    cell.innerHTML = "<span class='info' style='font-size:17px; font-weight:bold'>" + i + "일 " + "예약현황</span><br><br><span style='font-size:17px; color:red;'>예약 기한 만료</span><br>";
                } else {
                    if (iTime == 1 && iReserve == 'yes') {
                        cell.innerHTML = "<span class='info' style='font-size:17px; font-weight:bold'>" + i + "일 " + "예약현황</span><br><br><span style='font-size:15px; color:red; letter-spacing: 1px;'>12:00~14:00 마감</span><br/>";
                    } else if (iTime == 2 && iReserve == 'yes') {
                        cell.innerHTML += "<span style='font-size:15px; color:red; letter-spacing: 1px;'>14:00~16:00 마감</span><br/>";
                    } else if (iTime == 3 && iReserve == 'yes') {
                        cell.innerHTML += "<span style='font-size:15px; color:red; letter-spacing: 1px;'>16:00~18:00 마감</span><br/>";
                    } else if (iTime == 1 && iReserve == 'sby') {
                        cell.innerHTML = "<span class='info' style='font-size:17px; font-weight:bold'>" + i + "일 " + "예약현황</span><br><br><span style='font-size:15px; color:grey; letter-spacing: 1px;'>12:00~14:00 대기</span><br/>";
                    } else if (iTime == 2 && iReserve == 'sby') {
                        cell.innerHTML += "<span style='font-size:15px; color:grey; letter-spacing: 1px;'>14:00~16:00 대기</span><br/>";
                    } else if (iTime == 3 && iReserve == 'sby') {
                        cell.innerHTML += "<span style='font-size:15px; color:grey; letter-spacing: 1px;'>16:00~18:00 대기</span><br/>";
                    } else if (iTime == 1 && iReserve == 'no') {
                        cell.innerHTML = "<span class='info' style='font-size:17px; font-weight:bold'>" + i + "일 " + "예약현황</span><br><br><a style='font-size:15px; text-decoration:none; color:blue; letter-spacing: 1px;' href='goReserve?iMonth=" + (today.getMonth() + 1) + "&iTime=1&iDay=" + i + "'>12:00~14:00 가능</a><br>";
                    } else if (iTime == 2 && iReserve == 'no') {
                        cell.innerHTML += "<a style='font-size:15px; text-decoration:none; color:blue; letter-spacing: 1px;' href='goReserve?iMonth=" + (today.getMonth() + 1) + "&iTime=2&iDay=" + i + "'>14:00~16:00 가능</a><br>";
                    } else if (iTime == 3 && iReserve == 'no') {
                        cell.innerHTML += "<a style='font-size:15px; text-decoration:none; color:blue; letter-spacing: 1px;' href='goReserve?iMonth=" + (today.getMonth() + 1) + "&iTime=3&iDay=" + i + "'>16:00~18:00 가능</a><br>";
                    } 
                }
            }

            </c:forEach>

            /*
            cell.innerHTML += "<a href='goReserve?iMonth=" + (today.getMonth()+1) + "&iTime=1&iDay=" + i + "'>12:00~14:00</a><br>";
            cell.innerHTML += "<a href='goReserve?iMonth=" + (today.getMonth()+1) + "&iTime=2&iDay=" + i + "'>14:00~16:00</a><br>";
            cell.innerHTML += "<a href='goReserve?iMonth=" + (today.getMonth()+1) + "&iTime=3&iDay=" + i + "'>16:00~18:00</a><br>";
            */
            cnt = cnt + 1; //열의 갯수를 계속 다음으로 위치하게 해주는 역할
            if (cnt % 7 == 1) {
                /*일요일 계산*/
                cell.innerHTML = "<font color=red>" + i
            }
            if (cnt % 7 == 0) {
                /* 1주일이 7일 이므로 토요일 구하기*/
                cell.innerHTML = "<font color=blue>" + i
                row = calendar.insertRow();
            }
            if (today.getFullYear() == date.getFullYear() &&
                today.getMonth() == date.getMonth() &&
                i == date.getDate()) {
                cell.bgColor = "#FAF58C"; //셀의 배경색을 노랑으로 
            }
        }
    }

</script>
<div class="cal_t">
    <h1>예약</h1>
    <div style="text-align: right; padding-right: 130px;">
        <span style="color: red; font-weight: bold; font-size: 18px; text-align: left; padding-right: 100px;">당일 예약은 불가합니다. 여유있는 날짜를 선택하세요.</span>
        <span style="color: blue; font-weight: bold; font-size: 18px;">예약 가능</span>&nbsp;|&nbsp;
        <span style="color: red; font-weight: bold; font-size: 18px;">예약 불가능</span>
    </div>
    <table id="calendar">
        <tr>
            <!-- label은 마우스로 클릭을 편하게 해줌 -->
            <td style="vertical-align: middle;">
                <label onclick="prevCalendar()">
                    <span style="font-size: 30px; padding: 10px; font-weight:bold;"><i class="fas fa-backward"></i></span>
                </label>
            </td>
            <td style="font-weight:bold; font-size: 30px; padding: 10px; vertical-align: middle;" id="tbCalendarYM" colspan="5">
                yyyy년 m월
            </td>
            <td style="vertical-align: middle;">
                <label onclick="nextCalendar()">
                    <span style="font-size: 30px; padding: 10px; font-weight:bold;"><i class="fas fa-forward"></i></span>
                </label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; font-size: 20px; color: red;">일</td>
            <td style="text-align: center; font-size: 20px">월</td>
            <td style="text-align: center; font-size: 20px">화</td>
            <td style="text-align: center; font-size: 20px">수</td>
            <td style="text-align: center; font-size: 20px">목</td>
            <td style="text-align: center; font-size: 20px">금</td>
            <td style="text-align: center; font-size: 20px; color: blue;">토</td>
        </tr>
    </table>
    <script type="text/javascript">
        buildCalendar(); //

    </script>
</div>


<%@ include file="../layout/footer.jsp" %>

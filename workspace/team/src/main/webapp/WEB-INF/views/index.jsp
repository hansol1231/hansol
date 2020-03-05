<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="layout/header.jsp">
    <jsp:param value="로그인페이지" name="title" />
</jsp:include>


<script type="text/javascript">
   
    onload = function() {
        var slideIndex = 0;
        showSlides();

        function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) {
                slideIndex = 1
            }
            slides[slideIndex - 1].style.display = "block";
            setTimeout(showSlides, 1500); // Change image every 2 seconds
        }
        
        
       var isLogin = "${isLogin}";
       if (isLogin == "yes") {
           var loginResult = "${loginResult}";
           if (loginResult == 0) {
               swal({
                   title: "로그인 실패",
                   text: "아이디 또는 비밀번호가 일치하지 않습니다.",
                   type: "error"
               }).then(function() {
                   location.href = "loginPage";
               });
           } else {
               swal("로그인 성공", "환영합니다 ${loginDto.userName}님!", "success");
           }
       }
       
       // 탈퇴 계정 접근 불가
       var isLog = "${loginDto.userName }"
        if (isLog == "탈퇴 계정") {
           swal({
                 title: "로그인 실패",
                 text: "탈퇴된 계정입니다.",
                 type: "error"
             }).then(function() { location.href = "sessionClear"; });
        
          
        
        

        // 예약 관리 성공 실패
        var isCalendarAdd = "${isCalendarAdd}";
        var isCalendarRemove = "${isCalendarRemove}";

        if (isCalendarAdd == "yes") {
            var addResult = "${addResult}";
            if (addResult == 0) {
                swal("예약 테이블 추가 실패", "다시 시도해주세요.", "error");
            } else {
                swal("예약 테이블 추가 성공", "성공적으로 달력이 업데이트 되었습니다!", "success");
            }
        }
        if (isCalendarRemove == "yes") {
            var delResult = "${delResult}";
            if (delResult == 0) {
                swal("예약 테이블 삭제 실패", "삭제할 데이터가 존재하지 않습니다.", "error");
            } else {
                swal("예약 테이블 삭제 성공", "성공적으로 달력이 업데이트 되었습니다!", "success");
            }
        }
        
       }
    }
   
</script>

<div class="slideshow-container">
    <div class="mySlides fade">
        <div class="numbertext">
            <h1><label>홈페이지에 오신걸 환영합니다. 메뉴를 선택하세요.</label></h1>
        </div>
        <img src="${pageContext.request.contextPath}/resources/back/back.jpg" style="width:100%; height: 100%;">
        <div class="text"></div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext">
            <h1><label>홈페이지에 오신걸 환영합니다. 메뉴를 선택하세요.</label></h1>
        </div>
        <img src="${pageContext.request.contextPath}/resources/back/back2.jpg" style="width:100%; height: 100%;">
        <div class="text"></div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext">
            <h1><label>홈페이지에 오신걸 환영합니다. 메뉴를 선택하세요.</label></h1>
        </div>
        <img src="${pageContext.request.contextPath}/resources/back/back3.jpg" style="width:100%; height: 100%;">
        <div class="text"></div>
    </div>

    <div class="mySlides fade">
        <div class="numbertext">
            <h1><label>홈페이지에 오신걸 환영합니다. 메뉴를 선택하세요.</label></h1>
        </div>
        <img src="${pageContext.request.contextPath}/resources/back/back4.jpg" style="width:100%; height: 100%;">
        <div class="text"></div>
    </div>

</div>



<%@ include file="layout/footer.jsp" %>
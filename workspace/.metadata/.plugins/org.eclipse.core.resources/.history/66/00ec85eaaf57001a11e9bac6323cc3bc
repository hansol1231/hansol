<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
   request.setCharacterEncoding("utf-8");
   String authKey = request.getParameter("authKey");
   request.setAttribute("authKey", authKey);
%>
<jsp:include page="../layout/header.jsp">
    <jsp:param value="예약 페이지" name="title" />
</jsp:include>

<script type="text/javascript">

   var check = 0;

    // 이메일 인증번호 전송
    function mail( f ) {
        var userEmail = "${sessionScope.loginDto.userEmail}";
        var userEmail_ = f.userEmail_.value;
        var authKey = "${authKey}";

        if (userEmail == userEmail_) {
           swal("인증키 발송 성공!", "${loginDto.userName}님의 메일로 인증키가 발송되었습니다.", "success");
            f.action = "sendMail";
            f.submit();
        } else {
            swal("이메일을 다시 입력하세요.", "입력한 이메일과 회원님의 이메일이 다릅니다.", "error");
            //alert("이메일을 다시 입력하세요.");
            f.focus().userEmail;
            return false;
        }
   }
    
    function auth( f ) {
       var originAuthKey = "${authKey}";
       if( f.authKey.value == "" ) {
          swal("인증키를 입력하세요", "", "error");
          f.authKey.focus();
          return;
       } else if( originAuthKey != f.authKey.value ) {
          swal("잘못된 인증키입니다.", "", "error");
          return;
       } else if( originAuthKey == f.authKey.value ) {
          swal("인증 성공!", "", "success");
          check = 1;
       }
    }
    
    // 예약 진행
    function reserve(f) {
        if( check == 0 ) {
           swal("이메일 인증을 먼저 진행하세요!", "", "error");
        } else {
           f.action = "reserve";
           f.submit();
        }
    }
    
    onload = function() {
      
      
      var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
      $("#userEmail_").keyup(function() {
          $.ajax({
              url: "emailCheck",
              type: "POST",
              dataType: "json",
              data: "userEmail=" + $("#userEmail_").val(),
              success: function(data) {
                  var obj = data;
                  
                  if (regExpEmail.test($("#userEmail_").val())) {
                      if (obj.emailCheckResult == "1" && $("#userEmail_").val() == "${sessionScope.loginDto.userEmail}") {
                          $("#emailCheckResult").text("사용자의 이메일이 맞습니다.");
                          $("#emailCheckResult").css("color", "blue");
                      } else {
                          $("#emailCheckResult").text("사용자의 이메일이 아닙니다.");
                          $("#emailCheckResult").css("color", "red");
                          check3 = 1;
                      }
                  } else {
                      $("#emailCheckResult").text("유효하지 않은 이메일형식 입니다");
                      $("#emailCheckResult").css("color", "red");
                  }
              }, // end success
              error: function() {
                  alert("실패");
              }
          });
      });
      
   }

</script>
<div class="reserve_t">
    <h1>예약 페이지</h1>
    <form method="post">
        <table class="table table-striped">
            <tbody>
                <tr>
                    <td>예약 일자</td>
                    <td>${iDto.iMonth }월 ${iDto.iDay }일
                        <input type="hidden" name="iMonth" value="${iDto.iMonth }">
                        <input type="hidden" name="iDay" value="${iDto.iDay }">
                    </td>
                </tr>
                <tr>
                    <td>예약자 아이디</td>
                    <td>${sessionScope.loginDto.userId }
                        <input type="hidden" name="userId" value="${sessionScope.loginDto.userId }">
                    </td>
                </tr>
                <tr>
                    <td>예약자</td>
                    <td>${sessionScope.loginDto.userName }
                        <input type="hidden" name="userName" value="${sessionScope.loginDto.userName }">
                    </td>
                </tr>
                <tr>
                    <td>예약 시간</td>
                    <td>
                        <c:choose>
                            <c:when test="${iDto.iTime eq 1 }">
                                12:00 ~ 14:00
                            </c:when>
                            <c:when test="${iDto.iTime eq 2 }">
                                14:00 ~ 16:00
                            </c:when>
                            <c:otherwise>
                                16:00 ~ 18:00
                            </c:otherwise>
                        </c:choose>
                        <input type="hidden" name="iTime" value="${iDto.iTime }">
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                       <input type="text" name="userEmail_" id="userEmail_">
                       <input type="button" value="인증키 전송" onclick="mail(this.form)" style="width: 120px;">
                    </td>
                </tr>
                <tr>
                   <td colspan="2">
                      <span id="emailCheckResult"></span>
                   </td>
                </tr>
                <tr>
                       <td>인증키</td>
                       <td>
                          <input type="text" name="authKey" id="authKey" value="${authKey}" readonly="readonly">
                          <input type="button" value="인증" onclick="auth(this.form)" style="width: 120px;">
                       </td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2">
                        <input type="button" class="btn btn-primary" value="예약하기" onclick="reserve(this.form)">&nbsp;&nbsp;
                        <input type="button" class="btn btn-default" value="돌아가기" onclick="location.href='goCalendar'">
                    </td>
                </tr>
            </tfoot>
        </table>
    </form>
</div>

<%@ include file="../layout/footer.jsp" %>
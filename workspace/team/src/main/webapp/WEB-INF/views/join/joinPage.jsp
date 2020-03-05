<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="회원가입 페이지" name="title" />
</jsp:include>

<style type="text/css">
    

</style>

<script type="text/javascript">
    $(function() {

        // 유효성 체크 (아이디, 주민번호, 이메일, 전화번호)
        var regExpId = /^[a-z]+[0-9a-z]{3,20}$/;
        var regExpSN = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
        var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        var regExpTel = /^01(?:[0|1|6|7|8|9])-\d{3,4}-\d{4}$/;
        var isRobot = "";
      
        var check1 = 0;   // 아이디 테스트
	    var check2 = 0;   // 주민등록번호 테스트
	    var check3 = 0;   // 이메일 테스트
	    var check4 = 0;   // 전화번호 테스트
	    var check5 = 0;   // 비밀번호 테스트
        
        $("#userId").keyup(function() {

            $.ajax({
                url: "idCheck",
                type: "POST",
                dataType: "json",
                data: "userId=" + $("#userId").val(),
                success: function(data) {

                    var obj = data;

                    if (regExpId.test($("#userId").val())) {
                        if (obj.idCheckResult == "1") {
                            $("#idCheckResult").text("이미 사용 중인 아이디입니다.");
                            $("#idCheckResult").css("color", "red");
                        } else {
                            $("#idCheckResult").text("이 아이디는 사용할 수 있습니다.");
                            $("#idCheckResult").css("color", "blue");
                            check1 = 1;
                        }
                    } else {
                        $("#idCheckResult").text("4~20자, 소문자 시작, 소문자+숫자");
                        $("#idCheckResult").css("color", "red");
                    }
                }, // end success
                error: function() {
                    alert("실패");
                }
            }); // end ajax
        }); // end keyup (end 아이디 중복체크)

        // 주민등록번호 검사
        $("#userSN").keyup(function() {
            $.ajax({
                url: "snCheck",
                type: "POST",
                dataType: "json",
                data: "userSN=" + $("#userSN").val(),
                success: function(data) {
                    var obj = data;

                    if (regExpSN.test($("#userSN").val())) {
                        if (obj.SNCheckResult == "1") {
                            $("#SNCheckResult").text("이미 가입된 주민등록번호입니다.");
                            $("#SNCheckResult").css("color", "red");
                        } else {
                            $("#SNCheckResult").text("사용할 수 있는 주민등록번호입니다.");
                            $("#SNCheckResult").css("color", "blue");
                            check2 = 1;
                        }
                    } else {
                        $("#SNCheckResult").text("유효하지 않은 형식입니다.");
                        $("#SNCheckResult").css("color", "red");
                    }
                }, // end success
                error: function() {
                    alert("실패");
                }
            });
        });

        // 이메일 검사
        $("#userEmail").keyup(function() {
            $.ajax({
                url: "emailCheck",
                type: "POST",
                dataType: "json",
                data: "userEmail=" + $("#userEmail").val(),
                success: function(data) {
                    var obj = data;

                    if (regExpEmail.test($("#userEmail").val())) {
                        if (obj.emailCheckResult == "1") {
                            $("#emailCheckResult").text("이미 가입된 이메일입니다.");
                            $("#emailCheckResult").css("color", "red");
                        } else {
                            $("#emailCheckResult").text("사용할 수 있는 이메일입니다.");
                            $("#emailCheckResult").css("color", "blue");
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
        // 휴대폰번호 검사
        $("#userTel").keyup(function() {
            $.ajax({
                url: "telCheck",
                type: "POST",
                dataType: "json",
                data: "userTel=" + $("#userTel").val(),
                success: function(data) {
                    var obj = data;

                    if (regExpTel.test($("#userTel").val())) {
                        if (obj.telCheckResult == "1") {
                            $("#telCheckResult").text("이미 가입된 휴대폰번호 입니다.");
                            $("#telCheckResult").css("color", "red");
                        } else {
                            $("#telCheckResult").text("사용할 수 있는 휴대폰번호 입니다.");
                            $("#telCheckResult").css("color", "blue");
                            check4 = 1;
                        }
                    } else {
                        $("#telCheckResult").text("유효하지 않은 형식입니다('-' 포함)");
                        $("#telCheckResult").css("color", "red");
                    }
                }, // end success
                error: function() {
                    alert("실패");
                }
            });
        });

        // 비밀번호 검사
        $("#userPw2").keyup(function() {
            if ($("#userPw").val() != $("#userPw2").val()) {
                $("#pwCheckResult").text("비밀번호를 확인해주세요.");
                $("#pwCheckResult").css("color", "red");
            } else {
                $("#pwCheckResult").text("비밀번호가 일치합니다.");
                $("#pwCheckResult").css("color", "blue");
                check5 = 1;
            }
        });

        // 회원 가입
        $("#joinBtn").click(function() {
            if ($("#userId").val() == "" || check1 == 0) {
                swal("아이디를 확인하세요!", "", "error");
                return;
            }
            if ($("#userPw").val() == "" || check5 == 0) {
                swal("비밀번호를 확인하세요!", "", "error");
                return;
            }
            if ($("#userPw2").val() == "" || check5 == 0) {
                swal("비밀번호를 확인하세요!", "", "error");
                return;
            }
            if ($("#userName").val() == "") {
                swal("성명를 입력하세요!", "", "error");
                return;
            }
            if ($("#userSn").val() == "" || check2 == 0) {
                swal("주민등록번호를 확인하세요!", "", "error");
                return;
            }
            if ($("#userAddr").val() == "") {
                swal("주소를 입력하세요!", "", "error");
                return;
            }
            if ($("#userEmail").val() == "" || check3 == 0) {
                swal("이메일을 확인하세요!", "", "error");
                return;
            }
            if ($("#userTel").val() == "" || check4 == 0) {
                swal("연락처를 확인하세요!", "", "error");
                return;
            }
            if (isRobot == "yes" || isRobot == "") {
                swal("자동가입 방지과정을 진행하세요!", "", "error");
                return;
            }
            $.ajax({
                url: "join",
                type: "POST",
                dataType: "json",
                data: $("#f").serialize(),
                success: function(data) {
                    var obj = data;
                    if (obj.joinResult == "1") {
                        swal({
                            title: "가입에 성공했습니다. 로그인 페이지로 이동합니다.",
                            text: "",
                            type: "success"
                        }).then(function() {
                            location.href = "loginPage";
                        });
                        //alert("가입에 성공했습니다. 로그인 페이지로 이동합니다.")
                    } else {
                        alert("가입에 실패했습니다.");
                    }
                }, // end success
                error: function() {
                    alert("가입 실패");
                }
            }); // end ajax
        }); // end click (end 회원 가입)

        // 입력 취소
        $("#cleanBtn").click(function() {
            $("input[text], input[password]").each(function() {
                $(this).val("");
            });
            $("#idCheckResult").val("");
            $("#userId").focus();
        }); // end click (end 입력 취소)

        // 캡차 검사
        $("#checkImg").click(function() {
            $.ajax({
                url: "checkImg",
                type: "POST",
                data: "inputCaptcha=" + $("#inputCaptcha").val(),
                dataType: "json",
                success: function(data) {
                    var obj = data;
                    if (obj.captchaResult == true) {
                        swal("확인되었습니다.", "눈이 좋으시군요!", "success");
                        isRobot = "no";
                    } else {
                        swal("확인에 실패하였습니다.", "로봇이신가요..?? 새로고침 후 다시 시도하세요", "error");
                        isRobot = "yes";
                    }
                },
                error: function() {
                    //swal("오류발생!", "관리자에게 문의하세요", "info");
                    alert("실패");
                }
            });
        });

    }); // end 페이지로드

</script>


<div class="join_t">
   <div id="login-page" class="row">
        <div class="">
          <h2>회원가입</h2>
          <h4 class="center">가입 후 예약 및 여러 회원들과 소통해보세요!</h4>
          <hr/>
        </div>
     <form id="f" class="login-form" method="post" style="border-top: 1px solid #ccc;">
         <div class="form-group" style="text-align: left;">
             <label for="userId"><b>ID</b><span id="idCheckResult"></span></label>
             <input class="form-control" type="text" id="userId" name="userId" autocomplete="off"/>
         </div>
         
   
         <div class="form-group" style="text-align: left;">
             <label for="userPw"><b>Password</b></label>
             <input class="form-control" type="password" id="userPw" name="userPw"/>
         </div>
   
         <div class="form-group" style="text-align: left;">
             <label for="userPw2"><b>Password 확인</b><span id="pwCheckResult"></span></label>
             <input class="form-control" type="password" id="userPw2" name="userPw2"/>
         </div>
   
         <div class="form-group" style="text-align: left;">
             <label for="userName"><b>Name</b></label>
             <input class="form-control" type="text" id="userName" name="userName"/>
         </div>
         
         <div class="form-group" style="text-align: left;">
             <label for="userSN"><b>Serial Number (주민번호)</b><span id="SNCheckResult"></span></label>
             <input class="form-control" type="text" id="userSN" name="userSN"/>
         </div>
         
         <div class="form-group" style="text-align: left;">
             <label for="userAddr"><b>Address</b></label>
             <input class="form-control" type="text" id="userAddr" name="userAddr"/>
         </div>
         
         <div class="form-group" style="text-align: left;">
             <label for="userEmail"><b>E-Mail</b><span id="emailCheckResult"></span></label>
             <input class="form-control" type="text" id="userEmail" name="userEmail"/>
         </div>
         
         <div class="form-group" style="text-align: left;">
             <label for="userTel"><b>Tel.</b><span id="telCheckResult"></span></label>
             <input class="form-control" type="text" id="userTel" name="userTel"/>
         </div>
         
         <div class="form-group">
          <img src="${pageContext.request.contextPath}/resources/captcha/${tempname }" alt="캡차이미지" id="captchaImg" class="captchaImg">
          <br/>
          <div style="margin-top:15px;">
             <button type="button" style="padding: 35px 20px 0 20px;" class="btn btn-search btn-lg" onclick="location.href='joinPage'" >
              <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
            </button>
            <input class="form-control" type="text" name="inputCaptcha" id="inputCaptcha" required placeholder="문자 또는 숫자를 입력하세요." style="width: 310px; height:60px; margin:auto;">
            <input type="button" value="확인" id="checkImg" class="btn btn-primary" style="width: 100px; height: 60px;"/>
         </div>
        </div>
        
        <div style="margin-top: 10px;">
          <input type="button" value="회원가입" id="joinBtn" class="btn btn-success btn-lg" style="padding: 10px;"/>
          &nbsp;&nbsp;
          <input type="reset" value="입력취소" id="cleanBtn" class="btn btn-warning btn-lg" style="padding: 10px;"/>
         <br/><br/>
          <p>이미 가입하신 회원이십니까? <a href="loginPage">로그인하러 가기</a></p>
          </div>
   
       </form>
   </div>
</div>


<%@ include file="../layout/footer.jsp" %>
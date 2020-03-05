<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="로그인페이지" name="title" />
</jsp:include>

<script type="text/javascript">
    window.onload = function() {
        var isModify = "${isModify}";
        var isLeave = "${isLeave}";
        var isChangePw = "${isChangePw}";

        if (isModify == "yes") {
            var modifyResult = "${modifyResult}";
            if (modifyResult == 0) {
                swal("회원정보 수정 실패", "관리자에게 문의바랍니다.", "error");
            } else {
                swal("회원정보 수정 성공", "다시 로그인 하세요!", "success");
            }
        }
        if (isLeave == "yes") {
            var leaveResult = "${leaveResult}";
            if (leaveResult == 0) {
                swal("회원 탈퇴 실패", "관리자에게 문의바랍니다.", "error");
            } else {
                swal("회원 탈퇴 성공", "이용해주셔서 감사합니다!", "success");
            }
        }
        if (isChangePw == "yes") {
        	var changePwResult = "${changePwResult}";
        	if(changePwResult == 0) {
        		swal("비밀번호 수정 실패", "관리자에게 문의바랍니다.", "error");
        	} else {
        		swal("비밀번호 수정 성공", "다시 로그인 하세요!", "success");
        	}
        }
    }

    // 1. 로그인
    function login(f) {
        if (f.userId.value == "") {
            alert("아이디를 입력하세요.");
            f.userId.focus();
            return;
        }
        if (f.userPw.value == "") {
            alert("패스워드를 입력하세요.");
            f.userPw.focus();
            return;
        }
        f.action = "login";
        f.submit();
    }

    // 2. 아이디 기억하기
    // 페이지 로드 이벤트
    $(function() {
        // 1. 아이디 기억하기
        var saveId = getCookie("saveId"); // 저장된 쿠키값(saveId)을 가져와서 userId 입력상자를 채워 넣음
        $("#userId").val(saveId);

        if ($("#userId").val() != "") { // userId 입력상자가 이미 입력된 상태라면 예전에 '아이디 기억하기'를 체크한 상황
            $("#saveIdCheck").attr("checked", true); // 계속 '아이디 기억하기'를 체크 상태로 두기
        }
        $("#saveIdCheck").change(function() { // '아이디 기억하기' 상태값에 변화가 생기면
            if ($("#saveIdCheck").is(":checked")) { // 1) 체크한 경우
                setCookie("saveId", $("#userId").val(), 7); // 7일간 쿠키에 보관하는 setCookie() 함수 호출
            } else { // 2) 체크 해제한 경우
                deleteCookie("saveId"); // 쿠키를 삭제하는 deleteCookie() 함수 호출 
            }
        });
        $("#userId").keyup(function() { // userId 값을 입력할 때
            if ($("#saveIdCheck").is(":checked")) { // '아이디 기억하기'를 체크했다면
                setCookie("saveId", $("#userId").val(), 7); // 7일간 쿠키에 보관하는 setCookie 호출
            }
        });
    });
    // 1. 쿠키 만들기
    function setCookie(cookieName, value, exdays) {
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }
    // 2. 쿠키 삭제
    function deleteCookie(cookieName) {
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }
    // 3. 쿠키 가져오기
    function getCookie(cookieName) {
        cookieName = cookieName + "=";
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = "";
        if (start != -1) {
            start += cookieName.length;
            var end = cookieData.indexOf(";", start);
            if (end == -1) {
                end = cookieData.length;
            }
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }

</script>

<div class="login_t">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Welcome!</div>
            </div>
            <div class="panel-body">
                <form id="login-form">
                    <div>
                        <input type="text" class="form-control" style="text-align: center; width: 100%;" name="userId" id="userId" placeholder="아이디" autofocus>
                    </div>
                    <div>
                        <input type="password" class="form-control" style="text-align: center; width: 100%;" name="userPw" id="userPw" placeholder="패스워드">
                    </div>
                    <div class="checkbox">
						&nbsp;&nbsp;<input type="checkbox" name="saveIdCheck" id="saveIdCheck" value="true" checked />아이디 기억하기
						&nbsp;&nbsp;<input type="button" value="로그인" onclick="login(this.form)" class="btn btn-default"/>
					</div>
                    <div class="form-group">
						<a href="searchIdPage" style="text-decoration: none;">아이디 찾기</a>
						&nbsp;&nbsp;
						<a href="searchPwPage" style="text-decoration: none;">패스워드 찾기</a>
					</div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>

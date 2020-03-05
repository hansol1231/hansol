<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="마이페이지" name="title" />
</jsp:include>

<script type="text/javascript">
    $(function() {

        // 유효성 체크 (아이디, 주민번호, 이메일, 전화번호)
        var regExpId = /^[a-z]+[0-9a-z]{3,20}$/;
        var regExpSN = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
        var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        var regExpTel = /^01(?:[0|1|6|7|8|9])-\d{3,4}-\d{4}$/;

        var check1 = 0;   // 아이디 테스트
        var check3 = 0;   // 이메일 테스트
        var check4 = 0;   // 전화번호 테스트
        var check5 = 0;   // 비밀번호 테스트
        
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

        // 회원 정보 수정
        $("#changeInfoBtn").click(function() {
            if ($("#userName").val() == "") {
                swal("성명를 입력하세요!", "", "error");
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
            
            f.action = "infoModify";
            f.submit();
        	
        });

    }); // end 페이지로드

</script>

<div class="join_t">
    <h1>회원 정보</h1>
    <form method="post" id="f">
        <table class="table table-striped">
            <tbody>
                <tr>
                    <td>아이디</td>
                    <td style="height: 80px;">
                        ${loginDto.userId }
                        <input type="hidden" name="userIdx" id="userIdx" value="${loginDto.userIdx }" /><br>
                    </td>
                </tr>
                <tr>
                    <td>성명</td>
                    <td style="height: 80px;"><input type="text" name="userName" id="userName" placeholder="${loginDto.userName }" /><br></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td style="height: 80px;">
                   		<input type="text" name="userAddr" id="userAddr" placeholder="${loginDto.userAddr }" /><br>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td style="height: 80px;">
                    	<input type="text" name="userEmail" id="userEmail" placeholder="${loginDto.userEmail }" /><br>
                    	<span id="emailCheckResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td style="height: 80px;">
                    	<input type="text" name="userTel" id="userTel" placeholder="${loginDto.userTel }" /><br>
                    	<span id="telCheckResult"></span>
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2">
                        <input type="button" class="btn btn-primary" value="회원정보수정" id="changeInfoBtn"/>
                        <input type="button" class="btn btn-info" value="비밀번호수정" onclick="location.href='changePwPage?userId=${loginDto.userId}'" />
                        <input type="button" class="btn btn-danger" value="회원탈퇴하기" onclick="location.href='leavePage'" />
                    </td>
                </tr>
            </tfoot>
        </table>
    </form>
</div>

<%@ include file="../layout/footer.jsp" %>

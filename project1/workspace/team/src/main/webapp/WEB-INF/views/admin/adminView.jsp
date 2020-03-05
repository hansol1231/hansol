<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="회원상세 페이지" name="title" />
</jsp:include>

<script type="text/javascript">
    $(function() {

        // 유효성 체크 (아이디, 주민번호, 이메일, 전화번호)
        var regExpId = /^[a-z]+[0-9a-z]{3,20}$/;
        var regExpSN = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
        var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        var regExpTel = /^01(?:[0|1|6|7|8|9])-\d{3,4}-\d{4}$/;
        
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

        // 회원 가입
        $("#memberChangeInfoBtn").click(function() {
            if ($("#userPw").val() == "") {
                swal("비밀번호를 확인하세요!", "", "error");
                return;
            }
            if ($("#userName").val() == "") {
                swal("성명를 입력하세요!", "", "error");
                return;
            }
            if ($("#userSn").val() == "") {
                swal("주민등록번호를 확인하세요!", "", "error");
                return;
            }
            if ($("#userAddr").val() == "") {
                swal("주소를 입력하세요!", "", "error");
                return;
            }
            if ($("#userEmail").val() == "") {
                swal("이메일을 확인하세요!", "", "error");
                return;
            }
            if ($("#userTel").val() == "") {
                swal("연락처를 확인하세요!", "", "error");
                return;
            }

         f.action = "adminModify";
         f.submit();
            
        }); // end click (end 회원 가입)

        // 입력 취소
        $("#cleanBtn").click(function() {
            $("input[text], input[password]").each(function() {
                $(this).val("");
            });
            $("#idCheckResult").val("");
            $("#userId").focus();
        }); // end click (end 입력 취소)

    }); // end 페이지로드

</script>

<div class="admin_t">
    <h1>회원 상세보기</h1>
    <form method="POST" id="f">
        <table>
            <tbody>
                <tr>
                    <td>번호</td>
                    <td>
                        ${mDto.userIdx }
                        <input type="hidden" name="userIdx" value="${mDto.userIdx }" />
                    </td>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td>
                       <input type="text" id="userId" name="userId" value="${mDto.userId}" readonly="readonly"/>
                       <span id="idCheckResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td>
                       <input type="text" id="userPw" name="userPw" value="${mDto.userPw}" />
                    </td>
                </tr>
                <tr>
                    <td>성명</td>
                    <td><input type="text" id="userName" name="userName" value="${mDto.userName}" /></td>
                </tr>
                <tr>
                    <td>주민번호</td>
                    <td>
                       <input type="text" id="userSN" name="userSN" value="${mDto.userSN}" />
                       <span id="SNCheckResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                       <input type="text" id="userAddr" name="userAddr" value="${mDto.userAddr}" />
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                       <input type="text" id="userEmail" name="userEmail" value="${mDto.userEmail}" />
                       <span id="emailCheckResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>연락처</td>
                    <td>
                       <input type="text" id="userTel" name="userTel" value="${mDto.userTel}" />
                       <span id="telCheckResult"></span>
                    </td>
                <tr>
                    <td colspan="2">
                        <input type="button" class="btn" value="수정하기" id="memberChangeInfoBtn" />
                        <input type="button" class="btn" value="전체목록으로" onclick="location.href='adminList'" />
                    </td>
                </tr>    
                
            </tbody>
        </table>
        <br><br>
        <h1 id="marker">예약 현황</h1>
        <table>
           <tbody>
                <c:choose>
                    <c:when test="${empty iList }">
                        <tr>
                            <td colspan="2">
                                   예약 정보가 없습니다.
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="iDto" items="${iList }">
                            <tr>
                                <td>
                                    ${iDto.iMonth }월
                                    ${iDto.iDay }일
                                    <c:if test="${iDto.iTime eq 1 }">
                                        12:00 ~ 14:00
                                    </c:if>
                                    <c:if test="${iDto.iTime eq 2 }">
                                        14:00 ~ 16:00
                                    </c:if>
                                    <c:if test="${iDto.iTime eq 3 }">
                                        16:00 ~ 18:00
                                    </c:if>
                                </td>
                                <td>
                                    <input type="button" class="btn btn-danger btn-sm" value="예약 취소" onclick="location.href='cancel?iMonth=${iDto.iMonth}&iDay=${iDto.iDay}&iTime=${iDto.iTime}'">
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
           </tbody>
           <tfoot>
           <tr>
              <td colspan="2">${pagingView }</td>
           </tr>
           </tfoot>
        </table>
    </form>
</div>

<%@ include file="../layout/footer.jsp" %>
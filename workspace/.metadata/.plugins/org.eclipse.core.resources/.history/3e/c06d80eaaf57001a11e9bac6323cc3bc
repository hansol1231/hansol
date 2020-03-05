<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="비밀번호 변경 페이지" name="title" />
</jsp:include>

<script type="text/javascript">
    function startChangePw(f) {
        var userPw = f.userPw.value; // 유저 정보에 저장된 현재 비밀번호
        var userPw_ = f.userPw_.value; // 유저가 입력한 현재 비밀번호
        var userModPw = f.userModPw.value; // 변경할 비밀번호
        var userModPw_ = f.userModPw_.value; // 변경할 비밀번호 확인용

        if (userPw_ == "") {
            swal("", "현재 비밀번호를 입력하세요", "warning");
            f.userPw_.focus();
            return;
        }
        if (userModPw == "" || userModPw_ == "") {
            swal("", "수정하실 비밀번호와 비밀번호 확인을 입력하세요.", "warning");
            f.userModPw.focus();
            return;
        }
        if (userModPw != userModPw_) {
            swal("", "수정하실 비밀번호가 일치하지 않습니다.", "error");
            f.userModPw.focus();
            return;
        }
        if (userPw != userPw_) {
            swal("", "비밀번호를 잘못 입력하셨습니다.", "error");
            f.userPw_.focus();
            return;
        }
        f.action = "changePw";
        f.submit();
    }

</script>

<div class="login_t">
    <h1>비밀번호 변경</h1>
    <br /><br />
    <c:choose>
        <c:when test="${sessionScope.loginSubDto ne null }">
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-sm-5">아이디</label>
                    <div class="col-sm-3">
                        ${sessionScope.loginSubDto.userId }
                        <input type="hidden" name="userIdx" id="userIdx" value="${loginSubDto.userIdx }" />
                        <input type="hidden" name="userPw" id="userPw" value="${loginSubDto.userPw }" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-5">현재 비밀번호</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" value="변경할 비밀번호 입력" readonly="readonly" />
                        <input type="hidden" name="userPw_" id="userPw_" value="${loginSubDto.userPw }" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-5">변경 비밀번호</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control" name="userModPw" id="userModPw" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-5">변경 비밀번호 확인</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control" name="userModPw_" id="userModPw_" />
                    </div>
                </div>
                <div>
                    <br />
                    <div class="form-group">
                        <input type="button" value="비밀번호수정" class="btn btn-primary" onclick="startChangePw(this.form)" />
                        <input type="button" value="돌아가기" class="btn btn-default" onclick="history.back()" />
                    </div>
                </div>
            </form>
        </c:when>
        <c:otherwise>
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-sm-5">아이디</label>
                    <div class="col-sm-3">
                        ${sessionScope.loginDto.userId }
                        <input type="hidden" name="userIdx" id="userIdx" value="${loginDto.userIdx }" />
                        <input type="hidden" name="userPw" id="userPw" value="${loginDto.userPw }" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-5">현재 비밀번호</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" name="userPw_" id="userPw_" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-5">변경 비밀번호</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control" name="userModPw" id="userModPw" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-5">변경 비밀번호 확인</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control" name="userModPw_" id="userModPw_" />
                    </div>
                </div>
                <div>
                    <br />
                    <div class="form-group">
                        <input type="button" value="비밀번호수정" class="btn btn-primary" onclick="startChangePw(this.form)" />
                        <input type="button" value="돌아가기" class="btn btn-default" onclick="history.back()" />
                    </div>
                </div>
            </form>
        </c:otherwise>
    </c:choose>
</div>

<%@ include file="../layout/footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="패스워드찾기 페이지" name="title" />
</jsp:include>

<script type="text/javascript">
    $(function() {
        $("#searchPwBtn").click(function() {
            if ($("#userId").val() == "") {
                alert("아이디를 입력하세요");
                $("#userId").focus();
                return false;
            }
            if ($("#userTel").val() == "") {
                alert("전화번호를 입력하세요");
                $("#userTel").focus();
                return false;
            }
            $.ajax({
                url: "searchPw",
                type: "POST",
                dataType: "json",
                data: "userId=" + $("#userId").val() + "&userTel=" + $("#userTel").val(),
                success: function(data) {
                    var obj = data;
                    if (obj.searchPwResult != "fail") {
                        swal({
                            title: "비밀번호 찾기 성공!",
                            text: "비밀번호를 변경해주세요",
                            type: "error"
                        }).then(function() {
                            f.action = "changePwPage";
                            f.submit();
                        });
                    } else {
                        $("#searchPwResult").text("회원님의 정보가 없습니다.");
                        $("#searchPwResult").css("color", "red").css("font-weight", "bold");
                    }
                }, // end success
                error: function() {
                    alert("실패");
                }
            }); // end ajax
        }); // end click
    }); // end 페이지로드

</script>

<div class="login_t">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <div class="panel-title">비밀번호 찾기</div>
            </div>
            <div class="panel-body">
                <form method="post" name="f">
                    <div>
                        <input type="text" class="form-control" style="text-align: center; width: 100%; margin-bottom: 15px;" name="userId" size="30" id="userId" placeholder="아이디 입력" />
                    </div>
                    <div>
                        <input type="text" class="form-control" style="text-align: center; width: 100%; margin-bottom: 15px;" name="userTel" size="30" id="userTel" placeholder="전화번호 입력" />
                    </div>

                    <div>
                        <div class="form-group">
                            <input type="button" class="btn btn-success" value="비밀번호 찾기" id="searchPwBtn" />
                            &nbsp;&nbsp;
                            <input type="button" class="btn btn-default" value="로그인하러 가기" onclick="location.href='loginPage'" />
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <br><br><br>


        <div id="searchPwResult"></div><!-- ajax 처리 결과가 나타난다. -->
    </div>
</div>


<%@ include file="../layout/footer.jsp" %>

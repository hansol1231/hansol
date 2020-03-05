<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="아이디찾기 페이지" name="title" />
</jsp:include>

<script type="text/javascript">
    // ajax 를 통한 아이디 찾기
    $(function() {
        $("#searchIdBtn").click(function() {
            if ($("#userName").val() == "") {
                alert("이름을 입력하세요");
                $("#userName").focus();
                return false;
            }
            if ($("#userEmail").val() == "") {
                alert("이메일을 입력하세요");
                $("#userEmail").focus();
                return false;
            }
            $.ajax({
                url: "searchId",
                type: "POST",
                dataType: "json",
                data: "userName=" + $("#userName").val() + "&userEmail=" + $("#userEmail").val(),
                success: function(data) {

                    var obj = data;

                    if (obj.searchIdResult != "fail") {
                        $("#searchIdResult").text("회원님의 아이디는 " + obj.searchIdResult + "입니다.");
                        $("#searchIdResult").css("color", "blue").css("font-weight", "bold");
                    } else {
                        $("#searchIdResult").text("회원님의 정보가 없습니다.");
                        $("#searchIdResult").css("color", "red").css("font-weight", "bold");
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
               <div class="panel-title">아이디 찾기</div>
           </div>
          <div class="panel-body">
             <form method="post">
                 <div>
                     <input type="text" class="form-control" style="text-align: center; width: 100%; margin-bottom: 15px;" name="userName" size="30" id="userName" placeholder="가입 당시 이름" />
                 </div>
                 <div>
                     <input type="text" class="form-control" style="text-align: center; width: 100%; margin-bottom: 15px;" name="userEmail" size="30" id="userEmail" placeholder="가입 당시 이메일"/>
                 </div>
             
                 <div>
                     <div class="form-group">
                         <input type="button" class="btn btn-success" value="아이디 찾기" id="searchIdBtn" />
                         &nbsp;&nbsp;
                         <input type="button" class="btn btn-default" value="로그인하러 가기" onclick="location.href='loginPage'" />
                     </div>
                 </div>
             </form>
          </div>
       </div>
   
       <br><br><br>
   
   
       <div id="searchIdResult"></div><!-- ajax 처리 결과가 나타난다. -->
   </div>
</div>

<%@ include file="../layout/footer.jsp" %>
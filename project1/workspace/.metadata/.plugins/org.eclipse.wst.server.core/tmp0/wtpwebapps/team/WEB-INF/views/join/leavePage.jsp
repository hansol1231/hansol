<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="회원탈퇴 페이지" name="title" />
</jsp:include>
<script type="text/javascript">
    function leave(f) {
        var loginPw = "${loginDto.userPw}";
        if (f.userPw.value != loginPw) {
            swal("비밀번호가 맞지 않습니다.", "", "error");
            f.userPw.focus();
            return;
        }
        swal({
  		  title: "회원 탈퇴를 진행하시겠습니까?",
  		  text: "탈퇴하신 아이디는 사용이 불가합니다.",
  		  icon: "warning",
  		  buttons: true,
  		  dangerMode: true,
  		}).then(function(willDelete){
	  		  if (willDelete) {
	  			f.action = "leave";
	  	        f.submit();
	  		  } else {
	  		    swal("취소되었습니다!");
	  		    return;
	  		  }
  		});
    }

</script>
<div class="login_t">
    <form method="post">
        <div>
        	<h1>회원 탈퇴</h1>
        	<h3>
	            아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width: 300px;" placeholder="${loginDto.userId }"><input type="hidden" name="userIdx" value="${loginDto.userIdx }"><br>
	        </h3>
	        <h3>
	        	탈퇴 확인 비밀번호 <input type="password" name="userPw" style="width: 300px">
            </h3>
        </div>
        <input type="button" value="회원탈퇴" onclick="leave(this.form)" />
    </form>
</div>


<%@ include file="../layout/footer.jsp" %>

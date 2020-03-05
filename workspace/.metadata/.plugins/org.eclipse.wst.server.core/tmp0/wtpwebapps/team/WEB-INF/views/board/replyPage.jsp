<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<jsp:include page="../layout/header.jsp">
    <jsp:param value="댓글 작성하기" name="title" />
</jsp:include>

<script type="text/javascript">
    function boardReply(f) {

        var bTitle = f.bTitle.value;
        var bContent = f.bContent.value;

        if (bTitle == "") {
            swal("제목은 필수 입력 사항입니다.", "", "error");
            f.bTitle.focus();
            return;
        }
        if (bContent == "") {
            swal("내용은 필수 입력 사항입니다.", "", "error");
            f.bContent.focus();
            return;
        }

        f.action = "reply";
        f.submit();
    }

</script>


<div class="board_t">
    <h1>댓글 작성하기</h1>
    <form method="post">
        <!-- submit 할 때 함께 전송되는 파라미터 -->
        <input type="hidden" id="bIdx" name="bIdx" value="${bIdx }" />
        <input type="hidden" id="userIdx" name="userIdx" value="${loginDto.userIdx }">
        <input type="hidden" id="currentPage" name="currentPage" value="${currentPage }">
        
        <div class="form-group">
        	<label for="bTitle">제목</label>
            <input type="text" class="form-control" id="bTitle" name="bTitle" placeholder="제목을 입력하세요.">
        </div>
        <div class="form-group">
            <label for="bWriter">작성자</label>
            <input type="text" class="form-control" id="bWriter" name="bWriter" value="${loginDto.userName }" readonly="readonly">
        </div>
        <div class="form-group">
            <label for="bContent">내용</label>
            <textarea class="form-control" id="bContent" name="bContent" rows="10" cols="70" placeholder="댓글을 작성하세요."></textarea>
        </div>
        
        <input type="button" class="btn btn-primary" value="댓글등록하기" onclick="boardReply(this.form)" />
        <input type="reset" class="btn btn-warning" value="다시작성" />
        <input type="button" class="btn btn-default" value="목록으로 이동" onclick="location.href='boardList'" />

    </form>
</div>

<%@ include file="../layout/footer.jsp" %>

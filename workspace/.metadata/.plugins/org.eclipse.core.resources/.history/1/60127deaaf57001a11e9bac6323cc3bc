<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String currentPage = request.getParameter("currentPage");
	pageContext.setAttribute("currentPage", currentPage);
%>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="게시글 작성하기" name="title" />
</jsp:include>

<script type="text/javascript">
    function boardWrite(f) {
        f.action = "write";
        f.submit();
    }

    function boardWrite(f) {
        var bTitle = f.bTitle.value;
        var bContent = f.bContent.value;
        var bType = f.bType.value;

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
        if (bType == 0) {
            swal("게시글 항목을 선택하세요.", "", "error");
            return;
        }

        f.action = "write";
        f.submit();
    }

</script>

<div class="board_t">
	<h1>게시글 작성</h1>
    <form action="write" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="bWriter" style="width: 100px;">작성자</label>
            <input type="text" class="form-control" id="bWriter" name="bWriter" value="${loginDto.userName }" readonly="readonly">
        </div>
        <div class="form-group">
            <label for="bTitle" style="width: 100px;">제목</label>
            <input type="text" class="form-control" id="bTitle" name="bTitle" placeholder="제목을 입력하세요.">
        </div>
        <div class="form-group">
        	<label for="bIsOpen">공개여부</label><br/>
        	<label class="radio-inline"><input type="radio" style="width: 50px;" name="bIsOpen" value="1" checked="checked" />&nbsp;&nbsp;&nbsp;공개</label>
            <label class="radio-inline"><input type="radio" style="width: 50px;" name="bIsOpen" value="0" />&nbsp;&nbsp;&nbsp;비공개</label>
        </div>
        <div class="form-group">
      		<label for="bImage">이미지첨부</label><br/>
        	<input type="file" name="bImage"/>
        </div>
        <div class="form-group">
        	<label for="bType">항목</label>
        	&nbsp;&nbsp;&nbsp;
        	<select name="bType" id="bType">
                <option value="0">::항목을 선택하세요::</option>
                <option value="1">Review</option>
                <option value="2">Q&A</option>
            </select>
        </div>
        <div class="form-group">
            <label for="bContent">내용</label>
            <textarea class="form-control" id="bContent" name="bContent" rows="10" cols="50"></textarea>
        </div>
        <input type="button" class="btn btn-primary" value="저장하기" onclick="boardWrite(this.form)" />
        <input type="hidden" id="userIdx" name="userIdx" value="${loginDto.userIdx }">
        <input type="button" class="btn btn-default" value="전체목록보기" onclick="location.href='boardList'" />
    </form>
</div>


<%-- <div class="board_t">
    <h1>게시글 작성</h1>
    <form action="write" method="post">
        <table>
            <tbody>
                <tr>
                    <td>작성자</td>
                    <td><input type="text" name="bWriter" value="${loginDto.userName }" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="bTitle" style="width: 420px;"/></td>
                </tr>
                <tr>
                    <td>공개여부</td>
                    <td>
                        <input type="radio" name="bIsOpen" value="1" checked="checked" />공개
                        <input type="radio" name="bIsOpen" value="0" />비공개
                    </td>
                </tr>
                <tr>
                    <td>항목</td>
                    <td>
                        <!-- 관리자 항목을 따로 추가할까? (공지사항 등) -->
                        <select name="bType">
                            <option value="0">::항목을 선택하세요::</option>
                            <option value="1">Review</option>
                            <option value="2">Q&A</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><textarea rows="10" cols="50" name="bContent"></textarea>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" value="저장하기" onclick="boardWrite(this.form)" />
                        <input type="hidden" name="userIdx" value="${loginDto.userIdx }">
                        <input type="button" value="전체목록보기" onclick="location.href='boardList'" />
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</div>
 --%>

<%@ include file="../layout/footer.jsp" %>

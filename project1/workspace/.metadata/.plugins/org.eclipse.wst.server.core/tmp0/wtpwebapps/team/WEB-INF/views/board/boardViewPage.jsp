<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<jsp:include page="../layout/header.jsp">
    <jsp:param value="게시글 보기" name="title" />
</jsp:include>


<script type="text/javascript">
    function remove() {
        var loginPw = "${loginDto.userPw}";
        var userPw = prompt("비밀번호를 입력하세요.");
        if (userPw == loginPw) {
            swal("게시글이 삭제됩니다.", "", "success");
            setTimeout(location.href = 'delete?bIdx=${bDto.bIdx }', 3000);
        } else {
            swal("비밀번호를 확인해주세요.", "", "error");
            return;
        }
    }

</script>

<div class="board_t">
   <form action="modify" method="post">
      <c:choose>
         <c:when test="${loginDto.userId eq 'admin' }">
            <div class="form-group" style="float: left; width: 55%">
               <label for="bTitle">제목</label><br>
               <input class="form-control" type="text" id="bTitle" name="bTitle" value="${bDto.bTitle }">
               <input type="hidden" name="bIdx" value="${bDto.bIdx }">
            </div>
            <c:if test="${bDto.bImage ne null and bDto.bImage ne '없음'}">
	                <div class="form-group" style="float: right; width: 45%;">
	                	<label for="bImage">사진 (사진을 클릭하면 확대해서 볼 수 있습니다)</label><br>
		               <img alt="${bDto.bImage }" src="${pageContext.request.contextPath }/resources/upload/${bDto.bImage }" style="width:100%;" onclick="window.open('${pageContext.request.contextPath }/resources/upload/${bDto.bImage }','asdfo8or','scrollbars=yes,width=800,height=600,top=100,left=200');" />
	            	</div>
                </c:if>
            <div class="form-group" style="float: left; width: 55%">
               <label for="bWriter">작성자</label><br>
               <b class="form-control" id="bWriter">${bDto.bWriter }</b>
            </div>
            <div class="form-group" style="float: left; width: 55%;">
               <label for="bDate">작성일</label><br>
               <b class="form-control" id="bDate">${bDto.bDate }</b>
            </div>
            <div class="form-group">
               <div style="width: 100px"><label for="bContent">내용</label></div><br>
               <textarea class="form-control" rows="10" cols="50" name="bContent">${bDto.bContent }</textarea>
            </div>
            <h4>공개여부</h4>
            <label class="radio-inline"><input type="radio" name="bIsOpen" value="1" checked="checked">공개</label>&nbsp;
            <label class="radio-inline"><input type="radio" name="bIsOpen" value="0">비공개</label>
         </c:when>
         <c:otherwise>
            <div class="form-group" style="float: left; width: 55%">
                <label for="bTitle">제목</label><br>
                <c:if test="${loginDto.userIdx eq bDto.userIdx }">
                    <input class="form-control" type="text" id="bTitle" name="bTitle" value="${bDto.bTitle }">
                </c:if>
                <c:if test="${loginDto.userIdx ne bDto.userIdx }">
                    <input class="form-control" type="text" id="bTitle" name="bTitle" value="${bDto.bTitle }" readonly="readonly">
                </c:if>
                </div>
                <c:if test="${bDto.bImage ne null and bDto.bImage ne '없음'}">
	                <div class="form-group" style="float: right; width: 45%;">
		               <label for="bImage">사진 (사진을 클릭하면 확대해서 볼 수 있습니다)</label><br>
		               <img alt="${bDto.bImage }" src="${pageContext.request.contextPath }/resources/upload/${bDto.bImage }" style="width:100%;" onclick="window.open('${pageContext.request.contextPath }/resources/upload/${bDto.bImage }','asdfo8or','scrollbars=yes,width=800,height=600,top=100,left=200');" />
	            	</div>
                </c:if>
                <div class="form-group" style="float: left; width: 55%">
                    <label for="bWriter">작성자</label><br>
                    <b class="form-control" id="bWriter">${bDto.bWriter }</b>
                </div>
                <div class="form-group" style="float: left; width: 55%">
                    <label for="bDate">작성일</label><br>
                    <b class="form-control" id="bDate" >${bDto.bDate }</b>
                </div>
                <div class="form-group" style="width: 100%">
                    <div style="width: 100px"><label for="bContent">내용</label></div><br>
                    <c:if test="${loginDto.userIdx eq bDto.userIdx }">
                        <textarea class="form-control" rows="10" cols="50" id="bContent" name="bContent">${bDto.bContent }</textarea>
                    </c:if>
                    <c:if test="${loginDto.userIdx ne bDto.userIdx }">
                        <textarea class="form-control" rows="10" cols="50" id="bContent" name="bContent" readonly="readonly">${bDto.bContent }</textarea>
                    </c:if>
                </div>
                	<h4>공개여부</h4>
                    <c:if test="${loginDto.userIdx eq bDto.userIdx }">
                        <c:if test="${bDto.bIsOpen eq '1' }">
                            <label id="radio-inline"><input type="radio" name="bIsOpen" value="1" checked="checked">공개</label>&nbsp;
                            <label id="radio-inline"><input type="radio" name="bIsOpen" value="0">비공개</label>
                        </c:if>
                        <c:if test="${bDto.bIsOpen eq '0' }">
                            <label id="radio-inline"><input type="radio" name="bIsOpen" value="1" checked="checked">공개</label>&nbsp;
                            <label id="radio-inline"><input type="radio" name="bIsOpen" value="0">비공개</label>
                        </c:if>
                    </c:if>
                    <c:if test="${loginDto.userIdx ne bDto.userIdx }">
                           수정권한이 없습니다.
                    </c:if>

            </c:otherwise>
      </c:choose>
      <input type="hidden" name="bIdx" value="${bDto.bIdx }">
      
      <!-- 로그인을 해야 수정,삭제를 할 수 있다. -->
      <div style="float: right;">
	      <c:if test="${loginDto.userIdx eq bDto.userIdx or loginDto.userId eq 'admin'}">
	         <input type="submit" class="btn btn-primary" value="수정하기" />
	      </c:if>
	      <input type="button" class="btn btn-default" value="목록으로 이동" onclick="location.href='boardList'" />
	      <c:if test="${loginDto ne null and loginDto.userId eq 'admin' or loginDto.userIdx eq bDto.userIdx}">
	         <input type="button" class="btn btn-danger" value="삭제" onclick="remove(this.form)" />
	      </c:if>
      </div>
   </form>
</div>

<%@ include file="../layout/footer.jsp" %>
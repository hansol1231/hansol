<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="게시판" name="title" />
</jsp:include>

<script src="https://kit.fontawesome.com/143c45d06e.js" crossorigin="anonymous"></script>

<script type="text/javascript">

    var isModify = "${isModify}";
    if (isModify == "yes") {
        var modifyResult = "${modifyResult}";
        if (modifyResult == 0) { swal("수정 실패.", "", "error");   }
        else                { swal("수정 성공.", "", "success"); }
    }
    var isWrite = "${isWrite}";
    if (isWrite == "yes") {
        var writeResult = "${writeResult}";
        if (writeResult == 0)  { swal("삭제 실패.", "", "error");   } 
        else                { swal("추가 성공.", "", "success"); }
    }
    var isDelete = "${isDelete}";
    if (isDelete == "yes") {
        var deleteResult = "${deleteResult}";
        if (deleteResult == 0) { swal("삭제 실패.", "", "success"); } 
        else                { swal("삭제 성공.", "", "success"); }
    }
    function watch(f) {
        var bType = f.bType.value;
        if (bType == "0")       { swal("항목을 선택하세요.", "Review 또는 Q&A 항목을 선택하세요", "error"); return; }
        f.action = "typeSearch";
        f.submit();
    }
    function searchAction(f) {
        var sel = f.sel.value;
        var search = f.search.value;
        if (sel == "0")       { swal("항목을 선택하세요.", "제목 또는 작성자 항목을 선택하세요", "error"); return; }
        if (search == "")       { swal("검색할 내용을 입력해주세요.", "", "error"); return; }
        f.action = "querySearch";
        f.submit();
    }
    function reLogin() {
      swal({
          title: "로그인을 먼저 해주세요!",
          text: "로그인 페이지로 이동합니다.",
          type: "error"
      }).then(function() {
          location.href = "loginPage";
      });
    }

</script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<div class="board_t">
    <h1>게시판</h1>
    <table class="table table-striped">
        <thead>
            <tr>
                <td colspan="7">
                    <form method="post" style="text-align: right;">
                        <select name="bType" style="height: 25px;">
                            <option value="0">::분류 선택::</option>
                            <option value="1">Review</option>
                            <option value="2">Q&A</option>
                        </select>
                        <input type="hidden" name="currentPage" value="${currentPage=1 }">
                        <input type="button" value="보기" class="btn btn-default btn-sm" onclick="watch(this.form)" style="margin-bottom: 5px;">
                    </form>
                </td>
            </tr>
            <tr>
                <th style="text-align: center;">번호</th>
                <th style="text-align: center;">항목</th>
                <th style="text-align: center;">제목</th>
                <th style="text-align: center;">작성자</th>
                <th style="text-align: center;">작성일</th>
                <th style="text-align: center;">조회수</th>
                <th style="text-align: center;">댓글작성</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${empty list }">
                    <tr><td colspan="7">작성된 글이 없습니다.</td></tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="bDto" items="${list }">
                        <c:choose>
                            <c:when test="${loginDto.userId eq 'admin' }">
                                <tr>
                                    <td>${bDto.bIdx }</td>
                                    <c:choose>
                                        <c:when test="${bDto.bType eq 1 }"><td>Review</td></c:when>
                                        <c:when test="${bDto.bType eq 2 }"><td>Q&A</td></c:when>
                                        <c:otherwise><td>-</td></c:otherwise>
                                    </c:choose>
                                    <td style="text-align: left;">
                                        <c:forEach begin="1" end="${bDto.bDepth }" step="1">&nbsp;&nbsp;</c:forEach>
                                        <c:if test="${bDto.bDepth ne 0 }"><i class="far fa-hand-point-right"></i></c:if>
                                        <c:if test="${bDto.bDelete eq 0}">삭제된 글입니다.</c:if>
                                        <c:if test="${bDto.bDelete eq 1 }"><a href="boardView?bIdx=${bDto.bIdx}">${bDto.bTitle }</a></c:if>
                                    </td>
                                    <td>${bDto.bWriter }</td>
                                    <td>${bDto.bDate }</td>
                                    <td>
                                       <c:choose>
                                          <c:when test="${bDto.bStep eq '0' }">
                                             ${bDto.bHit }
                                          </c:when> 
                                          <c:otherwise />
                                       </c:choose>
                                    </td>
                                    <td>
                                       <button class="btn btn-default btn-xs" value="댓글쓰기" onclick="location.href='replyPage?bIdx=${bDto.bIdx }'">
                                              <i class='fas fa-comment' style='font-size:20px'></i>
                                         </button>
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td>${bDto.bIdx }</td>
                                    <c:choose>
                                        <c:when test="${bDto.bType eq 1 }"><td>Review</td></c:when>
                                        <c:when test="${bDto.bType eq 2 }"><td>Q&A</td></c:when>
                                        <c:otherwise><td>-</td></c:otherwise>
                                    </c:choose>
                                    <c:if test="${bDto.bIsOpen eq '1' }">
                                        <td style="text-align: left;">
                                            <c:forEach begin="1" end="${bDto.bDepth }" step="1">&nbsp;&nbsp;</c:forEach>
                                            <c:if test="${bDto.bDepth ne 0 }"><i class="far fa-hand-point-right"></i></c:if>
                                            <c:if test="${bDto.bDelete eq 0}">삭제된 글입니다.</c:if>
                                            <c:if test="${bDto.bDelete eq 1 }"><a href="boardView?bIdx=${bDto.bIdx}">${bDto.bTitle }</a></c:if>
                                        </td>
                                    </c:if>
                                    <c:if test="${bDto.bIsOpen eq '0' }">
                                       <td style="text-align: left;">
                                           <c:forEach begin="1" end="${bDto.bDepth }" step="1">&nbsp;&nbsp;</c:forEach>
                                           <c:if test="${bDto.bDepth ne 0 }"><i class="far fa-hand-point-right"></i></c:if>
                                           <c:if test="${bDto.bDelete eq 0 }">삭제된 글입니다.</c:if>
                                           <c:if test="${loginDto.userIdx ne bDto.userIdx and bDto.bDelete ne 0 }">비공개 글입니다</c:if>
                                           <c:if test="${loginDto.userIdx eq bDto.userIdx and bDto.bDelete ne 0}"><a href="boardView?bIdx=${bDto.bIdx}">${bDto.bTitle }</a></c:if>
                                         </td>
                                    </c:if>
                                    <td>${bDto.bWriter }</td>
                                    <td>${bDto.bDate }</td>
                                      <td>
                                         <c:choose>
                                          <c:when test="${bDto.bStep eq '0' }">
                                             ${bDto.bHit }
                                          </c:when> 
                                            <c:otherwise />
                                         </c:choose>
                                    </td>
                                    <td>
                                       <c:if test="${loginDto.userIdx eq bDto.userIdx and bDto.bDelete ne 0 and bDto.bIsOpen eq '0' }">
                                            <button class="btn btn-default btn-xs" value="댓글쓰기" onclick="location.href='replyPage?bIdx=${bDto.bIdx }'">
                                               <i class='fas fa-comment' style='font-size:20px'></i>
                                            </button>
                                        </c:if>
                                        <c:if test="${loginDto ne null and bDto.bDelete ne 0 and bDto.bIsOpen eq '1' }">
                                             <button class="btn btn-default btn-xs" value="댓글쓰기" onclick="location.href='replyPage?bIdx=${bDto.bIdx }'">
                                                 <i class='fas fa-comment' style='font-size:20px'></i>
                                            </button>
                                        </c:if>
                                        <c:if test="${loginDto eq null }">
                                            <button class="btn btn-danger btn-xs" value="댓글쓰기" onclick="reLogin()">
                                               <i class='fas fa-comment-slash' style='font-size:16px'></i>
                                            </button>
                                        </c:if>
                                        <c:if test="${loginDto ne null }">
                                            <c:if test="${bDto.bDelete eq 0 or ( loginDto.userIdx ne bDto.userIdx and bDto.bIsOpen eq '0') }">
                                               <button class="btn btn-danger btn-xs" value="댓글쓰기" onclick="swal('작성 권한이 없습니다.', '', 'error');">
                                                  <i class='fas fa-comment-slash' style='font-size:16px'></i>
                                               </button>
                                            </c:if>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
        <tfoot>
            <tr><td colspan="7">${pagingView }</td></tr>
            <tr>
                <td colspan="7">
                    <form method="post">
                        <select name="sel" style="height: 25px; padding: 5px">
                            <option value="0">::검색 선택::</option>
                            <option value="BTITLE">제목</option>
                            <option value="BWRITER">작성자</option>
                        </select>
                        <input type="text" name="search" placeholder="항목 선택 후 입력하세요." style="width: 60%; padding: 5px;">
                        <input type="hidden" name="currentPage" value="${currentPage=1 }" />
                        <input type="button" value="검색" class="btn btn-default btn-sm" onclick="searchAction(this.form)" style="width: 10%;">
                    </form>
                </td>
            </tr>
        </tfoot>
    </table>

    <div class="board_btn">
       <!-- 로그인 된 사용자는 게시글을 작성할 수 있다. -->
       <c:if test="${sessionScope.loginDto ne null }">
           <input type="button" class="btn btn-default" value="게시글 작성하기" onclick="location.href='boardWritePage'" />
           <input type="button" class="btn btn-default" value="내 게시글 보기" onclick="location.href='boardMyList'" />
           <input type="button" class="btn btn-default" value="전체 게시글 보기" onclick="location.href='boardList'" />
       </c:if>
   </div>
</div>

<%@ include file="../layout/footer.jsp" %>
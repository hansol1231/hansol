<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="회원관리 페이지" name="title" />
</jsp:include>

<c:if test="${alertResult ne null or not empty alertResult }">
    <script type="text/javascript">
        swal("${alertResult}", "", "info");
    </script>
</c:if>

<script type="text/javascript">
   
   function goSearch(f) {
       var sel = f.sel.value;
       var search = f.search.value;
       if (sel == "0")       { swal("검색 항목을 선택하세요.", "", "error"); return; }
       if (search == "")       { swal("검색할 내용을 입력해주세요.", "", "error"); return; }
       f.action = "dynamicQueryList";
       f.submit();
   }

</script>

<div class="admin_t">
    <h1>회원 목록</h1>
    <form method="get">
        <select name="sel" style="height: 25px;">
           <option value="0">::검색 선택::</option>
            <option value="USERID">아이디</option> 
            <option value="USERNAME">성명</option>
            <option value="USERSN">주민번호</option>
            <option value="USERADDR">주소</option>
            <option value="USEREMAIL">이메일</option>
            <option value="USERTEL">연락처</option>
        </select>
        <input type="text" name="search" placeholder="항목 선택 후 입력하세요." />
        <input type="hidden" name="currentPage" value="${currentPage=1 }" />
        <input type="button" value="검색" class="btn btn-default btn-sm" onclick="goSearch(this.form)" style="margin-bottom: 5px;" />
        
    </form>

    <form method="get">
        <table class="table table-striped table-bordered" style="margin-top: 10px;">
            <thead>
                <tr>
                    <td>회원번호</td>
                    <td>아이디</td>
                    <td>성명</td>
                    <td>주민번호</td>
                    <td>주소</td>
                    <td>이메일</td>
                    <td>연락처</td>
                </tr>
            </thead>
            <tbody>
                <c:if test="${result eq 0 }">
                    <tr>
                        <td colspan="7">가입된 회원이 없습니다.</td>
                    </tr>
                </c:if>
                <c:if test="${result ne 0 }">
                    <c:forEach var="mDto" items="${adminList }">
                        <tr>
                           <c:choose>
                              <c:when test="${mDto.userName eq '탈퇴 계정'}">
                                 <td>${mDto.userIdx }</td>
                                 <td>${mDto.userId }</td>
                                 <td colspan="5">탈퇴된 회원입니다.</td>
                              </c:when>   
                              <c:otherwise>
                                  <td>${mDto.userIdx }</td>
                                  <td><a href="adminView?userIdx=${mDto.userIdx }&userId=${mDto.userId }">${mDto.userId }</a></td>
                                  <td>${mDto.userName }</td>
                                  <td>${mDto.userSN }</td>
                                  <td>${mDto.userAddr }</td>
                                  <td>${mDto.userEmail }</td>
                                  <td>${mDto.userTel }</td>
                        </c:otherwise>
                           </c:choose>
                        </tr>
                    </c:forEach>
                    <tr><td colspan="7">${pagingView }</td></tr>
                    <tr>
                        <th colspan="7">총 회원 : ${adminListResult } 명</th>
                    </tr>
                </c:if>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="7">
                        <input type="button" class="btn btn-success" value="회원 추가" onclick="location.href='adminWritePage'" />
                    </th>
                </tr>
            </tfoot>
        </table>
    </form>
</div>

<%@ include file="../layout/footer.jsp" %>
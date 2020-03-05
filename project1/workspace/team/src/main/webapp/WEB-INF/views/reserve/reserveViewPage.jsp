<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="예약 내역" name="title" />
</jsp:include>

<script>

onload = function() {
   
   //예약 취소 성공 실패
   var isCancel = "${isCancel}";
   
   if (isCancel == "yes") {
       var cancelResult = "${cancelResult}";
       if (cancelResult == 0) {
           swal("예약 취소 실패", "다시 시도해주세요", "error");
           //alert("예약 취소 실패");
       } else {
           swal("예약 취소 성공", "이용해주셔서 감사합니다.", "success");
           //alert("예약 취소 성공");
       }
   }
   
   // 예약 성공 실패
    var isReserve = "${isReserve}";
   
     if (isReserve == "yes") {
         var reserveResult = "${reserveResult}";
         if (reserveResult == 0) {
             swal("예약 신청 실패", "다시 시도해주세요.", "error");
         } else {
             swal("예약 신청 성공", "승인 완료에는 약간의 시간이 걸릴 수 있습니다.", "success");
         }
    }
   
}
</script>

<div class="reserve_t">
    <h1>예약 내역</h1>
    <div class="reserveTable">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>예약자명</th>
                    <th>Month</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>예약 상태</th>
                    <th>예약 취소</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty iList }">
                        <tr>
                            <td colspan="6">
                                   예약 정보가 없습니다.
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="iDto" items="${iList }">
                            <tr>
                                <td>${iDto.userId }</td> <!-- 로그인 정보와 연동할 때 로그인 된 이름으로 바꿀것. -->
                                <td>${iDto.iMonth }</td>
                                <td>${iDto.iDay }</td>
                                <td>
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
                                <c:if test="${iDto.iReserve eq 'sby' }">
                                   <td>
                                      승인 대기중
                                   </td>
                                </c:if>
                                <c:if test="${iDto.iReserve eq 'yes' }">
                                   <td>
                                      승인 완료
                                   </td>
                                </c:if>
                                <c:choose>
                                <c:when test="${iDto.iReserve eq 'sby' }">
                                   <td>
                                       <input type="button" class="btn btn-warning" value="예약 취소" onclick="swal({ 
                                         title: '예약 취소 하시겠습니까?', 
                                         text: '정말로요..??', 
                                         icon: 'warning', 
                                         buttons: true,
                                          dangerMode: true,
                                        })
                                        .then((willDelete) => {
                                          if (willDelete) {
                                                location.href='cancel?iMonth=${iDto.iMonth}&iDay=${iDto.iDay}&iTime=${iDto.iTime}';
      
                                          } else {
                                            swal('취소되었습니다!');
                                            return;
                                          }
                                        });">
                                   </td>
                                </c:when>
                                <c:when test="${iDto.iReserve eq 'yes' }">
                                   <td>예약 취소 불가</td>
                                </c:when>
                                </c:choose>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
            <tfoot>
               <tr>
                  <td colspan="6">${pagingView }</td>
               </tr>
               <tr>
                  <td colspan="6" style="color: red;">* 승인된 예약정보를 취소하려면 관리자에게 문의바랍니다. *</td>
               </tr>
            </tfoot>
        </table>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>
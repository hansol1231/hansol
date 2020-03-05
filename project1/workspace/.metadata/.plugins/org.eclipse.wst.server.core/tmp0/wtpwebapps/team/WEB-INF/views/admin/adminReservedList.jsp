<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="운동장 예약자 리스트" name="title" />
</jsp:include>

<script>

   function goSearch(f) {
      var search = f.search.value;
      if (search == "")       { swal("검색할 내용을 입력해주세요.", "", "error"); return; }
      f.action = "reserveSearch";
      f.submit();
   }
   
   onload = function() {
      
      var isCancel = "${isCancel}";
      var isAck = "${isAck}";
      
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
      
      if (isAck == "yes" ) {
         var ackResult = "${ackResult}";
         if( ackResult == 0 ) {
            swal("예약 승인 실패", "오류 발생", "error");
         } else {
                swal("예약 승인 성공", "해당 회원의 예약 승인이 완료되었습니다.", "success");
            }
      }
      
   }
</script>

<div class="admin_t">
    <h1>전체 예약 현황</h1>
     <table class="table table-striped" style="margin-top: 10px;">
         <thead>
             <tr>
                 <th>ID</th>
                 <th>Month</th>
                 <th>Day</th>
                 <th>Time</th>
                 <th style="width: 50px;"></th>
                 <th style="width: 50px;"></th>
             </tr>
         </thead>
         <tbody>
             <c:if test="${empty reserveList }">
                 <tr>
                     <td colspan="5">예약 현황이 존재하지 않습니다.</td>
                 </tr>
             </c:if>
             <c:if test="${not empty reserveList }">
                 <c:forEach var="iDto" items="${reserveList }" varStatus="k">
                     <tr>
            <td style="vertical-align: middle;">${iDto.userId }</td>
            <td style="vertical-align: middle;">${iDto.iMonth }</td>
            <td style="vertical-align: middle;">${iDto.iDay }</td>
            <c:choose>
               <c:when test="${iDto.iTime eq 1 }">
                  <td style="vertical-align: middle;">12:00 ~ 14:00</td>
               </c:when>
               <c:when test="${iDto.iTime eq 2 }">
                  <td style="vertical-align: middle;">14:00 ~ 16:00</td>
               </c:when>
               <c:when test="${iDto.iTime eq 3 }">
                  <td style="vertical-align: middle;">16:00 ~ 18:00</td>
               </c:when>
            </c:choose>
            <c:if test="${iDto.iReserve eq 'sby' }">
               <td>
                  <input type="button" class="btn btn-success btn-sm" value="예약 승인" onclick="swal({ 
                             title: '해당 회원의 예약을 승인하시겠습니까?', 
                             text: '', 
                             icon: 'info', 
                             buttons: true,
                              dangerMode: true,
                            })
                            .then((willDelete) => {
                              if (willDelete) {
                                    location.href='ackReserve?iMonth=${iDto.iMonth}&iDay=${iDto.iDay}&iTime=${iDto.iTime}';
   
                              } else {
                                swal('취소되었습니다!');
                                return;
                              }
                            });">
               </td>
            </c:if>
            <c:if test="${iDto.iReserve ne 'sby' }">
               <td>
                  <input type="button" class="btn btn-default btn-sm" value="승인 완료" onclick="#">
               </td>
            </c:if>
               <td>
                         <input type="button" class="btn btn-danger btn-sm" value="예약 취소" onclick="swal({ 
                          title: '예약 취소 하시겠습니까?', 
                          text: '정말로요..??', 
                          icon: 'warning', 
                          buttons: true,
                           dangerMode: true,
                         })
                         .then((willDelete) => {
                           if (willDelete) {
                                 location.href='cancel2?iMonth=${iDto.iMonth}&iDay=${iDto.iDay}&iTime=${iDto.iTime}';

                           } else {
                             swal('취소되었습니다!');
                             return;
                           }
                         });">
                      </td>
                     </tr>
                 </c:forEach>
             </c:if>
         </tbody>
         <tfoot>
             <tr><td colspan="6">${pagingView }</td></tr>
           <tr>
              <td colspan="6">
                  <form method="GET">
                    <select name="sel" style="height: 25px; padding: 5px">
                        <option value="USERID">아이디</option>
                    </select>
                    <input type="text" name="search" placeholder="항목 선택 후 입력하세요." style="width: 60%; padding: 5px;">
                    <input type="hidden" name="currentPage" value="${currentPage=1 }" />
                    <input type="button" value="검색" class="btn btn-default btn-sm" onclick="goSearch(this.form)" style="width: 10%;">
                  </form>
               </td>
             <tr>
                <th colspan="6">
                   <input type="button" class="btn btn-default" value="돌아가기" onclick="history.back()" />
                </th>
                </tr>
         </tfoot>
     </table>
</div>

<%@ include file="../layout/footer.jsp" %>
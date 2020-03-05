<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
</head>
<body>

	<div>
		<form action="reserve">
			<table>
				<tbody>
					<tr>
						<td>예약 일자</td>
						<td>${iDto.iMonth }월 ${iDto.iDay }일
							<input type="hidden" name="iMonth" value="${iDto.iMonth }">
							<input type="hidden" name="iDay" value="${iDto.iDay }">
						</td>
					</tr>
					<tr>
						<td>예약자 아이디</td>
						<td>${sessionScope.mDto.userId }
							<input type="hidden" name="userId" value="${sessionScope.mDto.userId }">
						</td>
					</tr>
					<tr>
						<td>예약자</td>
						<td>${sessionScope.mDto.userName }
							<input type="hidden" name="userName" value="${sessionScope.mDto.userName }">
						</td>
					</tr>
					<tr>
						<td>예약 시간</td>
						<td>
							<c:choose>
								<c:when test="${iDto.iTime eq 1 }">
									12:00 ~ 14:00
								</c:when>
								<c:when test="${iDto.iTime eq 2 }">
									14:00 ~ 16:00
								</c:when>
								<c:otherwise>
									16:00 ~ 18:00
								</c:otherwise>
							</c:choose>
							<input type="hidden" name="iTime" value="${iDto.iTime }">
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" name="userEmail"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="submit" value="예약하기">&nbsp;&nbsp;
							<input type="button" value="돌아가기" onclick="location.href='goReservePage'">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="주차 안내 페이지" name="title" />
</jsp:include>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=735685ac942446d3e4c20bea3b26d1c2"></script>
<div class="parking_img">
    <h1>상암월드컵 경기장 주차장</h1>
</div>
<div class="parking_text">
    <h4>서울월드컵경기장의 주차장은 서쪽에 위치한 경기장 주차장과 동쪽에 위치한 홈플러스 주차장 2곳이 있으며<br>이용 시설에 따라 해당 주차장을 이용하셔야만 할인 혜택을 받으실 수 있습니다</h4>
</div>

<div class="map2_text">
    <h1>평화공원 주차장</h1>
    <br>
    <h2>주차대수</h2>
    <h3>1,162대 주차</h3>
    <br>
    <h2>이용시간</h2>
    <h3>10분당 300원, 행사시 4시간 5,000원</h3>
</div>
<div id="map2" class="map2"></div>
<script type="text/javascript">
    var position = new daum.maps.LatLng(37.565625, 126.894675);
    var map = new daum.maps.Map(document.getElementById('map2'), {
        center: position,
        level: 4,
        mapTypeId: daum.maps.MapTypeId.ROADMAP
    });

    var marker = new daum.maps.Marker({
        position: position
    });
    marker.setMap(map);

    var iwContent = '<p style="width:200px"><b>평화의공원 주차장</b><br>서울특별시 마포구 성산동</p>';
    iwPosition = new daum.maps.LatLng(37.565625, 126.894675);
    iwRemoveable = true;

    var infowindow = new daum.maps.InfoWindow({
        position: iwPosition,
        content: iwContent,
        removable: iwRemoveable
    });

    daum.maps.event.addListener(marker, 'click', function() {
        // 마커 위에 인포윈도우를 표시합니다
        infowindow.open(map, marker);
    });

    var zoomControl = new daum.maps.ZoomControl();
    map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
    var mapTypeControl = new daum.maps.MapTypeControl();
    map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

</script>

<%@ include file="../layout/footer.jsp" %>

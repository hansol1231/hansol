<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="시설 안내 페이지" name="title" />
</jsp:include>

<div id="map" class="map"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=735685ac942446d3e4c20bea3b26d1c2"></script>
<script>
    onload = function() {
        var position = new daum.maps.LatLng(37.568204, 126.897293);
        var map = new daum.maps.Map(document.getElementById('map'), {
            center: position,
            level: 4,
            mapTypeId: daum.maps.MapTypeId.ROADMAP
        });
        var marker = new daum.maps.Marker({
            position: position
        });
        marker.setMap(map);
        var iwContent = '<p style="width:200px"><b>상암 월드컵경기장</b><br>서울특별시 마포구 성산동</p>';
        iwPosition = new daum.maps.LatLng(37.568204, 126.897293);
        iwRemoveable = true;

        var infowindow = new daum.maps.InfoWindow({
            position: iwPosition,
            content: iwContent,
            removable: iwRemoveable
        });
        daum.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
        });
        var zoomControl = new daum.maps.ZoomControl();
        map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
        var mapTypeControl = new daum.maps.MapTypeControl();
        map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

    }

</script>

<div class="map_text1">
    <h3>
        위치안내
    </h3>
    <pre>		<b>지하철을 이용하시는 경우</b> 
		6호선 월드컵경기장역 2번 출구, 
		<b>버스를 이용하시는 경우</b> 
		710번(간선), 7019번(지선), 7715번(지선) 
		월드컵경기장 서측 정류소(번호:14-105)
		하차하시는 것이 가장 빠르게 도착하실 수 있습니다.
		<b>도로명 주소 : 서울시 마포구 월드컵로 240</b></pre>
    <h3>
        지하철 안내
    </h3>
    <pre>		6호선 월드컵경기장역 1번출구</pre>
    <h3>
        버스 안내
    </h3>
    <pre>		마을 : 마포08
		일반 : 733
		지선 : 7011, 7013A, 7715, 7013B, 7019, 7715
		간선 : 271, 571, 710
		광역 : 9711A</pre>
</div>
<div class="map_text">
    <h4>지도 위에 마우스 스크롤해서 확대/축소</h4>
</div>
<div class="map_text2">
    <h3>
        자가용안내
    </h3>
    <pre>
		<b>고양, 은평 등 서북부지역</b>
		수색로 증산교차로에서 피턴한 월드컵터널을 통과 증산 교차로를 지나 사천고가 앞에서 좌회전해서 성산로 방향으로 피턴합니다. 
		
		<b>성북, 강북, 노원, 도봉 지역</b>
		사천고가 성산로에 진입한 뒤 상암동길을 타는 방법, 성산로에서 합정로와 만나는 지점까지 직진해 우회전하는 방법이 있습니다.
		내부순환로 차량은 성산램프에서 빠져나와 이용하거나 자유로 방면 램프로 나와 우회전하면 경기장 서문에 닿습니다.
		
		<b>종로, 중구, 서대문 등 도심 지역</b>
		사천고가를 이용해 성산로에서 상암동 길을 타는 서교로를 이용하거나 수색로 증산 교차로에서 피턴하는 방법을 이용해도 됩니다.
		
		<b>영등포, 동작, 관악 등 남서부 지역</b>
		성산대교를 건너 성산로에 진입해 직진하다 좌회전 하면 경기장 남문에 닿습니다.
		
		<b>서초, 강남, 송파 등 강남지역</b>
		강변 북로를 타던 차량은 성산대교와 내부 순환로 진입램프를 지나 바로 우회전 하면 현재 문을 열고 있는 서문을 만납니다.
		<b>일산, 파주, 김포 및 남부 지역</b>
		가양대교와 가양대교 나들목을 통해 난지도길을 이용합니다.
	</pre>
</div>


<%@ include file="../layout/footer.jsp" %>

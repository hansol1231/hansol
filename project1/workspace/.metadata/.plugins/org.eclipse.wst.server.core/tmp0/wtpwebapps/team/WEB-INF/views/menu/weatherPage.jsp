<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
%>

<jsp:include page="../layout/header.jsp">
    <jsp:param value="기상정보 페이지" name="title" />
</jsp:include>

<script type="text/javascript">
    $(function() {
        $("#weather").empty();
        $.ajax({
            url: "weather",
            type: "POST",
            success: function(xml) {
                var result = "";
                var idx = 0;
                $(xml).find("local").each(function() {
                    if ($(this).text() == "강릉" || $(this).text() == "서울" || $(this).text() == "대전" || $(this).text() == "대구" || $(this).text() == "부산" || $(this).text() == "울산" || $(this).text() == "원주" || $(this).text() == "제주" || $(this).text() == "인천") {
                        if ($(this).text() == "제주") {
                            if ($(this).attr("desc") == "흐림") {
                                $(".weather_8").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름많음") {
                                $(".weather_8").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/many_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름조금") {
                                $(".weather_8").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "맑음") {
                                $(".weather_8").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "비") {
                                $(".weather_8").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/rain.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "박무" || $(this).attr("desc") == "연무") {
                                $(".weather_8").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/mist.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "눈") {
                                $(".weather_8").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/snow.png)",
                                    "background-size": "100% 100%"
                                });
                            } else {
                                $(".weather_8").css({
                                    "background": "white",
                                    "background-size": "100% 100%"
                                });
                            }
                        }
                        if ($(this).text() == "부산") {
                            if ($(this).attr("desc") == "흐림") {
                                $(".weather_7").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름많음") {
                                $(".weather_7").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/many_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름조금") {
                                $(".weather_7").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "맑음") {
                                $(".weather_7").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "비") {
                                $(".weather_7").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/rain.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "박무" || $(this).attr("desc") == "연무") {
                                $(".weather_7").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/mist.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "눈") {
                                $(".weather_7").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/snow.png)",
                                    "background-size": "100% 100%"
                                });
                            } else {
                                $(".weather_7").css({
                                    "background": "white",
                                    "background-size": "100% 100%"
                                });
                            }
                        }
                        if ($(this).text() == "울산") {
                            if ($(this).attr("desc") == "흐림") {
                                $(".weather_6").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름많음") {
                                $(".weather_6").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/many_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름조금") {
                                $(".weather_6").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "맑음") {
                                $(".weather_6").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "비") {
                                $(".weather_6").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/rain.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "박무" || $(this).attr("desc") == "연무") {
                                $(".weather_6").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/mist.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "눈") {
                                $(".weather_6").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/snow.png)",
                                    "background-size": "100% 100%"
                                });
                            } else {
                                $(".weather_6").css({
                                    "background": "white",
                                    "background-size": "100% 100%"
                                });
                            }
                        }
                        if ($(this).text() == "대구") {
                            if ($(this).attr("desc") == "흐림") {
                                $(".weather_5").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름많음") {
                                $(".weather_5").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/many_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름조금") {
                                $(".weather_5").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "맑음") {
                                $(".weather_5").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "비") {
                                $(".weather_5").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/rain.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "박무" || $(this).attr("desc") == "연무") {
                                $(".weather_5").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/mist.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "눈") {
                                $(".weather_5").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/snow.png)",
                                    "background-size": "100% 100%"
                                });
                            } else {
                                $(".weather_5").css({
                                    "background": "white",
                                    "background-size": "100% 100%"
                                });
                            }
                        }
                        if ($(this).text() == "대전") {
                            if ($(this).attr("desc") == "흐림") {
                                $(".weather_4").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름많음") {
                                $(".weather_4").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/many_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름조금") {
                                $(".weather_4").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "맑음") {
                                $(".weather_4").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "비") {
                                $(".weather_4").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/rain.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "박무" || $(this).attr("desc") == "연무") {
                                $(".weather_4").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/mist.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "눈") {
                                $(".weather_4").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/snow.png)",
                                    "background-size": "100% 100%"
                                });
                            } else {
                                $(".weather_4").css({
                                    "background": "white",
                                    "background-size": "100% 100%"
                                });
                            }
                        }
                        if ($(this).text() == "원주") {
                            if ($(this).attr("desc") == "흐림") {
                                $(".weather_3").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름많음") {
                                $(".weather_3").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/many_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름조금") {
                                $(".weather_3").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "맑음") {
                                $(".weather_3").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "비") {
                                $(".weather_3").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/rain.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "박무" || $(this).attr("desc") == "연무") {
                                $(".weather_3").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/mist.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "눈") {
                                $(".weather_3").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/snow.png)",
                                    "background-size": "100% 100%"
                                });
                            } else {
                                $(".weather_3").css({
                                    "background": "white",
                                    "background-size": "100% 100%"
                                });
                            }
                        }
                        if ($(this).text() == "인천") {
                            if ($(this).attr("desc") == "흐림") {
                                $(".weather_2").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름많음") {
                                $(".weather_2").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/many_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름조금") {
                                $(".weather_2").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "맑음") {
                                $(".weather_2").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "비") {
                                $(".weather_2").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/rain.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "박무" || $(this).attr("desc") == "연무") {
                                $(".weather_2").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/mist.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "눈") {
                                $(".weather_2").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/snow.png)",
                                    "background-size": "100% 100%"
                                });
                            } else {
                                $(".weather_2").css({
                                    "background": "white",
                                    "background-size": "100% 100%"
                                });
                            }
                        }
                        if ($(this).text() == "서울") {
                            if ($(this).attr("desc") == "흐림") {
                                $(".weather_1").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름많음") {
                                $(".weather_1").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/many_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름조금") {
                                $(".weather_1").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "맑음") {
                                $(".weather_1").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "비") {
                                $(".weather_1").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/rain.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "박무" || $(this).attr("desc") == "연무") {
                                $(".weather_1").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/mist.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "눈") {
                                $(".weather_1").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/snow.png)",
                                    "background-size": "100% 100%"
                                });
                            } else {
                                $(".weather_1").css({
                                    "background": "white",
                                    "background-size": "100% 100%"
                                });
                            }
                        }
                        if ($(this).text() == "강릉") {
                            if ($(this).attr("desc") == "흐림") {
                                $(".weather_0").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름많음") {
                                $(".weather_0").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/many_cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "구름조금") {
                                $(".weather_0").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/cloud.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "맑음") {
                                $(".weather_0").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/sun.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "비") {
                                $(".weather_0").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/rain.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "박무" || $(this).attr("desc") == "연무") {
                                $(".weather_0").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/mist.png)",
                                    "background-size": "100% 100%"
                                });
                            } else if ($(this).attr("desc") == "눈") {
                                $(".weather_0").css({
                                    "background": "url(${pageContext.request.contextPath}/resources/img/weather/snow.png)",
                                    "background-size": "100% 100%"
                                });
                            } else {
                                $(".weather_0").css({
                                    "background": "white",
                                    "background-size": "100% 100%"
                                });
                            }
                        }
                        result += "<tr>";
                        result += "<td>" + $(this).text() + "</td>";
                        result += "<td id='" + idx + "'>" + $(this).attr("desc") + "</td>";
                        result += "<td>" + $(this).attr("ta") + "℃</td>";
                        result += "</tr>";
                        idx++;

                    }
                });
                $("#weather").append(result);
            },
            error: function() {
                alert("실패");
            }
        });
    });

</script>
<div class="weather_text">
    <h1>전국 기상정보</h1>
    <br>
    <h3>전국의 기상정보를<br>확인 할 수 있습니다.</h3>
    <br><br><br><br><br>
    <h4>기상 정보는 3시간 주기로 업데이트 됩니다.</h4>
</div>
<div class="weather_img" id="weather_img">
    <div class="weather_0"></div>
    <div class="weather_1"></div>
    <div class="weather_2"></div>
    <div class="weather_3"></div>
    <div class="weather_4"></div>
    <div class="weather_5"></div>
    <div class="weather_6"></div>
    <div class="weather_7"></div>
    <div class="weather_8"></div>
</div>
<div class="weather_t">
    <table>
        <thead>
            <tr style="text-align: center;">
                <td width="200">지역</td>
                <td width="200">기상</td>
                <td width="200">기온 (섭씨)</td>
            </tr>
        </thead>
        <tbody id="weather">
            <!-- ajax로 채워질 부분 -->
        </tbody>
        <tfoot>
            <tr>
                <td colspan="3">
                    <b>※출처 기상청</b>
                </td>
            </tr>
        </tfoot>
    </table>
</div>

<%@ include file="../layout/footer.jsp" %>
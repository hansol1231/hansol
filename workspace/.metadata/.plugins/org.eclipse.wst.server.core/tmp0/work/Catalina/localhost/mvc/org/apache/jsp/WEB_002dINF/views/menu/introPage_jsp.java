/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.47
 * Generated at: 2020-02-25 13:07:10 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.menu;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class introPage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/views/menu/../layout/footer.jsp", Long.valueOf(1582622365000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../layout/header.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("title", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("운동장소개 페이지", request.getCharacterEncoding()), out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"intro_text1\">\r\n");
      out.write("    <h1>개요</h1>\r\n");
      out.write("    <h4>\r\n");
      out.write("        <pre>\r\n");
      out.write("\t\t서울특별시 마포구 성산동에 위치한 축구장. \r\n");
      out.write("\t\t2002 FIFA 월드컵 한국/일본을 위해 건설된 아시아 최대 규모의 축구 전용구장이자\r\n");
      out.write("\t\t현재 대한민국 축구 국가대표팀과 FC 서울의 홈 구장으로 사용되고 있습니다.</pre>\r\n");
      out.write("    </h4>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"intro_img\"></div>\r\n");
      out.write("<div class=\"intro_text2\">\r\n");
      out.write("    <h1>역사</h1>\r\n");
      out.write("    <h4>\r\n");
      out.write("        <pre>\r\n");
      out.write("\t\t월드컵 유치가 결정되고 서울특별시는 서울 올림픽주경기장 리모델링, 뚝섬 돔 경기장 두 가지 안을 고려 중이었으나, \r\n");
      out.write("\t\t축구계에서 주 경기장만큼은 축구 전용구장이 되어야 한다는 입장을 강하게 표명하며 서울시와 갈등을 빚었다.\r\n");
      out.write("\t\t \r\n");
      out.write("\t\t이 과정에서 옆 동네인 인천의 인천문학경기장을 주 경기장으로 검토하는 의견도 있었지만 \r\n");
      out.write("\t\t주 경기장의 위치는 수도여야 한다는 당위성이 먹혀들었고, \r\n");
      out.write("\t\t경제적으로도 서울올림픽 주 경기장의 리모델링 비용이 경기장 신축 비용보다 높았기 때문에\r\n");
      out.write("\t\t결국 서울월드컵경기장이 건설되게 되었다. \r\n");
      out.write("\t\t\r\n");
      out.write("\t\t한국은 다른 국가에 비해 수도권 집중도가 훨씬 높고, 서울은 국내에서도 비교가 안되는 최대 도시에 \r\n");
      out.write("\t\t국가수도라는 타이틀을 함께 가지고 있기 때문에 대외적 상징성을 고려한 선택이었다.\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t2001년 11월 10일 완공되어 개장 기념 경기로 크로아티아와 친선 경기를 가졌고, \r\n");
      out.write("\t\t최태욱과 김남일의 골로 2:0으로 승리했다.\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t2002 한일 월드컵의 주 경기장으로 선정되었지만 월드컵 본선 경기는 3경기밖에 치러지지 않았다.\r\n");
      out.write("\t\t이는 월드컵을 한국과 일본이 공동 개최하다보니 경기장 수만 20개에 육박했던지라 어쩔 수 없었던 상황.\r\n");
      out.write("\t\t개막전이었던 세네갈 vs 프랑스, C조 3차전 터키 vs 중국전, 4강 1경기 대한민국 vs 독일전 등 총 3경기가 열렸다.\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t2002 한일 월드컵을 성공적으로 치른 뒤, 2019년 현재 경기장 일대는\r\n");
      out.write("\t\t디지털미디어시티라 불리는 국제업무단지가 들어서고 국내의 주요 언론, 방송사의\r\n");
      out.write("\t\t핵심 시설이 위치한 곳으로 발전했다.</pre>\r\n");
      out.write("    </h4>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"footer\" style=\"position: absolute; width: 100%;\">\r\n");
      out.write("    <h4>약관 | 개인정보 | 저작권</h4>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
      out.write('\r');
      out.write('\n');
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
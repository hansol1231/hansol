/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.47
 * Generated at: 2020-02-25 10:12:31 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1582621307568L));
    _jspx_dependants.put("jar:file:/Users/parkhansol/Desktop/spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/views/layout/footer.jsp", Long.valueOf(1582622365000L));
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
      out.write("\r\n");
      out.write("\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "layout/header.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("title", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("로그인페이지", request.getCharacterEncoding()), out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("   \r\n");
      out.write("    onload = function() {\r\n");
      out.write("        var slideIndex = 0;\r\n");
      out.write("        showSlides();\r\n");
      out.write("\r\n");
      out.write("        function showSlides() {\r\n");
      out.write("            var i;\r\n");
      out.write("            var slides = document.getElementsByClassName(\"mySlides\");\r\n");
      out.write("            var dots = document.getElementsByClassName(\"dot\");\r\n");
      out.write("            for (i = 0; i < slides.length; i++) {\r\n");
      out.write("                slides[i].style.display = \"none\";\r\n");
      out.write("            }\r\n");
      out.write("            slideIndex++;\r\n");
      out.write("            if (slideIndex > slides.length) {\r\n");
      out.write("                slideIndex = 1\r\n");
      out.write("            }\r\n");
      out.write("            slides[slideIndex - 1].style.display = \"block\";\r\n");
      out.write("            setTimeout(showSlides, 1500); // Change image every 2 seconds\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("       var isLogin = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${isLogin}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\";\r\n");
      out.write("       if (isLogin == \"yes\") {\r\n");
      out.write("           var loginResult = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${loginResult}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\";\r\n");
      out.write("           if (loginResult == 0) {\r\n");
      out.write("               swal({\r\n");
      out.write("                   title: \"로그인 실패\",\r\n");
      out.write("                   text: \"아이디 또는 비밀번호가 일치하지 않습니다.\",\r\n");
      out.write("                   type: \"error\"\r\n");
      out.write("               }).then(function() {\r\n");
      out.write("                   location.href = \"loginPage\";\r\n");
      out.write("               });\r\n");
      out.write("           } else {\r\n");
      out.write("               swal(\"로그인 성공\", \"환영합니다 ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${loginDto.userName}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("님!\", \"success\");\r\n");
      out.write("           }\r\n");
      out.write("       }\r\n");
      out.write("       \r\n");
      out.write("       // 탈퇴 계정 접근 불가\r\n");
      out.write("       var isLog = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${loginDto.userName }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\"\r\n");
      out.write("        if (isLog == \"탈퇴 계정\") {\r\n");
      out.write("           swal({\r\n");
      out.write("                 title: \"로그인 실패\",\r\n");
      out.write("                 text: \"탈퇴된 계정입니다.\",\r\n");
      out.write("                 type: \"error\"\r\n");
      out.write("             }).then(function() { location.href = \"sessionClear\"; });\r\n");
      out.write("        \r\n");
      out.write("          \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("\r\n");
      out.write("        // 예약 관리 성공 실패\r\n");
      out.write("        var isCalendarAdd = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${isCalendarAdd}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\";\r\n");
      out.write("        var isCalendarRemove = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${isCalendarRemove}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\";\r\n");
      out.write("\r\n");
      out.write("        if (isCalendarAdd == \"yes\") {\r\n");
      out.write("            var addResult = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${addResult}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\";\r\n");
      out.write("            if (addResult == 0) {\r\n");
      out.write("                swal(\"예약 테이블 추가 실패\", \"다시 시도해주세요.\", \"error\");\r\n");
      out.write("            } else {\r\n");
      out.write("                swal(\"예약 테이블 추가 성공\", \"성공적으로 달력이 업데이트 되었습니다!\", \"success\");\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        if (isCalendarRemove == \"yes\") {\r\n");
      out.write("            var delResult = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${delResult}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\";\r\n");
      out.write("            if (delResult == 0) {\r\n");
      out.write("                swal(\"예약 테이블 삭제 실패\", \"삭제할 데이터가 존재하지 않습니다.\", \"error\");\r\n");
      out.write("            } else {\r\n");
      out.write("                swal(\"예약 테이블 삭제 성공\", \"성공적으로 달력이 업데이트 되었습니다!\", \"success\");\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("       }\r\n");
      out.write("    }\r\n");
      out.write("   \r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<div class=\"slideshow-container\">\r\n");
      out.write("    <div class=\"mySlides fade\">\r\n");
      out.write("        <div class=\"numbertext\">\r\n");
      out.write("            <h1><label>홈페이지에 오신걸 환영합니다. 메뉴를 선택하세요.</label></h1>\r\n");
      out.write("        </div>\r\n");
      out.write("        <img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/back/back.jpg\" style=\"width:100%; height: 100%;\">\r\n");
      out.write("        <div class=\"text\"></div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"mySlides fade\">\r\n");
      out.write("        <div class=\"numbertext\">\r\n");
      out.write("            <h1><label>홈페이지에 오신걸 환영합니다. 메뉴를 선택하세요.</label></h1>\r\n");
      out.write("        </div>\r\n");
      out.write("        <img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/back/back2.jpg\" style=\"width:100%; height: 100%;\">\r\n");
      out.write("        <div class=\"text\"></div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"mySlides fade\">\r\n");
      out.write("        <div class=\"numbertext\">\r\n");
      out.write("            <h1><label>홈페이지에 오신걸 환영합니다. 메뉴를 선택하세요.</label></h1>\r\n");
      out.write("        </div>\r\n");
      out.write("        <img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/back/back3.jpg\" style=\"width:100%; height: 100%;\">\r\n");
      out.write("        <div class=\"text\"></div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"mySlides fade\">\r\n");
      out.write("        <div class=\"numbertext\">\r\n");
      out.write("            <h1><label>홈페이지에 오신걸 환영합니다. 메뉴를 선택하세요.</label></h1>\r\n");
      out.write("        </div>\r\n");
      out.write("        <img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/back/back4.jpg\" style=\"width:100%; height: 100%;\">\r\n");
      out.write("        <div class=\"text\"></div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
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

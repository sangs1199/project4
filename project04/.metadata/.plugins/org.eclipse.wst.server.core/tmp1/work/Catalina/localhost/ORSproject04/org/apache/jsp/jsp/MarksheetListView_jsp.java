/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.35
 * Generated at: 2019-05-07 12:27:59 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import in.co.sunrays.proj4.controller.MarksheetListCtl;
import in.co.sunrays.proj4.controller.BaseCtl;
import in.co.sunrays.proj4.util.ServletUtility;
import in.co.sunrays.proj4.bean.MarksheetBean;
import in.co.sunrays.proj4.model.MarksheetModel;
import java.util.List;
import java.util.Iterator;
import in.co.sunrays.proj4.bean.RoleBean;
import in.co.sunrays.proj4.controller.LoginCtl;
import in.co.sunrays.proj4.bean.UserBean;
import in.co.sunrays.proj4.controller.ORSView;

public final class MarksheetListView_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/jsp/Footer.jsp", Long.valueOf(1557147137792L));
    _jspx_dependants.put("/jsp/Header.jsp", Long.valueOf(1555328989969L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("in.co.sunrays.proj4.controller.ORSView");
    _jspx_imports_classes.add("in.co.sunrays.proj4.bean.RoleBean");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("in.co.sunrays.proj4.model.MarksheetModel");
    _jspx_imports_classes.add("java.util.Iterator");
    _jspx_imports_classes.add("in.co.sunrays.proj4.controller.MarksheetListCtl");
    _jspx_imports_classes.add("in.co.sunrays.proj4.controller.LoginCtl");
    _jspx_imports_classes.add("in.co.sunrays.proj4.util.ServletUtility");
    _jspx_imports_classes.add("in.co.sunrays.proj4.controller.BaseCtl");
    _jspx_imports_classes.add("in.co.sunrays.proj4.bean.UserBean");
    _jspx_imports_classes.add("in.co.sunrays.proj4.bean.MarksheetBean");
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
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function checkedAll()\r\n");
      out.write("{\r\n");
      out.write("\t\r\n");
      out.write("\tvar totalElement=document.forms[0].elements.length;\r\n");
      out.write("\r\n");
      out.write("\tfor(var i=0;i<totalElement;i++){\r\n");
      out.write("\t\tvar en=document.forms[0].elements[i].name;\r\n");
      out.write("\t\tif(en!=undefined & en.indexOf(\"chk_1\")!=-1)\r\n");
      out.write("\t\t{\t\r\n");
      out.write("\t\t\tdocument.forms[0].elements[i].checked=document.frm.chk_all.checked;\r\n");
      out.write("\t\t \r\n");
      out.write("\t\t}\t\t\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("function check(){\r\n");
      out.write("\tvar en=document.forms[0].elements[4].name;\r\n");
      out.write("\t\r\n");
      out.write("\tif(en!=undefined & en.indexOf(\"chk_1\")!=-1)\r\n");
      out.write("\t{\t\r\n");
      out.write("\t\tdocument.forms[0].elements[3].checked=document.frm.chk_all.unchecked;\r\n");
      out.write("\t}\t\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<body bgcolor=\"Thistle\">\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    UserBean userBean = (UserBean) session.getAttribute("user");

    boolean userLoggedIn = userBean != null;

    String welcomeMsg = "Hi, ";

    if (userLoggedIn) {
        String role = (String) session.getAttribute("role");
        welcomeMsg += userBean.getFirstName() + " (" + role + ")";
    } else {
        welcomeMsg += "Guest";
    }

      out.write("\r\n");
      out.write("\r\n");
      out.write("<table width=\"100%\" border=\"0\" bgcolor=\"lightgrey\">\r\n");
      out.write("    <tr>\r\n");
      out.write("        <td width=\"90%\" ><a href=\"");
      out.print(ORSView.WELCOME_CTL);
      out.write("\">Welcome</b></a> |\r\n");
      out.write("            ");

            if (userLoggedIn) {
        
      out.write(" <a href=\"");
      out.print(ORSView.LOGIN_CTL);
      out.write("?operation=");
      out.print(LoginCtl.OP_LOG_OUT);
      out.write("\">Logout</b></a>\r\n");
      out.write("\r\n");
      out.write("            ");

                } else {
            
      out.write(" <a href=\"");
      out.print(ORSView.LOGIN_CTL);
      out.write("\">Login</b></a> ");

     }
 
      out.write("</td>\r\n");
      out.write("        <td rowspan=\"2\">\r\n");
      out.write("            <h1 align=\"Right\">\r\n");
      out.write("                <img src=\"");
      out.print(ORSView.APP_CONTEXT);
      out.write("/img/rays.png\" width=\"318\"\r\n");
      out.write("                    height=\"90\">\r\n");
      out.write("            </h1>\r\n");
      out.write("        </td>\r\n");
      out.write("\r\n");
      out.write("    </tr>\r\n");
      out.write("    \r\n");
      out.write("    <tr>\r\n");
      out.write("        <td >\r\n");
      out.write("            <h3>\r\n");
      out.write("                ");
      out.print(welcomeMsg);
      out.write("</h3>\r\n");
      out.write("        </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("    ");

        if (userLoggedIn) {
        	 
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <tr>\r\n");
      out.write("        <td colspan=\"2\" >\r\n");
      out.write("        \r\n");
      out.write("        <a href=\"");
      out.print(ORSView.GET_MARKSHEET_CTL);
      out.write("\">Get Marksheet</b></a> |\r\n");
      out.write("            <a href=\"");
      out.print(ORSView.MARKSHEET_MERIT_LIST_CTL);
      out.write("\">Marksheet Merit\r\n");
      out.write("                List</b>\r\n");
      out.write("        </a> | <a href=\"");
      out.print(ORSView.MY_PROFILE_CTL);
      out.write("\">MyProfile</b></a> | <a\r\n");
      out.write("            href=\"");
      out.print(ORSView.CHANGE_PASSWORD_CTL);
      out.write("\">Change Password</b></a> | <a\r\n");
      out.write("            href=\"");
      out.print(ORSView.JAVA_DOC_VIEW);
      out.write("\">Java Doc</b></a> | \r\n");
      out.write("   \r\n");
      out.write("            ");

            
            if (userBean.getRoleId() == RoleBean.ADMIN) 
            {
        
      out.write(" <a href=\"");
      out.print(ORSView.MARKSHEET_CTL);
      out.write("\">Add Marksheet</b></a> | <a\r\n");
      out.write("            href=\"");
      out.print(ORSView.MARKSHEET_LIST_CTL);
      out.write("\">Marksheet List</b></a> | \r\n");
      out.write("            <a href=\"");
      out.print(ORSView.USER_CTL);
      out.write("\">Add User</b></a> | <a\r\n");
      out.write("            href=\"");
      out.print(ORSView.USER_LIST_CTL);
      out.write("\">User List</b></a> | <a\r\n");
      out.write("            href=\"");
      out.print(ORSView.COLLEGE_CTL);
      out.write("\">Add College</b></a> | <a\r\n");
      out.write("            href=\"");
      out.print(ORSView.COLLEGE_LIST_CTL);
      out.write("\">College List</b></a> | <a\r\n");
      out.write("            href=\"");
      out.print(ORSView.STUDENT_CTL);
      out.write("\">Add Student</b></a> | <a\r\n");
      out.write("            href=\"");
      out.print(ORSView.STUDENT_LIST_CTL);
      out.write("\">Student List</b></a> | <a\r\n");
      out.write("            href=\"");
      out.print(ORSView.ROLE_CTL);
      out.write("\">Add Role</b></a> | <a\r\n");
      out.write("            href=\"");
      out.print(ORSView.ROLE_LIST_CTL);
      out.write("\">Role List</b></a> | \r\n");
      out.write("           <a href=\"");
      out.print(ORSView.COURSES_CTL);
      out.write("\">Add Course</b></a> |\r\n");
      out.write("           <a href=\"");
      out.print(ORSView.COURSES_LIST_CTL );
      out.write("\">Courses List</a>|\r\n");
      out.write("           <a href=\"");
      out.print(ORSView.FACULTY_CTL);
      out.write("\">Add Faculty</b></a> |\r\n");
      out.write("           <a href=\"");
      out.print(ORSView.FACULTY_LIST_CTL );
      out.write("\">Faculty List</a>|\r\n");
      out.write("           <a href=\"");
      out.print(ORSView.SUBJECTS_CTL);
      out.write("\">Add Subjects</b></a> |\r\n");
      out.write("           <a href=\"");
      out.print(ORSView.SUBJECTS_LIST_CTL );
      out.write("\">Subjects List</a>|\r\n");
      out.write("           <a href=\"");
      out.print(ORSView.TIMETABLE_CTL);
      out.write("\">Create Time Table</b></a> |\r\n");
      out.write("           <a href=\"");
      out.print(ORSView.TIMETABLE_LIST_CTL );
      out.write("\">View Time Table</a>|| ");

     }
 
      out.write("</td>\r\n");
      out.write("    \r\n");
      out.write("    </tr>\r\n");
      out.write("    ");

        }
    
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("<hr>");
      out.write("\r\n");
      out.write("    <center>\r\n");
      out.write("        <h1>Marksheet List</h1>\r\n");
      out.write("\r\n");
      out.write("        <form action=\"");
      out.print(ORSView.MARKSHEET_LIST_CTL);
      out.write("\" method=\"POST\" name=\"frm\">\r\n");
      out.write("\r\n");
      out.write("            <table width=\"100%\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td align=\"center\"><label> Name :</label> <input type=\"text\"\r\n");
      out.write("                        name=\"name\"\r\n");
      out.write("                        value=\"");
      out.print(ServletUtility.getParameter("name", request));
      out.write("\">\r\n");
      out.write("                        &emsp; <label>RollNo :</label> <input type=\"text\" name=\"rollNo\"\r\n");
      out.write("                        value=\"");
      out.print(ServletUtility.getParameter("rollNo", request));
      out.write("\">&emsp;\r\n");
      out.write("                        <input type=\"submit\" name=\"operation\" value=\"");
      out.print(MarksheetListCtl.OP_SEARCH );
      out.write("\"></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("            <br>\r\n");
      out.write("            <table border=\"1\" width=\"100%\">\r\n");
      out.write("                <tr><th style=\"width: 100px\"><input type=\"checkbox\" name=\"chk_all\" onclick=\"checkedAll()\"/>Select All</th>\r\n");
      out.write("                    <th>Select</th>\r\n");
      out.write("                    <th>ID</th>\r\n");
      out.write("                    <th>RollNo</th>\r\n");
      out.write("                    <th>Name</th>\r\n");
      out.write("                    <th>Physics</th>\r\n");
      out.write("                    <th>Chemistry</th>\r\n");
      out.write("                    <th>Maths</th>\r\n");
      out.write("                    <th>Edit</th>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td colspan=\"8\"><font color=\"red\">");
      out.print(ServletUtility.getErrorMessage(request));
      out.write("</font></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                ");

                MarksheetModel model=new MarksheetModel();
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    List list = ServletUtility.getList(request);
                    Iterator<MarksheetBean> it = list.iterator();
                    MarksheetBean bean=null;

                    while (it.hasNext()) {

                         bean = it.next();
                
      out.write("\r\n");
      out.write("                <tr align=\"center\"> \r\n");
      out.write("                <td><input type=\"checkbox\" id=\"sid\" name=\"chk_1\" onchange=\"check()\" \r\n");
      out.write("                    value=\"");
      out.print(bean.getId());
      out.write("\"></td>\r\n");
      out.write("                    \r\n");
      out.write("                    <td>");
      out.print(bean.getId());
      out.write("</td>\r\n");
      out.write("                    <td>");
      out.print(bean.getRollNo());
      out.write("</td>\r\n");
      out.write("                    <td>");
      out.print(bean.getName());
      out.write("</td>\r\n");
      out.write("                    <td>");
      out.print(bean.getPhysics());
      out.write("</td>\r\n");
      out.write("                    <td>");
      out.print(bean.getChemistry());
      out.write("</td>\r\n");
      out.write("                    <td>");
      out.print(bean.getMaths());
      out.write("</td>\r\n");
      out.write("                    <td><a href=\"MarksheetCtl?id=");
      out.print(bean.getId());
      out.write("\">Edit</a></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("\r\n");
      out.write("                ");

                    }
                
      out.write("\r\n");
      out.write("            </table>\r\n");
      out.write("            <table width=\"100%\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td><input type=\"submit\" name=\"operation\"\r\n");
      out.write("                        value=\"");
      out.print(MarksheetListCtl.OP_PREVIOUS);
      out.write('"');
      out.write(' ');
if (pageNo == 1) {
      out.write("\r\n");
      out.write("\t\t\t\t\tdisabled=\"disabled\" ");
}
      out.write("></td>\r\n");
      out.write("                    <td><input type=\"submit\" name=\"operation\"\r\n");
      out.write("                        value=\"");
      out.print(MarksheetListCtl.OP_NEW);
      out.write("\"></td>\r\n");
      out.write("                    <td><input type=\"submit\"\r\n");
      out.write("                        name=\"operation\" value=\"");
      out.print(MarksheetListCtl.OP_DELETE);
      out.write("\"></td>\r\n");
      out.write("                    <td align=\"right\"><input type=\"submit\" name=\"operation\"\r\n");
      out.write("                        value=\"");
      out.print(MarksheetListCtl.OP_NEXT);
      out.write('"');
      out.write(' ');
if (list.size() < pageSize || model.nextPK()-1 == bean.getId()) {
      out.write("\r\n");
      out.write("\t\t\t\t\tdisabled=\"disabled\" ");
}
      out.write("></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("            <input type=\"hidden\" name=\"pageNo\" value=\"");
      out.print(pageNo);
      out.write("\"> <input\r\n");
      out.write("                type=\"hidden\" name=\"pageSize\" value=\"");
      out.print(pageSize);
      out.write("\">\r\n");
      out.write("        </form>\r\n");
      out.write("    </center>\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".footer {\r\n");
      out.write("position:fixed;\r\n");
      out.write("left:0;\r\n");
      out.write("top:93%;\r\n");
      out.write("bottom:0;\r\n");
      out.write("width:100%;\r\n");
      out.write("text-align:center;\r\n");
      out.write("color:black;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<div class=\"footer\">\r\n");
      out.write("\r\n");
      out.write("    <H3 >Copyrights &copy;SUNRAYS Technologies</H3>\r\n");
      out.write("    </div>");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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

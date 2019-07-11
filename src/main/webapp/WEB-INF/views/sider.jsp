<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/10
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<div class="sidebar">
    <nav class="sidebar-nav">
        <ul class="nav">
            <li class="nav-item">
                <a href="/home/index" class="nav-link <%=(request.getParameter("pageTitle")).equals("home") ? "active":""%>">
                    <i class="icon icon-home"></i> 主页
                </a>
            </li>

            <li class="nav-item">
                <a href="/home/enter" class="nav-link <%=(request.getParameter("pageTitle")).equals("enter") ? "active":""%>">
                    <i class="icon icon-login"></i> 入库记录
                </a>
            </li>

            <li class="nav-item">
                <a href="/home/sell" class="nav-link <%=(request.getParameter("pageTitle")).equals("sell") ? "active":""%>">
                    <i class="icon icon-logout"></i> 出售记录
                </a>
            </li>


            <%--<li class="nav-item nav-dropdown">--%>
                <%--<a href="#" class="nav-link nav-dropdown-toggle">--%>
                    <%--<i class="icon icon-logout"></i> Layout <i class="fa fa-caret-left"></i>--%>
                <%--</a>--%>

                <%--<ul class="nav-dropdown-items">--%>
                    <%--<li class="nav-item">--%>
                        <%--<a href="/home/sell" class="nav-link <%=(request.getParameter("pageTitle")).equals("sell") ? "active":""%>">--%>
                            <%--<i class="icon icon-list" id="selldetailed"></i> detailed--%>
                        <%--</a>--%>
                    <%--</li>--%>

                    <%--<li class="nav-item">--%>
                        <%--<a href="layouts-fixed-sidebar.html" class="nav-link">--%>
                            <%--<i class="icon icon-eye"></i> Record--%>
                        <%--</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</li>--%>
        </ul>
    </nav>

</div>
</body>
</html>

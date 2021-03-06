<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="com.bank.dao.AccountTypeHibernateDAO" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.bank.model.Account" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="com.bank.dao.AccountTypeHibernateDAO" %>
<%@ page import="com.bank.model.AccountType" %><%--
  Created by IntelliJ IDEA.
  User: Kristian Lucero
  Date: 6/28/2017
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="com.bank.dao.AccountTypeHibernateDAO" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.bank.model.Account" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="com.bank.dao.AccountTypeHibernateDAO" %>
<%@ page import="com.bank.model.AccountType" %>

<!-- BEGIN HEADER -->
<div class="page-header">
    <!-- BEGIN HEADER TOP -->
    <div class="page-header-top">
        <div class="container">
            <!-- BEGIN LOGO -->
            <div class="page-logo">
                <!-- <a href="index.html"><img src="../../assets/admin/layout3/img/logo-default.png" alt="logo" class="logo-default"></a> -->
                <a href="accounts.jsp" class="logo-default"><strong><h3><b>The Best Bank Inc.</b></h3></strong></a>
            </div>
            <!-- END LOGO -->
            <!-- BEGIN RESPONSIVE MENU TOGGLER -->
            <a href="javascript:;" class="menu-toggler"></a>
            <!-- END RESPONSIVE MENU TOGGLER -->
            <!-- BEGIN TOP NAVIGATION MENU -->
            <div class="top-menu">
                <ul class="nav navbar-nav pull-right">
                    <li class="dropdown dropdown-user dropdown-dark">
                        <a class="dropdown-toggle" data-toggle="dropdown" data-close-others="true">
                            <span class="username username-hide-mobile"><b>${username}</b></span>
                        </a>
                    </li>
                    <li class="droddown dropdown-separator">
                        <span class="separator"></span>
                    </li>
                    <li>
                        <a href="profile.jsp">
                            <b>Profile & Settings</b>
                        </a>
                    </li>
                    <li class="droddown dropdown-separator">
                        <span class="separator"></span>
                    </li class="dropdown dropdown-user dropdown-dark">
                    <li>
                        <a href="logout.jsp">
                            <b>Sign Out</b>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- END TOP NAVIGATION MENU -->
        </div>
    </div>
    <!-- END HEADER TOP -->
    <!-- BEGIN HEADER MENU -->
    <div class="page-header-menu">
        <div class="container">
            <!-- BEGIN MEGA MENU -->
            <!-- DOC: Apply "hor-menu-light" class after the "hor-menu" class below to have a horizontal menu with white background -->
            <!-- DOC: Remove data-hover="dropdown" and data-close-others="true" attributes below to disable the dropdown opening on mouse hover -->
            <div class="hor-menu ">
                <ul class="nav navbar-nav">
                    <li class="menu-dropdown mega-menu-dropdown active">
                        <a data-hover="megamenu-dropdown" data-close-others="true" data-toggle="dropdown" href="javascript:;" class="dropdown-toggle">
                            Accounts <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu" style="min-width: 700px">
                            <li>
                                <div class="mega-menu-content">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <ul class="mega-menu-submenu">
                                                <li>
                                                    <h3>Accounts Overview</h3>
                                                </li>
                                                <%
                                                    ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
                                                    AccountTypeHibernateDAO accountTypeHibernateDAO = (AccountTypeHibernateDAO) context.getBean("accountTypeDAO");

                                                    Set set = (Set)session.getAttribute("accounts");
                                                    for(Iterator iterator = set.iterator();iterator.hasNext();){
                                                        Account account = (Account) iterator.next();
                                                        AccountType accountType = (AccountType) accountTypeHibernateDAO.get(account.getAccountTypeId());
                                                        out.print("<li>");
                                                        out.print("<a href = \"account_information?account_id="+account.getId()+
                                                                "\"class=\"iconify\">");
                                                        out.print(accountType.getAccountType()+"&nbsp&nbsp&nbsp"+account.getBalance());
                                                        out.print("</li>");
                                                    }
                                                %>

                                                <li>
                                                    <hr>
                                                    <a href="accounts.jsp">View All Accounts</a>
                                                </li>

                                            </ul>
                                        </div>
                                        <div class="col-md-2 verticalLine">

                                        </div>
                                        <div class="col-md-4">
                                            <ul class="mega-menu-submenu">
                                                <li>
                                                    <h3>Other Documents</h3>
                                                </li>
                                                <li>
                                                    <a href="statements.jsp" class="iconify">
                                                        Statements </a>
                                                </li>
                                                <li>
                                                    <a href="spending.jsp" class="iconify">
                                                        Spending and Budgeting </a>
                                                </li>
                                                <li>
                                                    <a href="open_account.jsp" class="iconify">
                                                        Open a new account </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="menu-dropdown classic-menu-dropdown ">
                        <a data-hover="megamenu-dropdown" data-close-others="true" data-toggle="dropdown" href="javascript:;">
                            Transfers <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu pull-left">
                            <li>
                                <a href="transfer.jsp">
                                    Send Money Between Accounts</a>
                            </li>
                            <li>
                                <a href="transfer.jsp#tab_15_2">
                                    Send Money to Someone </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="open_account.jsp">Open an account</a>
                    </li>
                </ul>
            </div>
            <!-- END MEGA MENU -->
        </div>
    </div>
    <!-- END HEADER MENU -->
</div>
<!-- END HEADER -->

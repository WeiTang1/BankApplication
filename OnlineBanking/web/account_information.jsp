<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.bank.model.Transaction" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="com.bank.dao.AccountTypeHibernateDAO" %>
<%@ page import="com.bank.model.AccountType" %><%--
  Created by IntelliJ IDEA.
  User: Kristian Lucero
  Date: 6/28/2017
  Time: 12:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>Bank | Account Information</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
    <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
    <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
	<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
	<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
	<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
	<link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
	<!-- END PAGE LEVEL STYLES -->
    <!-- BEGIN THEME STYLES -->
    <link href="assets/global/css/components-md.css" id="style_components" rel="stylesheet" type="text/css">
    <link href="assets/global/css/plugins-md.css" rel="stylesheet" type="text/css">
    <link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
    <link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
    <link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body class="page-md">
<jsp:include page="header.jsp" />
<!-- BEGIN PAGE CONTAINER -->
<div class="page-container">
    <!-- BEGIN PAGE HEAD -->
    <div class="page-head">
        <div class="container">
            <!-- BEGIN PAGE TITLE -->
            <div class="page-title">
                <h1>Account Information</h1>
            </div>
            <!-- END PAGE TITLE -->
        </div>
    </div>
    <!-- END PAGE HEAD -->
    <!-- BEGIN PAGE CONTENT -->
    <div class="page-content">
        <div class="container">
            <!-- BEGIN PAGE CONTENT INNER -->
            <div class="row">
                <div class="col-md-12">
                	
					<div class="portlet light">
						<div class="portlet-body">
							<h3><%
								ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
								AccountTypeHibernateDAO accountTypeDAO= (AccountTypeHibernateDAO) context.getBean("accountTypeDAO");

								int account_id = Integer.parseInt(request.getParameter("account_id"));
								String account_type =((AccountType)accountTypeDAO.get(account_id)).getAccountType();
								out.print(session.getAttribute("username")+"'s "+account_type+" account");


							%></h3>
							<div class="tabbable-line">
								<ul class="nav nav-tabs ">
									<li class="active">
										<a href="#tab_15_1" data-toggle="tab">
										Activity </a>
									</li>
									<li>
										<a href="#tab_15_2" data-toggle="tab">
										Statements & Documents </a>
									</li>
									<li>
										<a href="#tab_15_3" data-toggle="tab">
										Information & Services</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tab_15_1">
										<p>
											 <b>Transactions</b>
										</p>
										<br>
										<!-- BEGIN EXAMPLE TABLE PORTLET-->
												<table class="table table-striped table-bordered table-hover" id="sample_3">
													<thead>
														<tr>
					                                        <th>
					                                            Posting Date
					                                        </th>
					                                        <th>
					                                            Description
					                                        </th>
					                                        <th>
					                                            Type
					                                        </th>
					                                        <th>
					                                            Status
					                                        </th>
					                                        <th>
					                                            Amount
					                                        </th>
					                                        <th>
					                                            Available Balance
					                                        </th>
					                                    </tr>
													</thead>
													<tbody>
													<%
														List list = (List) session.getAttribute("transactions");

														for(Iterator iterator= list.iterator();iterator.hasNext();) {
															Transaction trans = (Transaction) iterator.next();
															out.print("<tr><td>");
															out.print(trans.getDate().toString());
															out.print("</td>");
															out.print("<td>");
															out.print(trans.getDescription());
															out.print("</td>");
															out.print("<td>");
															out.print(trans.getTransactionTypeId());
															out.print("</td>");
															out.print("<td>");
															out.print(trans.getTransactionStatusId());
															out.print("</td>");
															out.print("<td>");
															out.print(trans.getAmount());
															out.print("</td>");
															out.print("<td>");
															out.print(trans.getAvailableBalance());
															out.print("</td>");
															out.print("</tr>");


														}
													%>
														<%--<tr>--%>
					                                        <%--<td>--%>
					                                            <%--06/28/2017--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--CHIPOTLE--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Other Payments--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Cleared--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%---7.50--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--$3232.231--%>
					                                        <%--</td>--%>
					                                    <%--</tr>--%>
					                                    <%--<tr>--%>
					                                        <%--<td>--%>
					                                            <%--06/28/2017--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--VICTOR NUNEZ MOBILE TRANSFER--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Transfer--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Processing--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%---20.00--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--$3212.231--%>
					                                        <%--</td>--%>
					                                    <%--</tr>--%>
					                                    <%--<tr>--%>
					                                        <%--<td>--%>
					                                            <%--06/28/2017--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--TEKBASIC LLC--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Deposit--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Cleared--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--550.00--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--$3712.231--%>
					                                        <%--</td>--%>
					                                    <%--</tr>--%>
														<%--<tr>--%>
					                                        <%--<td>--%>
					                                            <%--06/28/2017--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--CHIPOTLE--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Other Payments--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Cleared--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%---7.50--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--$3232.231--%>
					                                        <%--</td>--%>
					                                    <%--</tr>--%>
					                                    <%--<tr>--%>
					                                        <%--<td>--%>
					                                            <%--06/28/2017--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--VICTOR NUNEZ MOBILE TRANSFER--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Transfer--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Processing--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%---20.00--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--$3212.231--%>
					                                        <%--</td>--%>
					                                    <%--</tr>--%>
					                                    <%--<tr>--%>
					                                        <%--<td>--%>
					                                            <%--06/28/2017--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--TEKBASIC LLC--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Deposit--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Cleared--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--550.00--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--$3712.231--%>
					                                        <%--</td>--%>
					                                    <%--</tr>--%>
														<%--<tr>--%>
					                                        <%--<td>--%>
					                                            <%--06/28/2017--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--CHIPOTLE--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Other Payments--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Cleared--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%---7.50--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--$3232.231--%>
					                                        <%--</td>--%>
					                                    <%--</tr>--%>
					                                    <%--<tr>--%>
					                                        <%--<td>--%>
					                                            <%--06/28/2017--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--VICTOR NUNEZ MOBILE TRANSFER--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Transfer--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Processing--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%---20.00--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--$3212.231--%>
					                                        <%--</td>--%>
					                                    <%--</tr>--%>
					                                    <%--<tr>--%>
					                                        <%--<td>--%>
					                                            <%--06/28/2017--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--TEKBASIC LLC--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Deposit--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Cleared--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--550.00--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--$3712.231--%>
					                                        <%--</td>--%>
					                                    <%--</tr>--%>
														<%--<tr>--%>
					                                        <%--<td>--%>
					                                            <%--06/28/2017--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--CHIPOTLE--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Other Payments--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Cleared--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%---7.50--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--$3232.231--%>
					                                        <%--</td>--%>
					                                    <%--</tr>--%>
					                                    <%--<tr>--%>
					                                        <%--<td>--%>
					                                            <%--06/28/2017--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--VICTOR NUNEZ MOBILE TRANSFER--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Transfer--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Processing--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%---20.00--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--$3212.231--%>
					                                        <%--</td>--%>
					                                    <%--</tr>--%>
					                                    <%--<tr>--%>
					                                        <%--<td>--%>
					                                            <%--06/28/2017--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--TEKBASIC LLC--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Deposit--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--Cleared--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--550.00--%>
					                                        <%--</td>--%>
					                                        <%--<td>--%>
					                                            <%--$3712.231--%>
					                                        <%--</td>--%>
					                                    <%--</tr>--%>
													</tbody>
												</table>
										<!-- END EXAMPLE TABLE PORTLET-->
									</div>
									<div class="tab-pane" id="tab_15_2">
										<p>
											<b>Statements</b>
										</p>
										<br>
										<div class="table-scrollable">
											<table class="table table-striped table-hover">
												<thead>
													<tr>
														<th>
															 Received
														</th>
														<th>
															 Name
														</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															 6/29/2017
														</td>
														<td>
															 <a style="color:blue"><u>June 29, 2017 Statement</u></a>
														</td>
													</tr>
													<tr>
														<td>
															 5/29/2017
														</td>
														<td>
															 <a style="color:blue"><u>May 29, 2017 Statement</u></a>
														</td>
													</tr>
													<tr>
														<td>
															 4/29/2017
														</td>
														<td>
															 <a style="color:blue"><u>April 29, 2017 Statement</u></a>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<!-- END SAMPLE TABLE PORTLET-->
										<!-- <p>
											<a class="btn green" href="ui_tabs_accordions_navs.html#tab_15_2" target="_blank">
											Activate this tab via URL </a>
										</p> -->
									</div>
									<div class="tab-pane" id="tab_15_3">
										<p>
											 <b>Account Details</b>	
										</p>
										<hr>
										<table>
											<thead>
												<tr>
													<th></th>
													<th></th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														<b>Type</b>
													</td>
													<td>&emsp;&emsp;&emsp;</td>
													<td>
														BofA Checking
													</td>
												</tr>
												<tr>
													<td>
														<b>Nickname:</b>
													</td>
													<td>&emsp;&emsp;&emsp;</td>
													<td>
														Kristian
													</td>
												</tr>
												<tr>
													<td>
														<b>Account Number:</b>
													</td>
													<td>&emsp;&emsp;&emsp;</td>
													<td>
														1234567890123456
													</td>
												</tr>
												<tr>
													<td>
														<b>Routing Number:</b>
													</td>
													<td>&emsp;&emsp;&emsp;</td>
													<td>
														021200339 (paper & electronic)
													</td>
												</tr>
												<tr>
													<td></td>
													<td>&emsp;&emsp;&emsp;</td>
													<td>
														026009593 (wires)
													</td>
												</tr>
												<tr>
													<td>
														<b>Account Opened Date:</b>
													</td>
													<td>&emsp;&emsp;&emsp;</td>
													<td>
														4/23/2014
													</td>
												</tr>
											</tbody>
										</table>
										<hr>
										<!-- <p>
											<a class="btn yellow" href="ui_tabs_accordions_navs.html#tab_15_3" target="_blank">
											Activate this tab via URL </a>
										</p> -->
									</div>
								</div>
							</div>
						</div>
					</div>
                </div>
            </div>
            <!-- END PAGE CONTENT INNER -->
        </div>
    </div>
    <!-- END PAGE CONTENT -->
</div>
<!-- END PAGE CONTAINER -->
<jsp:include page="footer.jsp" />
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/table-advanced.js" type="text/javascript"></script>
<script>
    jQuery(document).ready(function() {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        Demo.init(); // init demo features
        TableAdvanced.init();
    });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>



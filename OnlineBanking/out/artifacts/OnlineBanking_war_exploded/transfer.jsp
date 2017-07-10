<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.bank.model.Account" %><%--
  Created by IntelliJ IDEA.
  User: Kristian Lucero
  Date: 6/28/2017
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8">
    <title>Bank | Transfers</title>
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
	<!-- END PAGE LEVEL SCRIPTS -->
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
                <h1>Transfers</h1>
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
							<div class="tabbable-line">
								<ul class="nav nav-tabs ">
									<li class="active">
										<a href="#tab_15_1" data-toggle="tab">
										Between My Accounts</a>
									</li>
									<li>
										<a href="#tab_15_2" data-toggle="tab">
										Send Money to Someone</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tab_15_1">
										<!-- BEGIN FORM-->
										<form action="/OnlineBanking/transfercontrol" class="form-horizontal" method="post">
											<div class="form-body">
												<div class="form-group">
													<label class="col-md-3 control-label">From: </label>
													<div class="col-md-4">
														<div class="input-icon">
															<i class="fa fa-bank"></i>
															<select class="form-control input-circle" name="transfer">
																<%--<option selected value="0">-- Select Account --</option>--%>
																<%--<option value="">Checking - 0932</option>--%>
																<%--<option value="">Savings - 1233</option>--%>
																<%--<option value="">Joint - 8231</option>--%>
																<%
																	Set accounts = (Set)session.getAttribute("accounts");
																	for(Iterator iterator = accounts.iterator();iterator.hasNext();){
																	    Account account = (Account) iterator.next();

																	    out.print("<option value=\""+account.getId()+"\">");
																	    out.print(account.getAccountNumber());
																	    out.print("</option>");
																	}
																%>
																<span class="help-block"> Select from which account
																</span>
															</select>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">To: </label>
													<div class="col-md-4">
														<div class="input-icon">
															<i class="fa fa-bank"></i>
															<select class="form-control input-circle" name="recipient">
																<%
																	for(Iterator iterator = accounts.iterator();iterator.hasNext();){
																		Account account = (Account) iterator.next();

																		out.print("<option value=\""+account.getId()+"\">");
																		out.print(account.getAccountNumber());
																		out.print("</option>");
																	}
																%>
																<span class="help-block"> Select from which account
																</span>
															</select>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">Amount: </label>
													<div class="col-md-4">
														<div class="input-icon">
															<i class="fa fa-dollar"></i>
															<input type="text" class="form-control input-circle" name="amount">
														</div>
													</div>
												</div>
											</div>
											<div class="form-actions">
												<div class="row">
													<div class="col-md-offset-3 col-md-9">
														<button type="submit" class="btn btn-circle blue">Submit</button>
													</div>
												</div>
											</div>
										</form>
										<!-- END FORM-->
									</div>
									<div class="tab-pane" id="tab_15_2">
										<!-- BEGIN FORM-->
										<form action="" method="POST" class="form-horizontal">
											<div class="form-body">
												<div class="form-group">
													<label class="col-md-3 control-label">From: </label>
													<div class="col-md-4">
														<div class="input-icon">
															<i class="fa fa-bank"></i>
															<select class="form-control input-circle" name="sendFromSomeone">
																<option selected value="0">-- Select Account --</option>
																<option value="">Checking - 0932</option>
																<option value="">Savings - 1233</option>
																<option value="">Joint - 8231</option>
																<span class="help-block"> Select from which account
																</span>
															</select>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">To: </label>
													<div class="col-md-4">
														<div class="input-icon">
															<i class="fa fa-user"></i>
															<input type="text" class="form-control input-circle" name="sendToSomeone">
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">Amount: </label>
													<div class="col-md-4">
														<div class="input-icon">
															<i class="fa fa-dollar"></i>
															<input type="text" class="form-control input-circle" name="sendAmountSomeone">
														</div>
													</div>
												</div>
											</div>
											<div class="form-actions">
												<div class="row">
													<div class="col-md-offset-3 col-md-9">
														<button type="submit" class="btn btn-circle blue">Submit</button>
													</div>
												</div>
											</div>
										</form>
										<!-- END FORM-->
										<!-- END SAMPLE TABLE PORTLET-->
										<!-- <p>
											<a class="btn green" href="ui_tabs_accordions_navs.html#tab_15_2" target="_blank">
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
<!-- END PAGE LEVEL PLUGINS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/form-samples.js"></script>

<script>
    jQuery(document).ready(function() {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        Demo.init(); // init demo features
        FormSamples.init();
    });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>



<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.bank.model.Account" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="com.bank.dao.AccountTypeHibernateDAO" %>
<%@ page import="com.bank.model.AccountType" %>
<%@ page import="com.bank.dao.TransactionHibernateDAO" %>
<%@ page import="java.util.List" %><%--
<%--
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
    <title>Bank | Home</title>
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
                <h1>Accounts</h1>
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
                    <!-- BEGIN SAMPLE TABLE PORTLET-->
                    <div class="portlet light">
                        <div class="portlet-body">
                            <div class="table-scrollable table-scrollable-borderless">
                                <table class="table table-hover table-light">
                                    <thead>
                                    <tr class="uppercase">
                                        <th colspan="3">
                                            Account Name
                                        </th>
                                        <th>
                                            Balance
                                        </th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
                                        AccountTypeHibernateDAO accountTypeHibernateDAO = (AccountTypeHibernateDAO) context.getBean("accountTypeDAO");
                                        TransactionHibernateDAO transactionDao = (TransactionHibernateDAO) context.getBean("transactionDAO");
                                        Set set = (Set)session.getAttribute("accounts");

                                        System.out.println(set);
                                        for(Iterator iterator = set.iterator();iterator.hasNext();){
                                            Account account = (Account) iterator.next();
                                            AccountType accountType = (AccountType) accountTypeHibernateDAO.get(account.getAccountTypeId());
                                            List list = transactionDao.list_account_transaction(account.getId());
                                            out.print("<td>");
                                            out.print("<a href =\"account_information?account_id=" + account.getId() +
                                                    "\" class = \"primary-link\">");
                                            out.print(accountType.getAccountType());
                                            out.print("</td>");
                                            out.print("<td>");
                                            out.print(account.getAccountNumber());
                                            out.print("</td>");
                                            out.print("<td></td>");
                                            out.print("<td>");
                                            out.print(account.getBalance());
                                            out.print("</td>");
                                            out.print("                                        <td>\n" +
                                                    "                                            <a data-toggle=\"modal\" onclick=\"toggle("+account.getId()+")\" style=\"color:blue\">Quick View</a>\n" +
                                                    "                                        </td>");
                                            out.print("</tr>");
                                        }
                                    %>
                                    <%--<tr>--%>
                                        <%--<td>--%>
                                            <%--<a href="account_information.jsp" class="primary-link">${sessionScope.accounts}--%>
                                        <%--</td>--%>
                                        <%--<td>--%>
                                            <%--0323--%>
                                        <%--</td>--%>
                                        <%--<td></td>--%>
                                        <%--<td>--%>
                                            <%--$31825.03--%>
                                        <%--</td>--%>
                                        <%--<td>--%>
                                            <%--<a data-toggle="modal" onclick="toggle()" style="color:blue">Quick View</a>--%>
                                        <%--</td>--%>
                                    <%--</tr>--%>
                                    <%--<tr>--%>
                                        <%--<td>--%>
                                            <%--<a href="javascript:;" class="primary-link">Savings--%>
                                        <%--</td>--%>
                                        <%--<td>--%>
                                            <%--0931--%>
                                        <%--</td>--%>
                                        <%--<td></td>--%>
                                        <%--<td>--%>
                                            <%--$82936.71--%>
                                        <%--</td>--%>
                                        <%--<td>--%>
                                            <%--<a data-toggle="modal" href="#stati" style="color:blue">Quick View</a>--%>
                                        <%--</td>--%>
                                    <%--</tr>--%>
                                    <%--<tr>--%>
                                        <%--<td>--%>
                                            <%--<a href="javascript:;" class="primary-link">Joint Account--%>
                                        <%--</td>--%>
                                        <%--<td>--%>
                                            <%--6613--%>
                                        <%--</td>--%>
                                        <%--<td></td>--%>
                                        <%--<td>--%>
                                            <%--$2391.92--%>
                                        <%--</td>--%>
                                        <%--<td>--%>
                                            <%--<a data-toggle="modal" href="#stati" style="color:blue">Quick View</a>--%>
                                        <%--</td>--%>
                                    <%--</tr>--%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- END SAMPLE TABLE PORTLET-->
                </div>
            </div>
            <!-- END PAGE CONTENT INNER -->
        </div>
    </div>
    <!-- END PAGE CONTENT -->
</div>
<!-- MODALS -->
<div id="static" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">Checking - 0323</h4>
            </div>
            <div class="modal-body">
                <!-- BEGIN SAMPLE TABLE PORTLET-->
                <div class="portlet light">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-cogs font-green-sharp"></i>
                            <span class="caption-subject font-green-sharp bold uppercase">Transaction</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="table-scrollable">
                            <table id = "popup" class="table table-striped table-hover">
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
                        </div>
                    </div>
                </div>
                <!-- END SAMPLE TABLE PORTLET-->
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn red">Exit</button>
            </div>
        </div>
    </div>
</div>
<!-- END MODALS -->
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
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>

<script>
    jQuery(document).ready(function() {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        Demo.init(); // init demo features
    });
    function toggle(account_id){
        console.log(account_id);

        $(document).ready(function() {
            $.ajax({
                type:"get",
                accept:"application/json",
                url: "rest/service/transforaccount/"+account_id,
                success:function (data) {
                    $('#popup').find('tbody').find('tr').remove();
                    var transactions = data.entity.entity;
                    $.each(transactions,function(key,val){
                        console.log(key+" "+val);
                        var date = val.date;
                        var amount = val.amount;
                        var description = val.description;
                        var status = val.transactionStatusId;
                        var type = val.transactionTypeId;
                        var availableBalance = val .availableBalance;
                        console.log(val);

                        $('#popup').find('tbody')
                            .append(
                                $('<tr>')
                                    .append($('<td>').text(date))
                                    .append($('<td>').text(amount))
                                    .append($('<td>').text(description))
                                    .append($('<td>').text(status))
                                    .append($('<td>').text(type))
                                    .append($('<td>').text(availableBalance))

                            );
                    });
                    $('#static').modal('toggle');
                    
                }
            }).then(function(data) {

            });
        });

    }
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>



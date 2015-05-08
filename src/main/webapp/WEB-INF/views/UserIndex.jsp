<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%--<%@ page import="java.util.*" %>--%>

<%--<%@ page import="java.text.*" %>--%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户</title>
    <!-- Bootstrap -->
    <link href="stylesheets/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="stylesheets/bootstrap-datetimepicker.min.css" media="screen">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <style type="text/css">
        .table th, .table td {
            text-align: center;
        }

        .table tbody tr td {
            vertical-align: middle;
        }

        .table tbody tr th {
            vertical-align: middle;
        }

        .userInfo {
            width: 70%;
            margin-left: 7%;
        }

        .userInfo th {
            width: 20%;
        }

        .userInfo td {
            width: 50%;
        }

    </style>
    <%@ include file='checklogin.jsp' %>
    <%--<%--%>
    <%--String datetimeNow = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());%>--%>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">用户${user.userid} ,您好！</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">确定</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">更多
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="newFunction.do">个人中心</a></li>
                        <li><a href="newFunction.do">用户设置</a></li>
                        <li class="divider"></li>
                        <li><a href="logout.do">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" class="active"><a href="#">用户管理</a></li>
                <li id="user-info" role="presentation"><a href="#">用户信息</a></li>

                <li id="user-ope3" role="presentation"><a href="#">转账</a></li>
                <%--<li id="user-ope4" role="presentation"><a href="list_transactionInfo.do?pager.curPage=1">查询交易记录</a></li>--%>
                <li id="user-ope4" role="presentation"><a
                        href="list_transactionInfo.do?userid=${user.userid}&curPage=1">查询交易记录</a></li>
                <li id="user-ope2" role="presentation"><a href="list_daikuanlilv.do">查看贷款利率</a></li>
                <li id="user-ope8" role="presentation"><a href="list_cunkuanlilv.do">查看存款利率</a></li>
                <li id="user-ope5" role="presentation"><a href="#">修改个人信息</a></li>
                <li id="user-ope6" role="presentation"><a href="#">修改密码</a></li>
                <li id="user-ope7" role="presentation"><a href="logout.do">注销</a></li>
            </ul>
        </div>
        <div class="col-md-10">

            <div id="user_info">
                <div class="page-header">
                    <h1>用户信息
                        <small></small>
                    </h1>
                </div>
                <table class="table table-bordered table-hover userInfo">

                    <tr>
                        <th>账户：</th>
                        <td>${info.user.username}</td>
                    </tr>
                    <tr>
                        <th>姓名：</th>
                        <td>${info.realname}</td>
                    </tr>
                    <tr>
                        <th>年龄：</th>
                        <td>${info.age}</td>
                    </tr>
                    <tr>
                        <th>性别：</th>
                        <td>${info.sex}</td>
                    </tr>
                    <tr>
                        <th>家庭住址：</th>
                        <td>${info.address}</td>
                    </tr>
                    <tr>
                        <th>联系电话：</th>
                        <td>${info.telephone}</td>
                    </tr>
                    <tr>
                        <th>证件号码：</th>
                        <td>${info.cardid}</td>
                    </tr>
                    <tr>
                        <th>账户余额：</th>
                        <td>${info.user.balance}</td>
                    </tr>

                </table>

            </div>


            <div id="user_ope2">
                <div class="page-header">
                    <h1>贷款利率
                        <small></small>
                    </h1>
                </div>
                <div class="jumbotron">
                    <table class="table table-bordered table-hover">
                        <tr class="active">
                            <th rowspan="2">序号</th>
                            <th rowspan="2">日期</th>
                            <th colspan="2">短期</th>
                            <th colspan="3">中长期</th>
                            <th colspan="2">个人住房公积金贷款</th>
                        </tr>
                        <tr class="active">
                            <th>6个月内(%)</th>
                            <th>6个月至1年(%)</th>
                            <th>一年至三年(%)</th>
                            <th>三年至五年(%)</th>
                            <th>五年以上(%)</th>
                            <th>五年以下(%)</th>
                            <th>五年以上(%)</th>
                        </tr>
                        <c:forEach var="daikuanlilv" varStatus="status" items="${daikuanlilvs}">
                            <tr>
                                <td><c:out value="${status.count}"/></td>
                                <td><c:out value="${daikuanlilv.data}"/></td>
                                <td><c:out value="${daikuanlilv.d6Month}"/></td>

                                <td><c:out value="${daikuanlilv.d6To12}"/></td>
                                <td><c:out value="${daikuanlilv.d12To36}"/></td>
                                <td><c:out value="${daikuanlilv.d36To60}"/></td>
                                <td><c:out value="${daikuanlilv.d60Up}"/></td>
                                <td><c:out value="${daikuanlilv.zf0To60}"/></td>
                                <td><c:out value="${daikuanlilv.zf60Up}"/></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>

            <div id="user_ope8">
                <div class="page-header">
                    <h1>存款利率
                        <small></small>
                    </h1>
                </div>
                <div class="jumbotron">
                    <table class="table table-bordered table-hover">
                        <tr class="active">
                            <th rowspan="2">序号</th>
                            <th rowspan="2">日期</th>
                            <th rowspan="2">活期</th>
                            <th colspan="6">整存整取</th>
                            <th colspan="3">整存整取&nbsp;整存零取&nbsp;存本取息</th>
                            <th rowspan="2">协定存款</th>
                            <th rowspan="2">一天通知存款</th>
                            <th rowspan="2">七天通知存款</th>
                        </tr>
                        <tr class="active">
                            <th>3个月(%)</th>
                            <th>6个月(%)</th>
                            <th>一年(%)</th>
                            <th>二年(%)</th>
                            <th>三年(%)</th>
                            <th>五年(%)</th>
                            <th>一年(%)</th>
                            <th>三年(%)</th>
                            <th>五年(%)</th>
                        </tr>
                        <c:forEach var="cunkuanlilv" varStatus="status" items="${cunkuanlilvs}">
                            <tr>
                                <td><c:out value="${status.count}"/></td>
                                <td><c:out value="${cunkuanlilv.data}"/></td>
                                <td><c:out value="${cunkuanlilv.huoqi}"/></td>
                                <td><c:out value="${cunkuanlilv.zz3M}"/></td>
                                <td><c:out value="${cunkuanlilv.zz6M}"/></td>
                                <td><c:out value="${cunkuanlilv.zz12M}"/></td>
                                <td><c:out value="${cunkuanlilv.zz24M}"/></td>
                                <td><c:out value="${cunkuanlilv.zz36M}"/></td>
                                    <%--<td><c:out value="${cunkuanlilv.zz60M}"/> </td>--%>
                                <td>
                                    <c:if test="${!empty cunkuanlilv.zz60M}">
                                        <c:out value="${cunkuanlilv.zz60M}"/>
                                    </c:if>
                                    <c:if test="${empty cunkuanlilv.zz60M}">
                                        <c:out value="--"/>
                                    </c:if>
                                </td>
                                <td><c:out value="${cunkuanlilv.zl12M}"/></td>
                                <td><c:out value="${cunkuanlilv.zl36M}"/></td>
                                <%--<td><c:out value="${cunkuanlilv.zl60M}"/></td>--%>
                                <td>
                                <c:if test="${!empty cunkuanlilv.zl60M}">
                                    <c:out value="${cunkuanlilv.zl60M}"/>
                                </c:if>
                                <c:if test="${empty cunkuanlilv.zl60M}">
                                    <c:out value="--"/>
                                </c:if>
                                </td>
                                <td><c:out value="${cunkuanlilv.xd}"/></td>
                                <td><c:out value="${cunkuanlilv.tz1D}"/></td>
                                <td><c:out value="${cunkuanlilv.tz7D}"/></td>


                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>


            <div id="user_ope3">
                <div class="page-header">
                    <h1>转账
                        <small></small>
                    </h1>
                </div>
                <form class="form-inline" action="transfer.do" method="post">
                    <%--<form:hidden path="user.userid"/>--%>
                    <div class="form-group">
                        <label for="datetimepicker">转账时间：</label>
                        <input type="text" class="form-control span2" id="datetimepicker" placeholder="存款时间"
                               name="datetime">
                        <%--<form:input type="text" class="form-control span2" id="datetimepicker"--%>
                        <%--placeholder="转账时间" path="log.datetime">--%>
                        <span class="add-on"><i class="icon-th"></i></span>
                    </div>

                    <div class="form-group" action="">
                        <label for="otherid">对方账户：</label>
                        <input type="text" class="form-control" id="otherid" name="otherUserName"
                               placeholder="对方账户">
                    </div>

                    <div class="form-group" action="">
                        <label for="trMoney">转账金额：</label>
                        <input type="number" class="form-control" id="trMoney" name="trMoney" placeholder="转账金额"
                               value="转账金额">
                    </div>


                    <button id="bt-transfor" type="submit" class="btn btn-primary" value="转账提交">转账</button>
                </form>
            </div>


            <div id="user_ope4">
                <div class="page-header">
                    <h1>查询交易记录
                        <small></small>
                    </h1>
                </div>
                <div class="jumbotron">
                    <table class="table table-bordered table-hover">
                        <tr class="active">
                            <th colspan="5">交易记录</th>
                        </tr>
                        <tr class="active">
                            <th>序号</th>
                            <th>对方账户</th>
                            <th>交易金额</th>
                            <th>交易类型</th>
                            <th>交易日期</th>
                        </tr>
                        <%--<c:forEach var="log" varStatus="status" items="${logs}">--%>
                        <%--<tr>--%>
                        <%--<th><c:out value="#status.count"/></th>--%>
                        <%--<c:if test="${log.otherid}==${log.user.userid}&&${log.transactionType.name}!='取款'">--%>
                        <%--<th><c:out value="${log.user.userid}"/></th>--%>
                        <%--<th><c:out value="${log.trMoney}"/></th>--%>
                        <%--</c:if>--%>
                        <%--<c:otherwise>--%>
                        <%--<th><c:out value="${log.otherid}"/></th>--%>
                        <%--<th>-<c:out value="${log.trMoney}"/></th>--%>
                        <%--</c:otherwise>--%>
                        <%--<th><c:out value="${log.transactionType.name}"/></th>--%>
                        <%--<th>&nbsp;<c:out value="${log.datetime}"/></th>--%>
                        <c:forEach var="log" varStatus="status" items="${logs}">
                            <tr>
                                <td><c:out value="${status.count}"/></td>
                                    <%--<c:when test="${log.otherid}==${log.user.userid}&&${log.transactionType.name}!='取款'">--%>
                                    <%--<td><c:out value="${log.user.userid}"/></td>--%>
                                    <%--<td><c:out value="${log.trMoney}"/></td>--%>
                                    <%--</c:when>--%>
                                    <%--<c:otherwise>--%>
                                    <%--<td><c:out value="${log.user.username}"/></td>--%>
                                <td><c:out value="${log.otherName}"/></td>
                                <c:choose>
                                    <c:when test="${log.transactionType.name=='取款'}">
                                        <td>-<c:out value="${log.trMoney}"/></td>
                                    </c:when>
                                    <c:when test="${log.transactionType.name=='转出'}">
                                        <td>-&nbsp;<c:out value="${log.trMoney}"/></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>+&nbsp;<c:out value="${log.trMoney}"/></td>
                                    </c:otherwise>
                                </c:choose>
                                    <%--</c:otherwise>--%>
                                <td><c:out value="${log.transactionType.name}"/></td>
                                <td><c:out value="${log.datetime}"/></td>
                            </tr>
                        </c:forEach>
                    </table>

                    <nav>
                        <ul class="pager">
                            <c:if test="${pager.curPage>1}">
                                <li><a href='list_transactionInfo.do?curPage=1&userid=${user.userid}'>首页</a>
                                </li>
                                <li>
                                    <a href='list_transactionInfo.do?curPage=${pager.curPage-1 }&userid=${user.userid}'>上一页</a>
                                </li>
                            </c:if>


                            <c:if test="${pager.curPage<pager.pageCount}">
                                <li>
                                    <a href='list_transactionInfo.do?curPage=${pager.curPage+1}&userid=${user.userid}'>下一页</a>
                                </li>
                                <li>
                                    <a href='list_transactionInfo.do?curPage=${pager.pageCount }&userid=${user.userid}'>尾页</a>
                                </li>
                            </c:if>


                            共${pager.curPage}/${pager.pageCount}页

                            转至 <select onchange="_select()" id="curPage" class="input-sm">
                            <c:forEach begin="1" end="${pager.pageCount}" varStatus="status">
                                <c:choose>
                                    <c:when test="${status.count==pager.curPage}">
                                        <option value="${status.count}"
                                                selected="selected">${status.count }</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${status.count }">${status.count } </option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>页

                        </ul>
                    </nav>
                </div>
            </div>


            <div id="user_ope5">
                <div class="page-header">
                    <h1>修改个人信息
                        <small></small>
                    </h1>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-7 col-md-offset-1">
                            <form class="form-horizontal" action="modify.do" method="post">


                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">姓名：</label>

                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="name" value="${info.realname} "
                                               name="realname">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="age" class="col-sm-2 control-label">年龄：</label>

                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="age" value="${info.age}" name="age">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="sex" class="col-sm-2 control-label">性别：</label>

                                    <div class="col-sm-2">
                                        <select class="form-control" id="sex" value="${info.sex}" name="sex">
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="adress" class="col-sm-2 control-label">家庭住址：</label>

                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="adress" value="${info.address}"
                                               name="address">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="telephone" class="col-sm-2 control-label">联系电话：</label>

                                    <div class="col-sm-6">
                                        <input type="tel" class="form-control" id="telephone"
                                               value="${info.telephone}" name="telephone">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="idcode" class="col-sm-2 control-label">证件号码：</label>

                                    <div class="col-sm-6">
                                        <input type="number" class="form-control" id="idcode" value="${info.cardid}"
                                               name="cardid">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-primary" value="开户提交">提交</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div id="user_ope6">
                <div class="page-header">
                    <h1>修改密码
                        <small></small>
                    </h1>
                </div>
                <form class="form-inline" action="changeUserPwd.do" method="post">
                    <%--<form:hidden path="user.userid"/>--%>
                    <div class="form-group">
                        <label for="currentPassword">当前密码：</label>
                        <input type="password" class="form-control span2" id="currentPassword" name="oldpwd">
                        <span class="add-on"><i class="icon-th"></i></span>
                    </div>

                    <div class="form-group" action="">
                        <label for="newPassword">新密码：</label>
                        <input type="password" class="form-control" id="newPassword" name="newpwd">
                    </div>

                    <div class="form-group" action="">
                        <label for="confirmPassword">确认密码：</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmpwd">
                    </div>


                    <button type="submit" class="btn btn-primary">提交</button>
                </form>
            </div>

        </div>
    </div>
</div>
<script src="js/jquery-1.11.2.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
    $(".col-md-10>div").hide();
    $("#user_info").show();

    $("#user-info").click(function () {
        $(".col-md-10>div").hide();
        $("#user_info").show();
    });
    $("#user-ope2").click(function () {
        $(".col-md-10>div").hide();
        $("#user_ope2").show();
    });

    // 点击导航1
    $("#user-ope3").click(function () {
        var now = new Date().Format("yyyy-MM-dd hh:mm");
        $(".col-md-10>div").hide();
        $("#user_ope3").show();
        $("#datetimepicker").val(now);
    });
    $("#user-ope4").click(function () {
        $(".col-md-10>div").hide();
        $("#user_ope4").show();
    });
    $("#user-ope5").click(function () {
        $(".col-md-10>div").hide();
        $("#user_ope5").show();
    });
    $("#user-ope6").click(function () {
        $(".col-md-10>div").hide();
        $("#user_ope6").show();
    });
    $("#user-ope8").click(function () {
        $(".col-md-10>div").hide();
        $("#user_ope8").show();
    });
</script>
<!-- 获取时间赋值到输入框中 -->
<script type="text/javascript">
    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
</script>

<!-- 日历组件 -->
<script type="text/javascript">
    $('#datetimepicker').datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        pickerPosition: "bottom-right"
    });
    // $('#datetimepicker-withdraw').datetimepicker({
    //     language: 'zh-CN',
    //     weekStart: 1,
    //     todayBtn: 1,
    //     autoclose: 1,
    //     todayHighlight: 1,
    //     startView: 2,
    //     minView: 2,
    //     forceParse: 0,
    //     pickerPosition: "bottom-right"
    // });
    // $('#datetimepicker-transfer').datetimepicker({
    //     language: 'zh-CN',
    //     weekStart: 1,
    //     todayBtn: 1,
    //     autoclose: 1,
    //     todayHighlight: 1,
    //     startView: 2,
    //     minView: 2,
    //     forceParse: 0,
    //     pickerPosition: "bottom-right"
    // });
</script>
<!-- 点击button后获取时间 -->
<script type="text/javascript">
    $("#bt-transfor").click(function () {
        var now = new Date().Format("yyyy-MM-dd hh:mm:ss");
        $("#datetimepicker").val(now);
    })
</script>


<script type="text/javascript">//
<c:if test="${!empty message}">
<c:choose>
<c:when test="${message=='show_list'}">
$(".col-md-10>div").hide();
$("#user_ope4").show();
</c:when>
<c:when test="${message=='list_daikuanlilv_show'}">
$(".col-md-10>div").hide();
$("#user_ope2").show();
</c:when>
<c:when test="${message=='list_cunkuanlilv_show'}">
$(".col-md-10>div").hide();
$("#user_ope8").show();
</c:when>

<%--<c:when test="${message=='transfer_succ'}">--%>
<%--alert("转账成功！");--%>
<%--</c:when>--%>

<%--<c:when test="${message=='transfer_fail'}">--%>
<%--alert("转账金额不足，请检查您的账户余额！");--%>
<%--</c:when>--%>

<%--<c:when test="${message=='otheruserNull'}">--%>
<%--alert("对方账号不存在，请重新输入！");--%>
<%--</c:when>--%>

<%--<c:when test="${message=='otheruserFrozen'}">--%>
<%--alert("对方账号已被冻结，无法进行转账！");--%>
<%--</c:when>--%>
<%--<c:when test="${message=='modify_succ'}">--%>
<%--alert("信息修改成功！");--%>
<%--</c:when>--%>
<%--<c:when test="${message=='modify_fail'}">--%>
<%--alert("信息修改失败！");--%>
<%--</c:when>--%>
<%--<c:when test="${message=='changepwd_wrong'}">--%>
<%--alert("密码修改失败，当前密码不正确！");--%>
<%--</c:when>--%>
<%--<c:when test="${message=='confirmpwd_rong'}">--%>
<%--alert("密码修改失败，两次输入的密码不一样！");--%>
<%--</c:when>--%>
<%--<c:when test="${message=='changepassword_succ！'}">--%>
<%--alert("密码修改成功！");--%>
<%--</c:when>--%>
<%--<c:when test="${message=='changepassword_fail！'}">--%>
<%--alert("密码修改失败！");--%>
<%--</c:when>--%>

<c:otherwise>
alert("${message}");
</c:otherwise>
</c:choose>
</c:if>
</script>
<script type="text/javascript">
    function _select() {
        var curPage = document.getElementById("curPage").value;
        location.href = "list_transactionInfo.do?curPage=" + curPage + "&userid=${user.userid}";
    }
</script>
</body>
</html>
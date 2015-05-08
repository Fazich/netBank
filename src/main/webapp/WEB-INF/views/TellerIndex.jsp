<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>业务员</title>
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
        .table th, .table td, .table tr td{
            text-align: center;
        }
        .table tbody tr td{
            vertical-align: middle;
        }
    </style>
    <%@ include file='checklogin.jsp' %>
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
            <a class="navbar-brand" href="#">业务员${teller.id}，您好！</a>
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
                <li role="presentation" class="active"><a href="#">业务操作</a></li>
                <li id="back-ope1" role="presentation"><a href="#">存款</a></li>
                <li id="back-ope2" role="presentation"><a href="#">取款</a></li>
                <li id="back-ope6" role="presentation"><a href="#">开户</a></li>
                <li id="back-ope3" role="presentation"><a href="list_Users.do?statusId=0">所有账户</a></li>
                <li id="back-ope4" role="presentation"><a href="list_Users.do?statusId=2">已冻结账户</a></li>
                <li id="back-ope5" role="presentation"><a href="list_Users.do?statusId=1">已启用账户</a></li>

                <li id="back-ope7" role="presentation"><a href="#">修改密码</a></li>
                <li id="back-ope8" role="presentation"><a href="logout.do">注销</a></li>
            </ul>
        </div>
        <div class="col-md-10">


            <div id="back_ope1" style="display:none">
                <div class="page-header">
                    <h1>存款
                        <small></small>
                    </h1>
                </div>
                <form class="form-inline panel-body" action="deposit.do" method="post">
                    <div class="form-inline panel-body" action="" method="">
                        <div class="form-group">
                            <label for="datetimepicker-deposit">存款时间：</label>
                            <input type="text" class="form-control span2" id="datetimepicker-deposit" placeholder="存款时间"
                                   name="datetime">
                            <span class="add-on"><i class="icon-th"></i></span>
                        </div>
                        <div class="form-group" action="" method="">
                            <label for="depositAmount">存款金额：</label>
                            <input type="text" class="form-control" id="depositAmount" placeholder="存款金额"
                                   name="trMoney">
                        </div>
                    </div>

                    <div class="form-inline panel-body" action="" method="">
                        <div class="form-group">
                            <label for="userUser">用户账号：</label>
                            <input type="text" class="form-control span2" id="userUser" name="username">
                            <span class="add-on"><i class="icon-th"></i></span>
                        </div>
                        <div class="form-group" action="" method="">
                            <label for="userPassword">用户密码：</label>
                            <input type="password" class="form-control" id="userPassword" name="password">
                        </div>

                        <button id="bt-deposit" type="submit" class="btn btn-primary" value="存款提交">存款</button>
                    </div>
                </form>
            </div>

            <div id="back_ope2" style="display:none">
                <div class="page-header">
                    <h1>取款
                        <small></small>
                    </h1>
                </div>
                <form class="form-inline panel-body" action="withdrawal.do" method="post">
                    <div class="form-inline panel-body" action="" method="">
                        <div class="form-group">
                            <label for="datetimepicker-withdraw">取款时间：</label>
                            <input type="text" class="form-control span2" id="datetimepicker-withdraw"
                                   placeholder="取款时间"
                                   value="取款时间" name="datetime">
                            <span class="add-on"><i class="icon-th"></i></span>
                        </div>
                        <div class="form-group" action="">
                            <label for="withdrawAmount">取款金额：</label>
                            <input type="text" class="form-control" id="withdrawAmount" placeholder="取款金额"
                                   name="trMoney">
                        </div>
                    </div>
                    <div class="form-inline panel-body" action="" method="">
                        <div class="form-group">
                            <label for="userUser2">用户账号：</label>
                            <input type="text" class="form-control span2" id="userUser2" name="username">
                            <span class="add-on"><i class="icon-th"></i></span>
                        </div>
                        <div class="form-group" action="" method="">
                            <label for="userPassword2">用户密码：</label>
                            <input type="password" class="form-control" id="userPassword2" name="password">
                        </div>
                        <button id="bt-withdraw" type="submit" class="btn btn-primary" value="取款提交">取款</button>
                    </div>
                </form>
            </div>

            <div id="back_ope3" style="display:none">
                <div class="page-header">
                    <h1>所有账户
                        <small></small>
                    </h1>
                </div>
                <div class="jumbotron">
                    <form class="form-inline" action="user_search.do" method="post">
                        <div class="form-group panel-body">
                            <label for="exampleInputName2">请输入查询用户的真实姓名：</label>
                            <input type="text" class="form-control" id="exampleInputName2"
                                   name="realname">
                            <input type="hidden" name="statusId" value="0"/>
                            <button type="submit" class="btn btn-primary">提交</button>
                        </div>
                    </form>
                    <table class="table table-bordered table-hover">
                        <tr class="table-hover">
                            <th>序列</th>
                            <th>账户</th>
                            <th>用户名</th>
                            <th>账户余额</th>
                            <th>姓名</th>
                            <th>详细地址</th>
                            <th>身份证号</th>
                            <th>电话</th>
                            <th>状态</th>
                            <th>操作</th>
                            <th>删除</th>
                        </tr>


                        <c:forEach var="user" varStatus="status" items="${users}">
                            <tr>
                                <td><c:out value="${status.count}"/></td>


                                <td><c:out value="${user.user.userid}"/></td>
                                <td><c:out value="${user.user.username}"/></td>
                                <td><c:out value="${user.user.balance}"/></td>
                                <td><c:out value="${user.realname}"/></td>
                                <td><c:out value="${user.address}"/></td>
                                <td><c:out value="${user.cardid}"/></td>
                                <td><c:out value="${user.telephone}"/></td>
                                <td><c:out value="${user.user.status.name}"/></td>
                                    <%--<td>--%>
                                    <%--<div>--%>
                                    <%--<input type="button" value="冻结"--%>
                                    <%--onclick="javascript:location.href='locking.do?userid=${user.userid}'">--%>
                                    <%--</div>--%>
                                    <%--</td>--%>
                                <td>
                                    <c:choose>
                                        <c:when test="${user.user.status.name eq'启用'}">
                                            <input class="btn btn-danger" type="button" value="冻结"
                                                   onclick="javascript:location.href='locking.do?userid=${user.user.userid}'">
                                        </c:when>
                                        <c:when test="${user.user.status.name eq'冻结'}">
                                            <input class="btn btn-success" type="button" value="启用"
                                                   onclick="javascript:location.href='enabled.do?userid=${user.user.userid}'">
                                        </c:when>
                                    </c:choose>
                                </td>
                                    <%--<td><input id="z1" type="button" value="zzm" style="width:100%;height:100%"--%>
                                    <%--onclick="javascript:window.location.href='locking.do?userid=${user.userid}'">--%>

                                <td>
                                    <div>
                                        <a href="delUser.do?userid=${user.user.userid}">
                                            &nbsp;删除&nbsp;</a>
                                    </div>
                                </td>

                                    <%--<td><c:out value="${user.user.status.name}"/></td>--%>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </div>

            <div id="back_ope4" style="display:none">
                <div class="page-header">
                    <h1>已冻结账户
                        <small></small>
                    </h1>
                </div>
                <div class="jumbotron">
                    <form class="form-inline" action="user_search.do" method="post">
                        <div class="form-group panel-body">
                            <label for="exampleInputName3">请输入查询用户的真实姓名：</label>
                            <input type="text" class="form-control" id="exampleInputName3" name="realname">
                            <input type="hidden" name="statusId" value="2"/>
                            <button type="submit" class="btn btn-primary">提交</button>
                        </div>
                    </form>
                    <table class="table table-bordered table-hover">
                        <tr class="table-hover">
                            <th>序列</th>
                            <th>账户</th>
                            <th>用户名</th>
                            <th>账户余额</th>
                            <th>姓名</th>
                            <th>详细地址</th>
                            <th>身份证号</th>
                            <th>电话</th>
                            <th>状态</th>
                            <th>操作</th>
                            <th>删除</th>
                        </tr>
                        <c:forEach var="user" varStatus="status" items="${users}">
                            <tr>
                                <td><c:out value="${status.count}"/></td>


                                <td><c:out value="${user.user.userid}"/></td>
                                <td><c:out value="${user.user.username}"/></td>
                                <td><c:out value="${user.user.balance}"/></td>
                                <td><c:out value="${user.realname}"/></td>
                                <td><c:out value="${user.address}"/></td>
                                <td><c:out value="${user.cardid}"/></td>
                                <td><c:out value="${user.telephone}"/></td>
                                <td><c:out value="${user.user.status.name}"/></td>
                                    <%--<td>--%>
                                    <%--<div>--%>
                                    <%--<input type="button" value="冻结"--%>
                                    <%--onclick="javascript:location.href='locking.do?userid=${user.userid}'">--%>
                                    <%--</div>--%>
                                    <%--</td>--%>
                                <td>
                                    <c:choose>
                                        <c:when test="${user.user.status.name eq'启用'}">
                                            <input class="btn btn-danger" class="btn btn-danger"
                                                   class="btn btn-success" type="button" value="冻结"
                                                   onclick="javascript:location.href='locking.do?userid=${user.user.userid}'">
                                        </c:when>
                                        <c:when test="${user.user.status.name eq'冻结'}">
                                            <input class="btn btn-success" class="btn btn-danger"
                                                   class="btn btn-success" type="button" value="启用"
                                                   onclick="javascript:location.href='enabled.do?userid=${user.user.userid}'">
                                        </c:when>
                                    </c:choose>
                                </td>
                                    <%--<td><input id="z1" type="button" value="zzm" style="width:100%;height:100%"--%>
                                    <%--onclick="javascript:window.location.href='locking.do?userid=${user.userid}'">--%>

                                <td>
                                    <div>
                                        <a href="del.do?userid=${user.user.userid}">
                                            &nbsp;删除&nbsp;</a>
                                    </div>
                                </td>

                                    <%--<td><c:out value="${user.user.status.name}"/></td>--%>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </div>

            <div id="back_ope5" style="display:none">
                <div class="page-header">
                    <h1>已启用账户
                        <small></small>
                    </h1>
                </div>
                <div class="jumbotron">
                    <form class="form-inline" action="user_search.do" method="post">
                    <div class="form-group panel-body">
                        <label for="exampleInputName4">请输入查询用户的真实姓名：</label>
                        <input type="text" class="form-control" id="exampleInputName4" name="realname">
                        <input type="hidden" name="statusId" value="1"/>
                        <button type="submit" class="btn btn-primary" value="查询启用用户提交">提交</button>
                    </div>
                    </form>
                    <table class="table table-bordered table-hover">
                        <tr class="table-hover">
                            <th>序列</th>
                            <th>账户</th>
                            <th>用户名</th>
                            <th>账户余额</th>
                            <th>姓名</th>
                            <th>详细地址</th>
                            <th>身份证号</th>
                            <th>电话</th>
                            <th>状态</th>
                            <th>操作</th>
                            <th>删除</th>
                        </tr>
                        <c:forEach var="user" varStatus="status" items="${users}">
                            <tr>
                                <td><c:out value="${status.count}"/></td>


                                <td><c:out value="${user.user.userid}"/></td>
                                <td><c:out value="${user.user.username}"/></td>
                                <td><c:out value="${user.user.balance}"/></td>
                                <td><c:out value="${user.realname}"/></td>
                                <td><c:out value="${user.address}"/></td>
                                <td><c:out value="${user.cardid}"/></td>
                                <td><c:out value="${user.telephone}"/></td>
                                <td><c:out value="${user.user.status.name}"/></td>
                                    <%--<td>--%>
                                    <%--<div>--%>
                                    <%--<input type="button" value="冻结"--%>
                                    <%--onclick="javascript:location.href='locking.do?userid=${user.userid}'">--%>
                                    <%--</div>--%>
                                    <%--</td>--%>
                                <td>
                                    <c:choose>
                                        <c:when test="${user.user.status.name eq'启用'}">
                                            <input class="btn btn-danger"
                                                   class="btn btn-success" type="button" value="冻结"
                                                   onclick="javascript:location.href='locking.do?userid=${user.user.userid}'">
                                        </c:when>
                                        <c:when test="${user.user.status.name eq'冻结'}">
                                            <input class="btn btn-danger"
                                                   class="btn btn-success" type="button" value="启用"
                                                   onclick="javascript:location.href='enabled.do?userid=${user.user.userid}'">
                                        </c:when>
                                    </c:choose>
                                </td>
                                    <%--<td><input id="z1" type="button" value="zzm" style="width:100%;height:100%"--%>
                                    <%--onclick="javascript:window.location.href='locking.do?userid=${user.userid}'">--%>

                                <td>
                                    <div>
                                        <a href="del.do?userid=${user.user.userid}">
                                            &nbsp;删除&nbsp;</a>
                                    </div>
                                </td>

                                    <%--<td><c:out value="${user.user.status.name}"/></td>--%>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </div>

            <div id="back_ope6" style="display:none">
                <div class="page-header">
                    <h1>开户
                        <small></small>
                    </h1>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-7 col-md-offset-1">
                            <form class="form-horizontal" action="addUser.do" method="post">
                                <div class="form-group">
                                    <label for="userName" class="col-sm-2 control-label">用户名：</label>

                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="userName" name="username">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">密码：</label>

                                    <div class="col-sm-6">
                                        <input type="password" class="form-control" id="password" name="password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="passwordConfirm" class="col-sm-2 control-label">确认密码：</label>

                                    <div class="col-sm-6">
                                        <input type="password" class="form-control" id="passwordConfirm">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="userAmount" class="col-sm-2 control-label">开户金额：</label>

                                    <div class="col-sm-6">
                                        <input type="number" class="form-control" id="userAmount" name="balance">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">姓名：</label>

                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="name" name="realname">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="age" class="col-sm-2 control-label">年龄：</label>

                                    <div class="col-sm-6">
                                        <input type="number" class="form-control" id="age" name="age">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="sex" class="col-sm-2 control-label">性别：</label>

                                    <div class="col-sm-2">
                                        <select class="form-control" id="sex" name="sex">
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="address" class="col-sm-2 control-label">家庭住址：</label>

                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="address" name="address">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="telephone" class="col-sm-2 control-label">联系电话：</label>

                                    <div class="col-sm-6">
                                        <input type="number" class="form-control" id="telephone" name="telephone">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="idcode" class="col-sm-2 control-label">证件号码：</label>

                                    <div class="col-sm-6">
                                        <input type="number" class="form-control" id="idcode" name="cardid">
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

            <div id="back_ope7" style="display:none">
                <div class="page-header">
                    <h1>修改密码
                        <small></small>
                    </h1>
                </div>
                <form class="form-inline" action="transfer.do" method="post">
                    <%--<form:hidden path="user.userid"/>--%>
                    <div class="form-group">
                        <label for="currentPassword">当前密码：</label>
                        <input type="password" class="form-control span2" name="currentPassword" id="currentPassword">
                        <span class="add-on"><i class="icon-th"></i></span>
                    </div>

                    <div class="form-group" action="">
                        <label for="newPassword">新密码：</label>
                        <input type="password" class="form-control" id="newPassword" name="otherid" path="newPassword">
                    </div>

                    <div class="form-group" action="">
                        <label for="confirmPassword">确认密码：</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword">
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
<!-- 选项卡 -->
<script type="text/javascript">
    $(".col-md-10>div").hide();
    $("#back_ope1").show();
    // 点击导航1
    $("#back-ope1").click(function () {
        var now = new Date().Format("yyyy-MM-dd hh:mm");
        $(".col-md-10>div").hide();
        $("#back_ope1").show();
        $("#datetimepicker-deposit").val(now);
    });
    $("#back-ope2").click(function () {
        var now = new Date().Format("yyyy-MM-dd hh:mm");
        $(".col-md-10>div").hide();
        $("#back_ope2").show();
        $("#datetimepicker-withdraw").val(now);
    });
    $("#back-ope3").click(function () {
        $(".col-md-10>div").hide();
        $("#back_ope3").show();
    });
    $("#back-ope4").click(function () {
        $(".col-md-10>div").hide();
        $("#back_ope4").show();
    });
    $("#back-ope5").click(function () {
        $(".col-md-10>div").hide();
        $("#back_ope5").show();
    });
    $("#back-ope6").click(function () {
        $(".col-md-10>div").hide();
        $("#back_ope6").show();
    });
    $("#back-ope7").click(function () {
        $(".col-md-10>div").hide();
        $("#back_ope7").show();
    });
</script>
<!-- 日历控件 -->
<script type="text/javascript">
    $('#datetimepicker-deposit').datetimepicker({
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
    $('#datetimepicker-withdraw').datetimepicker({
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
    $('#datetimepicker-transfer').datetimepicker({
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
<!-- 点击button后获取时间 -->
<script type="text/javascript">
    $("#bt-deposit,#bt-withdraw").click(function () {
        var now = new Date().Format("yyyy-MM-dd hh:mm:ss");
        $("#datetimepicker-deposit,#datetimepicker-withdraw").val(now);
    })
</script>

<script type="text/javascript">//
<c:if test="${!empty message}">
<c:choose>
<c:when test="${message=='list_Users_show1'}">
$(".col-md-10>div").hide();
$("#back_ope5").show();
</c:when>

<c:when test="${message=='list_Users_show0'}">
$(".col-md-10>div").hide();
$("#back_ope3").show();
</c:when>

<c:when test="${message=='list_Users_show2'}">
$(".col-md-10>div").hide();
$("#back_ope4").show();
</c:when>

<c:otherwise>
alert("${message}");
</c:otherwise>
</c:choose>
</c:if>
</script>
</body>
</html>
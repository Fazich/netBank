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
    <title>管理员</title>
    <!-- Bootstrap -->
    <link href="stylesheets/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="stylesheets/bootstrap-datetimepicker.min.css" media="screen">
    <!-- <link rel="stylesheet" type="text/css" href="stylesheets/flat-ui.css"> -->
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
            <a class="navbar-brand" href="#">管理员${manager.id}，您好！</a>
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-expanded="false">更多<span class="caret"></span></a>
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
                <li role="presentation" class="active"><a href="#">管理员</a></li>
                <li id="manager-ope1" role="presentation"><a href="#">新增业务员</a></li>
                <li id="manager-ope2" role="presentation"><a href="list_Tellers.do">所有业务员</a></li>
                <li id="manager-ope3" role="presentation"><a href="list_daikuanlilv_ByManager.do">调整贷款利率</a></li>
                <li id="manager-ope4" role="presentation"><a href="list_cunkuanlilv_ByManager.do">调整存款利率</a></li>
                <li id="manager-ope5" role="presentation"><a href="logout.do">注销</a></li>
            </ul>
        </div>
        <div class="col-md-10">


            <div id="manager_ope1">
                <div class="page-header">
                    <h1>新增业务员
                        <small></small>
                    </h1>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-7 col-md-offset-1">
                            <form class="form-horizontal" action="addTeller.do" method="post">

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
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-primary" value="提交">提交</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div id="manager_ope2">
                <div class="page-header">
                    <h1>所有业务员
                        <small></small>
                    </h1>
                </div>
                <div class="jumbotron">
                    <form class="form-inline" action="list_Tellers.do" method="post">
                        <div class="form-group panel-body">
                            <label for="exampleInputName2">请输入查询用户的真实姓名：</label>
                            <input type="text" class="form-control" id="exampleInputName2" value="查询所有用户">
                            <button type="submit" class="btn btn-primary">提交</button>
                        </div>
                    </form>
                    <table class="table table-bordered table-hover">
                        <tr class="active">
                            <th colspan="5">业务员</th>
                        </tr>
                        <tr class="active">
                            <th>序号</th>
                            <th>工号</th>
                            <th>账号</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach var="teller" varStatus="status" items="${tellers}">
                            <tr>
                                <td><c:out value="${status.count}"/></td>


                                <td><c:out value="${teller.id}"/></td>
                                <td><c:out value="${teller.username}"/></td>

                                <td>
                                        <%--<div>--%>
                                        <%--<a href="delteller.do?tellerid=${teller.id}">--%>
                                        <%--&nbsp;删除&nbsp;</a>--%>
                                        <%--</div>--%>
                                    <input class="btn btn-danger" class="btn btn-danger"
                                           class="btn btn-success" type="button" value="删除"
                                           onclick="javascript:location.href='delteller.do?tellerid=${teller.id}'">
                                </td>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </div>

            <div id="loanModification">
                <div class="page-header">
                    <c:if test="${0== modifingDaikuanlilv.id}">
                        <h1>新增贷款利率
                            <small></small>
                        </h1>
                    </c:if>
                    <c:if test="${0!= modifingDaikuanlilv.id}">
                        <h1>修改贷款利率
                            <small></small>
                        </h1>
                    </c:if>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-9 col-md-offset-1">
                            <form class="form-horizontal" action="addDaikuanlilv.do" method="post">
                                <input type="hidden" name="id" value="${modifingDaikuanlilv.id}">

                                <div class="form-group">
                                    <%--<label for="datetime" class="col-sm-3 control-label">日期：</label>--%>
                                    <label for="date" class="col-sm-3 control-label">日期:</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="date"
                                               value="${modifingDaikuanlilv.data}" name="data">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="sixmonth" class="col-sm-3 control-label">6个月内(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="sixmonth2" name="d6Month"
                                               value="${modifingDaikuanlilv.d6Month}">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="sixToOne" class="col-sm-3 control-label">6个月至1年(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="sixToOne2"
                                               value="${modifingDaikuanlilv.d6To12}" name="d6To12">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="oneTothree" class="col-sm-3 control-label">一年至三年(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="oneTothree2"
                                               value="${modifingDaikuanlilv.d12To36}"
                                               name="d12To36">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="threeTofive" class="col-sm-3 control-label">三年至五年(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="threeTofive1" name="d36To60"
                                               value="${modifingDaikuanlilv.d36To60}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="fiveUp" class="col-sm-3 control-label">五年以上(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="fiveUp3" name="d60Up"
                                               value="${modifingDaikuanlilv.d60Up}"
                                                >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="fiveDown" class="col-sm-3 control-label">住房公积金五年以下(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="fiveDown2" v
                                               name="zf0To60" value="${modifingDaikuanlilv.zf0To60}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Fiveup" class="col-sm-3 control-label">住房公积金五年以上(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="Fiveup5"
                                               name="zf60Up" value="${modifingDaikuanlilv.zf60Up}">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button id="btn" type="submit" class="btn btn-primary" value="">提交</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div id="manager_ope3">
                <div class="page-header">
                    <h1>贷款利率
                        <small></small>
                    </h1>
                </div>
                <div class="jumbotron">
                    <table class="table table-bordered table-hover">
                        <tr class="active">
                            <th rowspan="2">序号</th>
                            <th rowspan="2">&nbsp;&nbsp;日期:&nbsp;&nbsp;</th>
                            <th colspan="2">短期</th>
                            <th colspan="3">中长期</th>
                            <th colspan="2">个人住房公积金贷款</th>
                            <th colspan="3">操作</th>
                        </tr>
                        <tr class="active">
                            <th>6个月内(%)</th>
                            <th>6个月至1年(%)</th>
                            <th>一年至三年(%)</th>
                            <th>三年至五年(%)</th>
                            <th>五年以上(%)</th>
                            <th>五年以下(%)</th>
                            <th>五年以上(%)</th>
                            <th>新增</th>
                            <th>修改</th>
                            <th>删除</th>
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
                                <td>
                                    <button id="loanDel" class="btn btn-success"
                                            onclick="javascript:location.href='toModifyDai.do?'">新增
                                    </button>
                                </td>

                                <td>
                                    <button id="loanDel" class="btn btn-warning"
                                            onclick="javascript:location.href='toModifyDai.do?daiid=${daikuanlilv.id}'">
                                        修改
                                    </button>
                                </td>
                                <td>
                                    <button id="loanMod" class="btn btn-danger"
                                            onclick="javascript:location.href='delDai.do?daiid=${daikuanlilv.id}'">删除
                                    </button>
                                </td>

                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>


            <div id="depositModification">
                <div class="page-header">
                    <c:if test="${0== modifingCunkuanlilv.id}">
                        <h1>新增存款利率
                            <small></small>
                        </h1>
                    </c:if>
                    <c:if test="${0!= modifingCunkuanlilv.id}">
                        <h1>修改存款利率
                            <small></small>
                        </h1>
                    </c:if>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-11 col-md-offset-1">
                            <form class="form-horizontal" action="addCunkuanlilv.do" method="post">


                                <div class="form-group">
                                    <%--<label for="datetime-ope4" class="col-sm-2 control-label">日期：</label>--%>
                                    <label for="data" class="col-sm-2 control-label">日期:</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" value="" name="data">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="sixmonth" class="col-sm-2 control-label">活期(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="sixmonth" value="" name="huoqi">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="sixmonth" class="col-sm-2 control-label">整整存取3个月内(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="sixmonth" name="zz3M">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="sixToOne" class="col-sm-2 control-label">整整存取6个月内(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="sixToOne"
                                               name="zz6M">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="oneTothree" class="col-sm-2 control-label">整整存取一年(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="oneTothree"
                                               name="zz12M">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="oneTothree" class="col-sm-2 control-label">整整存取二年(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="oneTothree"
                                               name="zz24M">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="threeTofive" class="col-sm-2 control-label">整整存取三年(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="threeTofive" name="zz36M">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="fiveUp" class="col-sm-2 control-label">整整存取五年(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="fiveUp1" name="zz60M"
                                                >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="fiveDown" class="col-sm-2 control-label">整零存取一年(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="fiveDown" v
                                               name="zl12M">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Fiveup" class="col-sm-2 control-label">整零存取三年(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="Fiveup"
                                               name="zl36M">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="t1" class="col-sm-2 control-label">整零存取五年(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="t1"
                                               name="zl60M">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="t2" class="col-sm-2 control-label">协定存款(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="t2"
                                               name="xd">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="t3" class="col-sm-2 control-label">一天通知存款(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="t3"
                                               name="tz1D">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="t4" class="col-sm-2 control-label">七天通知存款(%)：</label>

                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="t4"
                                               name="tz7D">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button id="btn-ope4" type="submit" class="btn btn-primary" value="">提交</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div id="manager_ope4">
                <div class="page-header">
                    <h1>存款利率
                        <small></small>
                    </h1>
                </div>
                <div class="jumbotron">
                    <table class="table table-bordered table-hover">
                        <tr class="active">
                            <th rowspan="2">序号</th>
                            <th rowspan="2">日期:</th>
                            <th rowspan="2">活期</th>
                            <th colspan="6">整存整取</th>
                            <th colspan="3">整存整取&nbsp;整存零取&nbsp;存本取息</th>
                            <th rowspan="2">协定存款</th>
                            <th rowspan="2">一天通知存款</th>
                            <th rowspan="2">七天通知存款</th>
                            <th colspan="3">操作</th>
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
                            <th>新增</th>
                            <th>修改</th>
                            <th>删除</th>
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
                                <td>
                                    <button id="depositAdd" class="btn btn-success"
                                            onclick="javascript:location.href='toModifyCun.do?'">新增
                                    </button>
                                </td>

                                <td>
                                    <button id="depositDel" class="btn btn-warning"
                                            onclick="javascript:location.href='toModifyCun.do?cunid=${cunkuanlilv.id}'">
                                        修改
                                    </button>
                                </td>
                                <td>
                                    <button id="depositMod" class="btn btn-danger"
                                            onclick="javascript:location.href='delCun.do?cunid=${cunkuanlilv.id}'">删除
                                    </button>
                                </td>

                            </tr>
                        </c:forEach>
                    </table>
                </div>
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
    $("#manager_ope1").show();
    // 点击导航1
    $("#manager-ope1").click(function () {
        $(".col-md-10>div").hide();
        $("#manager_ope1").show();
    });
    $("#manager-ope2").click(function () {
        $(".col-md-10>div").hide();
        $("#manager_ope2").show();
    });
    $("#manager-ope3").click(function () {
        var now = new Date().Format("yyyy-MM-dd hh:mm");
        $("#datetime").val(now);
        $(".col-md-10>div").hide();
        $("#manager_ope3").show();
    });
    $("#manager-ope4").click(function () {
        var now = new Date().Format("yyyy-MM-dd hh:mm");
        $("#datetime-ope4").val(now);
        $(".col-md-10>div").hide();
        $("#manager_ope4").show();
    });
</script>
<script type="text/javascript">
    $('#datatime,#datetime-ope4').datetimepicker({
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
    $("#btn,#btn-ope4").click(function () {
        var now = new Date().Format("yyyy-MM-dd hh:mm");
        $("#datetime,#datetime-ope4").val(now);
    })
</script>
<script type="text/javascript">//
<c:if test="${!empty message}">
<c:choose>
<c:when test="${message=='list_tellers_show'}">
$(".col-md-10>div").hide();
$("#manager_ope2").show();
</c:when>
<c:when test="${message=='list_daikuanlilv_show'}">
$(".col-md-10>div").hide();
$("#manager_ope3").show();
</c:when>
<c:when test="${message=='list_cunkuanlilv_show'}">
$(".col-md-10>div").hide();
$("#manager_ope4").show();
</c:when>


<c:when test="${message=='modifing_daikuanlilv_show'}">
$(".col-md-10>div").hide();
$("#loanModification").show();
</c:when>

<c:when test="${message=='modifing_cunkuanlilv_show'}">
$(".col-md-10>div").hide();
$("#depositModification").show();
</c:when>

<c:otherwise>
alert("${message}");
</c:otherwise>
</c:choose>
</c:if>
</script>
</body>
</html>
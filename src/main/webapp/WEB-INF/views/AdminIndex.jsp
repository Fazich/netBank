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
    <title>系统管理员</title>
    <!-- Bootstrap -->
    <link href="stylesheets/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="stylesheets/bootstrap-datetimepicker.min.css" media="screen">
    <!-- <link rel="stylesheet" type="text/css" href="stylesheets/flat-ui.css">
    -->
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
        .table tbody tr td{
            vertical-align: middle;
        }
    </style>
    <%@ include file='checklogin.jsp' %></head>
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
                <a class="navbar-brand" href="#">系统管理员, 您好！</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search"></div>
                    <button type="submit" class="btn btn-default">确定</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                            admin
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <a href="newFunction.do">个人中心</a>
                            </li>
                            <li>
                                <a href="newFunction.do">用户设置</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="logout.do">退出登录</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse --> </div>
        <!-- /.container-fluid --> </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation" class="active">
                        <a href="#">Admin</a>
                    </li>
                    <li id="admin-ope1" role="presentation">
                        <a href="#">数据库操作</a>
                    </li>
                    <%--<li id="admin-ope2" role="presentation">
                    <a href="#">还原数据库</a>
                </li>
                --%>
                <li id="admin-ope3" role="presentation">
                    <a href="#">新增管理员</a>
                </li>
                <li id="admin-ope4" role="presentation">
                    <a href="list_Managers.do">所有管理员</a>
                </li>
                <li id="admin-ope5" role="presentation">
                    <a href="logout.do">注销</a>
                </li>
            </ul>
        </div>
        <div class="col-md-10">

            <div id="admin_ope1">
                <div class="page-header">
                    <h1>
                        数据库操作
                        <small></small>
                    </h1>
                </div>

                <div class="jumbotron">
                    <table class="table table-bordered table-hover ">
                        <tr class="active">
                            <th>备份名称</th>
                            <th>修改日期</th>
                            <th>大小</th>
                            <th colspan="2">操作</th>
                        </tr>
                        <tr class="active">
                            <td>Bank_2015042210121101.sql</td>
                            <td>2015-04-22 10:12:11</td>
                            <td>24.2 KB</td>
                            <td>
                                <button class="btn  btn-success">还原</button>
                            </td>
                            <td>
                                <button class="btn btn-danger">删除</button>
                            </td>
                        </tr>
                        <tr class="active">
                            <td>Bank_2015042019335001.sql</td>
                            <td>2015-04-20 19:33:50</td>
                            <td>22.3 KB</td>
                            <td>
                                <button class="btn  btn-success">还原</button>
                            </td>
                            <td>
                                <button class="btn btn-danger">删除</button>
                            </td>
                        </tr>
                        <tr class="active">
                            <td>Bank_2015042212313201.sql</td>
                            <td>2015-04-22 12:31:32</td>
                            <td>22.5 KB</td>
                            <td>
                                <button class="btn  btn-success">还原</button>
                            </td>
                            <td>
                                <button class="btn btn-danger">删除</button>
                            </td>
                        </tr>
                    </table>
                    <div class="form-group  col-md-offset-10">
                        <label for="userName">操作：</label>
                        <button type="submit" class="btn btn-default" value="">新建备份</button>
                    </div>
                </div>
            </div>

            <div id="admin_ope2">
                <div class="page-header">
                    <h1>
                        还原数据库
                        <small></small>
                    </h1>
                </div>

                <div class="jumbotron">
                    <table class="table table-bordered table-hover ">
                        <tr class="active">
                            <th>备份名称</th>
                            <th>修改日期</th>
                            <th>大小</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                            <td>Bank_2015042210121101.sql</td>
                            <td>2015-04-22 10:12:11</td>
                            <td>24.2 KB</td>
                            <td>
                                <button class="btn  btn-success">还原</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Bank_2015042019335001.sql</td>
                            <td>2015-04-20 19:33:50</td>
                            <td>22.3 KB</td>
                            <td>
                                <button class="btn  btn-success">还原</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Bank_2015042212313201.sql</td>
                            <td>2015-04-22 12:31:32</td>
                            <td>22.5 KB</td>
                            <td>
                                <button class="btn  btn-success">还原</button>
                            </td>
                        </tr>

                    </table>
                </div>
            </div>

            <div id="admin_ope3">
                <div class="page-header">
                    <h1>
                        新增管理员
                        <small></small>
                    </h1>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-7 col-md-offset-1">
                            <form class="form-horizontal" action="addManager.do" method="post">

                                <div class="form-group">
                                    <label for="userName" class="col-sm-2 control-label">用户名：</label>

                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="userName" name="username"></div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">密码：</label>

                                    <div class="col-sm-6">
                                        <input type="password" class="form-control" id="password" name="password"></div>
                                </div>
                                <div class="form-group">
                                    <label for="passwordConfirm" class="col-sm-2 control-label">确认密码：</label>

                                    <div class="col-sm-6">
                                        <input type="password" class="form-control" id="passwordConfirm"></div>
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
            <div id="admin_ope4">
                <div class="page-header">
                    <h1>
                        所有管理员
                        <small></small>
                    </h1>
                </div>
                <div class="jumbotron">
                    <form class="form-inline" action="" method="post">
                        <div class="form-group panel-body">
                            <label for="exampleInputName2">请输入查询用户的真实姓名：</label>
                            <input type="text" class="form-control" id="exampleInputName2" value="查询所有用户">
                            <button type="submit" class="btn btn-primary">提交</button>
                        </div>
                    </form>
                    <table class="table table-bordered table-hover">
                        <tr class="active">
                            <th colspan="5">管理员</th>
                        </tr>
                        <tr class="active">
                            <th>序号</th>
                            <th>工号</th>
                            <th>账号</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach var="manager" varStatus="status" items="${managers}">
                            <tr>
                                <td>
                                    <c:out value="${status.count}"/>
                                </td>

                                <td>
                                    <c:out value="${manager.id}"/>
                                </td>
                                <td>
                                    <c:out value="${manager.username}"/>
                                </td>

                                <td>
                                    <%--<div>
                                    --%>
                                    <%--<a href="delteller.do?tellerid=${teller.id}">
                                    --%>
                                    <%--&nbsp;删除&nbsp;</a>
                                    --%>
                                    <%--</div>
                                    --%>
                                    <input class="btn btn-danger" class="btn btn-danger"
                                           class="btn btn-success" type="button" value="删除"
                                           onclick="javascript:location.href='delmanager.do?managerid=${manager.id}'"></td>
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
    $("#admin_ope1").show();
    // 点击导航1
    $("#admin-ope1").click(function () {
        $(".col-md-10>div").hide();
        $("#admin_ope1").show();
    });
    $("#admin-ope2").click(function () {
        $(".col-md-10>div").hide();
        $("#admin_ope2").show();
    });
    $("#admin-ope3").click(function () {
        $(".col-md-10>div").hide();
        $("#admin_ope3").show();
    });

    $("#admin-ope4").click(function () {
        $(".col-md-10>div").hide();
        $("#admin_ope4").show();
    });
    $("#admin-ope5").click(function () {
        $(".col-md-10>div").hide();
        $("#admin_ope5").show();
    });
</script>
<script type="text/javascript">
    $("#btn").click(function () {
        var now = new Date().Format("yyyy-MM-dd hh:mm:ss");
        $("#datetime").val(now);
    })
</script>
<script type="text/javascript">//
<c:if test="${!empty message}">
<c:choose>
<c:when test="${message=='list_Managers_show'}">
$(".col-md-10>div").hide();
$("#admin_ope4").show();
</c:when>


<c:otherwise>alert("${message}");</c:otherwise>
</c:choose>
</c:if>
</script>
<!--    <script type="text/javascript">
$('#datatime').datetimepicker({
            language:  'zh-CN',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0,
            pickerPosition: "bottom-right"
        });
</script>
-->
<!-- 获取时间赋值到输入框中 -->
<!--            <script type="text/javascript">
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
-->
<!-- 点击button后获取时间 -->
<!--            <script type="text/javascript">
$("#btn").click(function () {
                    var now = new Date().Format("yyyy-MM-dd hh:mm:ss");
                    $("#datetime").val(now);
                })
</script>
-->
</body>
</html>
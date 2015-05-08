<%--
  Created by IntelliJ IDEA.
  User: XiaHaijiao
  Date: 2015/4/8
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/img/favicon.png" type="image/png">

    <title>银行柜面业务操作系统</title>

    <link href="stylesheets/style.default.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="/js/html5shiv.js"></script>
    <script src="/js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        <c:if test="${!empty message}">
        alert("${message}");
        $("#mymodal").modal();
        <%--<c:choose>--%>
        <%--<c:when test="${message=='USER_FROZEN'}">--%>
        <%--alert("您的账号已被冻结，请先激活");--%>

        <%--</c:when>--%>
        <%--<c:when test="${message=='WRONG_PASSWORD'}">--%>
        <%--alert("密码错误，请重新输入");--%>
        <%--</c:when>--%>

        <%--<c:otherwise>--%>
        <%--alert("用户不存在，请重新输入");--%>
        <%--</c:otherwise>--%>
        <%--</c:choose>--%>
        </c:if>
    </script>

</head>

<body class="signin">

<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <h4>123</h4>
      ...
    </div>
  </div>
</div>


<section>

    <div class="signinpanel">

        <div class="row">

            <div class="col-md-7">

                <div class="signin-info">
                    <div class="logopanel">
                        <h1> 银行柜面业务操作系统 </h1>
                    </div>
                    <!-- logopanel -->

                    <div class="mb20"></div>

                    <h5><strong>欢迎使用本操作系统</strong></h5>
                </div>
                <!-- signin0-info -->

            </div>
            <!-- col-sm-7 -->

            <div class="col-md-5">

                <form method="post" action="login.do">
                    <h4 class="nomargin">登&nbsp;录 </h4>

                    <p class="mt5 mb20">
                        <input type="radio" name="logintype" id="r-user" value="user" checked="checked">
                        <label for="r-user">用户</label>
                        <input type="radio" name="logintype" id="r-teller"value="teller">
                        <label for="r-teller">业务员</label>
                        <input type="radio" name="logintype" id="r-manager"value="manager">
                        <label for="r-manager">管理员</label>
                        <input type="radio" name="logintype" id="r-admin"value="admin">
                        <label for="r-admin">admin</label>
                    </p>

                    <input type="text" class="form-control uname" placeholder="Username" name="username"/>
                    <input type="password" class="form-control pword" placeholder="Password" name="password"/>
                    <a href="">
                        <small>忘记密码？</small>
                    </a>
                    <button class="btn btn-success btn-block">登录</button>

                </form>
            </div>
            <!-- col-sm-5 -->

        </div>
        <!-- row -->

        <div class="signup-footer">
            <div class="pull-left">
                &copy; 山东财经大学2011级信息管理与信息系统1101班毕业设计
            </div>
            <div class="pull-right">
                Created By: <a href="javascript:;" target="_blank">杨宸 杨欢 夏海蛟</a>
            </div>
        </div>

    </div>
    <!-- signin -->

</section>


<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.sparkline.min.js"></script>
<script src="js/jquery.cookies.js"></script>

<script src="js/toggles.min.js"></script>
<script src="js/retina.min.js"></script>

<script src="js/custom.js"></script>
<script>
    jQuery(document).ready(function () {

        // Please do not use the code below
        // This is for demo purposes only
        var c = jQuery.cookie('change-skin');
        if (c && c == 'greyjoy') {
            jQuery('.btn-success').addClass('btn-orange').removeClass('btn-success');
        } else if (c && c == 'dodgerblue') {
            jQuery('.btn-success').addClass('btn-primary').removeClass('btn-success');
        } else if (c && c == 'katniss') {
            jQuery('.btn-success').addClass('btn-primary').removeClass('btn-success');
        }
    });
</script>

</body>
</html>
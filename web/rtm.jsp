<%--
  Created by IntelliJ IDEA.
  User: 59287
  Date: 2019/12/21
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" >
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" >
    <link rel="icon" type="image/png" href="../assets/img/favicon.png" >
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >

    <title>中国地质大学</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no' name='viewport' >
    <meta name="viewport" content="width=device-width" >

    <!-- Bootstrap core CSS     -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" >

    <!--  Paper Dashboard CSS    -->
    <link href="../assets/css/amaze.css" rel="stylesheet" >

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../assets/css/demo.css" rel="stylesheet" >

    <!--     Fonts and icons     -->
    <link href="../assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="../assets/css/font-muli.css" rel='stylesheet' type='text/css'>
    <link href="../assets/css/themify-icons.css" rel="stylesheet">

    <link href="../assets/vendors/sweetalert/css/sweetalert2.min.css" rel="Stylesheet">
</head>

<body>
<div class="wrapper">
    <div class="sidebar" data-background-color="brown" data-active-color="danger">
        <div class="logo">
            <a href="http://www.cug.edu.cn/" class="simple-text">
                <img src="/assets/img/logo3.png" />
            </a>
        </div>
        <div class="logo logo-mini">
            <a href="#" class="simple-text">
                A
            </a>
        </div>
        <br><br>
        <div class="sidebar-wrapper">
            <ul class="nav">
                <li>
                    <a href="index.jsp">
                        <i class="ti-panel"></i>
                        <p style="font-size:18px;font-family:SimSun">&nbsp;首&nbsp;&nbsp;页</p>
                    </a>
                </li>
                <br>
                <li class="active">
                    <a href="rtm.jsp">
                        <i class="ti-widget"></i>
                        <p style="font-size:18px ;font-family:SimSun">&nbsp;实时监控</p>
                    </a>
                </li>
                <br>
                <li>
                    <a href="history.jsp">
                        <i class="ti-widget"></i>
                        <p style="font-size:18px;font-family:SimSun">&nbsp;历史数据</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="main-panel">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-minimize">
                    <button id="minimizeSidebar" class="btn btn-round btn-white btn-fill btn-just-icon">
                        <i class="ti-arrow-left"></i>
                    </button>
                </div>
                <div class="navbar-header style="position:absolute;top:0px;left:0px;width:100%;>
                <button type="button" class="navbar-toggle" data-toggle="collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"> 实时监控 </a>
            </div>
            <div id="main" style="position:absolute;top:160px;left:20px;width:45%;height:300px;;text-align: center;">
            </div>
            <div id="main2" style="position:absolute;top:160px;left:550px;width:45%;height:300px;text-align: center;">
            </div>
    </div>
        </nav>
</div>
</div>
<!--   Core JS Files   -->
<script src="../assets/vendors/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="../assets/vendors/jquery-ui.min.js" type="text/javascript"></script>
<script src="../assets/vendors/bootstrap.min.js" type="text/javascript"></script>
<script src="../assets/vendors/material.min.js" type="text/javascript"></script>
<script src="../assets/vendors/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
<!-- Forms Validations Plugin -->
<script src="../assets/vendors/jquery.validate.min.js"></script>
<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="../assets/vendors/moment.min.js"></script>
<!--  Plugin for the Wizard -->
<script src="../assets/vendors/jquery.bootstrap-wizard.js"></script>
<!--  Notifications Plugin    -->
<script src="../assets/vendors/bootstrap-notify.js"></script>
<!-- DateTimePicker Plugin -->
<script src="../assets/vendors/bootstrap-datetimepicker.js"></script>
<!--  Checkbox, Radio, Switch and Tags Input Plugins -->
<script src="../assets/js/bootstrap-checkbox-radio-switch-tags.js"></script>
<!-- Vector Map plugin -->
<script src="../assets/vendors/jquery-jvectormap.js"></script>
<!-- Sliders Plugin -->
<script src="../assets/vendors/nouislider.min.js"></script>
<!--  Google Maps Plugin    -->
<script src="http://ditu.google.cn/maps/api/js?key=AIzaSyAurmSUEQDwY86-wOG3kCp855tCI8lHL-I"></script>
<!-- Select Plugin -->
<script src="../assets/vendors/jquery.select-bootstrap.js"></script>
<!--  DataTables.net Plugin    -->
<script src="../assets/vendors/jquery.datatables.js"></script>
<!-- Sweet Alert 2 plugin -->
<script src="../assets/vendors/sweetalert/js/sweetalert2.min.js"></script>
<!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="../assets/vendors/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin    -->
<script src="../assets/vendors/fullcalendar.min.js"></script>
<!-- TagsInput Plugin -->
<script src="../assets/vendors/jquery.tagsinput.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="../assets/js/amaze.js"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="../assets/js/demo.js"></script>
<script src="../assets/js/echarts.min.js"></script>
<script type="text/javascript">

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    loadXMLDoc();
    setInterval(function () {
        loadXMLDoc();
        loadXMLDocPost();
        // alert("你是猪！");
    }, 5000);
    //loadXMLDoc();
    function loadXMLDoc() {
        var xmlhttp;
        if (window.XMLHttpRequest) {
            //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
            xmlhttp = new XMLHttpRequest();
        }
        else {
            // IE6, IE5 浏览器执行代码
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var response = eval("(" + xmlhttp.responseText + ")");
                var a = new Array();
                var b=[0,80,63]
                //alert(response[0].id);
                a[0] = response[0].id;
                a[1] = response[1].id;
                a[2] = response[2].id;

                //setTimeout(function () {
                myChart.setOption(Ultrasonic(a, b));
                //},5000);

                //alert(response[2].name);
                //document.getElementById("myDiv").innerHTML = response[2].name;
                //document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
            }
        }
        xmlhttp.open("GET", "https://api.zizhu.cug.edu.cn/api/Example/users", true);
        xmlhttp.send();
    }

    function loadXMLDocPost() {
        var xmlhttp;
        if (window.XMLHttpRequest) {
            //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
            xmlhttp = new XMLHttpRequest();
        }
        else {
            // IE6, IE5 浏览器执行代码
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 201) {
                //var json = eval("(" + xmlhttp.responseText + ")");
                var json = JSON.parse(xmlhttp.responseText);
                //alert(json.id);
                //document.getElementById("myDiv").innerHTML = json.id + "-" + json.name + "-" + json.email + "-" + json.passage;
                //document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
            }
        }
        xmlhttp.open("POST", "https://api.zizhu.cug.edu.cn/api/Example/users", true);
        xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlhttp.send("name=Henry&email=123@163.com&message=你是猪");
    }

    //a = [0, 5, 10, 15, 20, 25, 30, 35, 40];
    //b = [0, 12, 22, 56, 25, 100, 95, 85, 105];

    // 基于准备好的dom，初始化echarts实例
    // var myChart = echarts.init(document.getElementById('main'));
    function Ultrasonic(a, b) {


        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '超声波测距'
            },
            tooltip: {},
            legend: {
                data: ['距离']
            },
            xAxis: {
                data: a,
                name: '时间/s',
            },
            yAxis: {
                name: '距离/cm',
            },
            series: [{
                name: '距离',
                type: 'line',
                //smooth:true,
                data: b
            }]
        };
        return option;
        // 使用刚指定的配置项和数据显示图表。
    }
    //a = [0, 5, 10, 15, 20, 25, 30, 35, 40];
    //b = [0, 12, 22, 56, 25, 100, 95, 85, 105];

    //    myChart.setOption(Ultrasonic(a, b));




    var c = [5, 10, 15, 20, 25];
    var d = [-1, 1, -1, 1, -1];
    // 基于准备好的dom，初始化echarts实例
    var myChart2 = echarts.init(document.getElementById('main2'));
    function infra_red_inspection(a, b) {
        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '人体红外检测'
            },
            tooltip: {},
            legend: {
                data: ['检测结果']
            },
            xAxis: {
                data: c,
                name: '时间/s',
            },
            yAxis: {
                name: '检测结果',
            },
            series: [{
                name: '检测结果',
                type: 'bar',
                //smooth:true,
                data: d
            }]
        };
        return option;
    }
    // 使用刚指定的配置项和数据显示图表。
    myChart2.setOption(infra_red_inspection(c, d));
    //a = [0, 5, 10, 15,20];
    //b = [0, 45, 30, 56, 25];
    //setTimeout(function () {
    //    myChart.setOption(Ultrasonic(a, b));//1秒后执行
    //}, 10000);


    function sleep(numberMillis) {
        var now = new Date();
        var exitTime = now.getTime() + numberMillis;
        while (true) {
            now = new Date();
            if (now.getTime() > exitTime)
                return;
        }
    }

</script>

<!--<script>
    $(document).ready(function () {
        demo.initSmallGoogleMaps();
    });
</script>-->
</body>
</html>


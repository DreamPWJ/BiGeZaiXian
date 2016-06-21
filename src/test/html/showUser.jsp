<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <base >
    <title>测试页面</title>
   <style type="text/css">
        /* CSS Code */
        @media screen and (min-width: 489px) {
            #one {
                width: 30%;
                height: 200px;
                float: left;
                background-color: darkgreen;
            }

            #two {
                width: 30%;
                height: 200px;
                float: left;
                background-color: gold;
            }

            #three {
                width: 30%;
                height: 200px;
                float: left;
                background-color: royalblue;
            }
        }

        @media screen and (max-width: 480px) {
            #one {
                width: 100%;
                height: 100px;
                background-color: darkolivegreen;
            }

            #two {
                width: 100%;
                height: 100px;
                background-color: greenyellow;
            }

            #three {
                width: 100%;
                height: 100px;
                background-color: crimson;
            }
        }
    </style>

</head>

<body>

  Welcome<br/>

<input id="text" type="text" /><button onclick="send()">Send</button>    <button onclick="closeWebSocket()">Close</button>

<div id="message">

</div>

<%--<c:forEach var="user" items="${userList}">
    <c:out value="${user.NAME}"></c:out><br/>
</c:forEach>--%>

<div id="one"></div>
<div id="two"></div>
<div id="three"></div>
<%--${user.name}--%>
</body>
</html>

<script type="text/javascript">
    var websocket = null;

    //判断当前浏览器是否支持WebSocket

    if('WebSocket' in window){
        websocket = new WebSocket("ws://localhost:8080/BiGeZaiXian/websocket");//ws://localhost:8080/BiGeZaiXian/websocket
    }
    else if('MozWebSocket' in window){
        websocket = new MozWebSocket('ws://localhost:8080/BiGeZaiXian/websocket');//ws://echo.websocket.org/
   } else{
        alert('你的浏览器版本太低！不支持WebSocket！');
    }
    //连接成功建立的回调方法
    websocket.onopen = function () {
        setMessageInnerHTML("WebSocket链接打开！");
    }
    //接收到消息的回调方法
    websocket.onmessage = function (event) {
        setMessageInnerHTML("WebSocket消息：" + event.data);
    }
   //连接关闭的回调方法
    websocket.onclose = function () {
        setMessageInnerHTML("WebSocket链接关闭！");
    }

    //连接发生错误的回调方法
    websocket.onerror = function () {
        setMessageInnerHTML("error");
    };

    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function () {
        websocket.close();
    }

    //将消息显示在网页上
    function setMessageInnerHTML(innerHTML) {
        document.getElementById('message').innerHTML += innerHTML + '<br/>';
    }
    //关闭连接
    function closeWebSocket() {
        websocket.close();
    }

    //发送消息
    function send() {
        var message = document.getElementById('text').value;
        websocket.send(message);
    }

</script>
$(function () {
        /**
         * 点击主页全局搜索按钮
         */
        $("#wholesearch").on("click", (function () {
            var wholesearchcontent = $("#wholesearchcontent").val().trim();
            var searchwhere = "?mark=" + wholesearchcontent + "&goodKindName=" + wholesearchcontent + "&producer=" + wholesearchcontent
            var aobj = $(this);
            var newhref = aobj.attr("href") + searchwhere;
            aobj.attr("href", newhref);
        }));


        /**
         *服务器发送事件方法 获取服务器推送消息
         */
        // getSSEMessage();
        function getSSEMessage() {
            var es = new EventSource("/BiGeZaiXian/SSEServlet");//创建EventSource对象，将要连接的URL作为它唯一的参数。
            /* es.onopen=function(){
             console.log("链接打开！");
             }*/
            //接收消息的回调函数
            es.onmessage = function (e) {
                var message = e.data;
                if (message != "" && message != null) {
                    $("#tooltip").show("300").find("p").text(message);
                    setTimeout(function () {
                            $("#tooltip").hide("300");
                        }, 6000
                    )
                }
            }
        }
    }
)
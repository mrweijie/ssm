<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/4
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Carbon - Admin Template</title>
<link rel="stylesheet" href="../../vendor/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet" href="../../vendor/font-awesome/css/fontawesome-all.min.css">
<link rel="stylesheet" href="../../css/styles.css">
</head>
<body class="sidebar-fixed header-fixed">
<div class="page-wrapper">
    <%@ include file="header.html" %>

    <div class="main-container">
        <%@ include file="sider.html" %>

        <div class="content"> <div class="row">
            <div class="col-md-12" id="Stock">
                <div class="card">
                    <div class="card-header bg-light">
                       Sell Table
                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover" id="list">
                                <thead>
                                <tr>
                                    <th class="table-th-css">录入时间</th>
                                    <th class="table-th-css">名称</th>
                                    <th class="table-th-css">出售数量</th>
                                    <th class="table-th-css">单价</th>
                                    <th class="table-th-css">总金额</th>
                                    <th class="table-th-css">单个成本</th>
                                    <th class="table-th-css">备注</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="card-footer">
                        <span id="span1"></span>
                        <span id="span2"></span>
                        <span id="span3"></span>
                        <br>
                        <button onclick="getList(1)">首页</button>
                        <button onclick="Previous()">上一页</button>
                        <button onclick="next()">下一页</button>
                        <button onclick="getList(maxPage)">尾页</button>
                    </div>
                </div>
            </div>

        </div>
        </div>
    </div>
</div>
</div>
<script src="../../vendor/jquery/jquery.min.js"></script>
<script src="../../vendor/popper.js/popper.min.js"></script>
<script src="../../vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="../../vendor/chart.js/chart.min.js"></script>
<script src="../../js/carbon.js"></script>
<script src="../../js/demo.js"></script>
</body>
</html>
<script>
    window.onload = function () {
        getList(1);
        $("#selldetailed").parent().addClass("active");
        $("#selldetailed").parent().parent().parent().parent().toggleClass('open');
    }

    var tableCont = $('.section-scroll tr th'); //获取th
    var tableCont_child = $('.section-scroll tr th div'); //获取th下边的div
    var tableScroll = $('.section-scroll'); //获取滚动条同级的class

    function scrollHandle() {
        var scrollTop = tableScroll.scrollTop();
        // 当滚动距离大于0时设置top及相应的样式
        if (scrollTop > 0) {
            tableCont.css({
                "top": scrollTop + 'px',
                "marginTop": "-1px",
                "padding": 0
            });
            tableCont_child.css({
                "borderTop": "1px solid gainsboro",
                "borderBottom": "1px solid gainsboro",
                "marginTop": "-1px",
                "padding": 0
            })
        } else {
            // 当滚动距离小于0时设置top及相应的样式
            tableCont.css({
                "top": scrollTop + 'px',
                "marginTop": "0",
            });
            tableCont_child.css({
                "border": "none",
                "marginTop": 0,
                "marginBottom": 0,
            })
        }
    }
    tableScroll.on('scroll', scrollHandle);

    var nowPage;
    var maxPage;

    function getList(currPage) {
        $.ajax({
            type: "get",
            url: "/home/getStockSell",
            dataType: "json",
            data:{
                currentPage : currPage
            },
            success: function (data) {
                console.log(data);
                var result = data.lists;
                var tr = ""
                $("#list tbody").remove();
                for(var a = 0;a < result.length;a++){
                    tr += "<tr class='product tr-backcolor'>" +
                        "<td style = 'text-align: center'>"+formatDate(result[a].sUpdate)+"</td>" +
                        "<td style = 'text-align: center'>"+result[a].name+"</td>" +
                        "<td style = 'text-align: center'>"+(result[a].sNumber == null?0:result[a].sNumber)+"</td>" +
                        "<td style = 'text-align: center'>"+result[a].sPrice+"</td>" +
                        "<td style = 'text-align: center'>"+(result[a].sPrice * Number(result[a].sNumber == null?0:result[a].sNumber))+"</td>" +
                        "<td style = 'text-align: center'>"+result[a].price+"</td>" +
                        "<td style = 'text-align: center'>"+(result[a].sRemarks == null?"无":result[a].sRemarks)+"</td>" +
                        "<td><button data-id="+result[a].sId+" onclick='delect(this)'>删除</button></td>" +
                        "</tr>";
                }
                $("#list").append(tr);
                addListen();
                $("#span1").text("");
                $("#span2").text("");
                $("#span3").text("");
                $("#span1").append("总计："+data.totalCount);
                $("#span2").append("总页数："+data.totalPage);
                $("#span3").append("当前页："+data.currPage);
                nowPage = data.currPage;
                maxPage = data.totalPage;
            },
            error: function () {
                alert("发布失败！");
            }
        });
    }

    function addListen() {
        $(".product").click(function(){
            if($(this).hasClass("tr-change")){
                $(this).removeClass("tr-change");
                $(this).addClass("tr-backcolor");
            }else{
                $(this).addClass("tr-change");
                $(this).removeClass("tr-backcolor");
            }
        });
    }

    //时间戳转换方法    date:时间戳数字
    function formatDate(date) {
        var date = new Date(date);
        var YY = date.getFullYear() + '-';
        var MM = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        var DD = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate());
        var hh = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
        var mm = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
        var ss = (date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds());
        return YY + MM + DD +" "+hh + mm + ss;
    }


    function next() {
        if(nowPage == maxPage){
            getList(maxPage);
        }else {
            getList(nowPage+1)
        }
    }

    function Previous() {
        if(nowPage == 1){
            getList(1);
        }else {
            getList(nowPage-1)
        }
    }
    function delect(ob) {
        var id=$(ob).attr("data-id");
        if(!window.confirm('你确定要删除此条数据？')) {
            return;
        }
    }
</script>

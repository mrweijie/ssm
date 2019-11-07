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
    <link rel="stylesheet" href="../../css/bootstrap-select.min.css">
</head>
<body class="sidebar-fixed header-fixed">
<div class="page-wrapper">
    <%@ include file="header.jsp" %>

    <div class="main-container">
        <jsp:include page="sider.jsp"><jsp:param value="customer" name="pageTitle"/></jsp:include>
        <div class="content"> <div class="row">
            <div class="col-md-12" id="Stock">
                <div class="card">
                    <div class="card-header bg-light">
                        <button id = "test"><i class="fa fa-plus"></i> 新增客户</button>
                    </div>

                    <div class="card-body">
                        <div class="card-header bg-light">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        名称：
                                        <input id="search_name" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <br>
                                        <input type="button" onclick="search()" style="width:45%;text-align:center;padding: 5px;" value="筛选">
                                        <input type="button" onclick="cancel()" style="width:45%;text-align:center;padding: 5px;" value="取消筛选">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover" id="list">
                                <thead>
                                <tr>
                                    <th class="table-th-css">编号</th>
                                    <th class="table-th-css">姓名</th>
                                    <th class="table-th-css">款数</th>
                                    <th class="table-th-css">备注</th>
                                    <th class="table-th-css">最后更新时间</th>
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
                        <%--<button onclick="getList(1)">首页</button>--%>
                        <%--<button onclick="Previous()">上一页</button>--%>
                        <%--<button onclick="next()">下一页</button>--%>
                        <%--<button onclick="getList(maxPage)">尾页</button>--%>
                    </div>
                </div>
            </div>

        </div>
        </div>
    </div>
</div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">新增</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">


                <div class="form-group">
                    <label for="name">编号</label>
                    <input type="text" name="c_id" class="form-control" id="c_id" readonly>
                </div>
                <div class="form-group">
                    <label for="name">客户名称</label>
                    <input type="text" name="name" class="form-control" id="name" placeholder="名称">
                </div>
                <div class="form-group">
                    <label for="money">款数</label>
                    <input type="text" name="money" class="form-control" id="money" placeholder="数量">
                </div>
                <div class="form-group">
                    <label for="remark">备注</label>
                    <input type="text" name="remark" class="form-control" id="remark" placeholder="备注">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                <button type="button" id="btn_submit" class="btn btn-primary" onclick="save()"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
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
<script src="../../js/bootstrap-select.min.js"></script>
</body>
</html>
<script>
    window.onload = function () {
        getList(1);
        $("#test").click(function () {
            $("#myModalLabel").text("新增");
            $("#c_id").val("");
            $("#name").val("");
            $("#money").val("");
            $("#remark").val("");
            $('#myModal').modal();
        });
    }

    var nowPage;
    var maxPage;

    function getList(currPage,search_name) {
        $.ajax({
            type: "get",
            url: "/home/getAllCustomer",
            dataType: "json",
            data:{
                currentPage : currPage,
                name : search_name
            },
            success: function (data) {
                var result = data.lists;
                var tr = ""
                $("#list tbody").remove();
                var sum = 0;
                for(var a = 0;a < result.length;a++){
                    tr += "<tr class='product tr-backcolor'>" +
                        "<td>"+result[a].id+"</td>" +
                        "<td>"+result[a].name+"</td>" +
                        "<td>$"+result[a].money+"</td>" +
                        "<td>"+(result[a].remark == null?"无":result[a].remark)+"</td>" +
                        "<td>"+formatDate(result[a].time)+"</td>" +
                        "<td><button data-id="+result[a].id+" data-name="+result[a].name+" data-money="+result[a].money+" data-remark="+result[a].remark+"" +
                        " onclick='edit(this)'>编辑</button><button data-id="+result[a].id+" onclick='delect(this)'>删除</button></td>" +
                        "</tr>";
                    sum += Number(result[a].money);
                }
                tr = "<tbody><tr><td style = 'text-align: center'>"+"总计"+"</td>" +
                    "<td>"+"</td>" +
                    "<td>$"+sum+"</td>" +
                    "<td>"+"</td>" +
                    "<td>"+"</td>" +
                    "<td>"+""+"</td>" +
                    "</tr>"+tr;
                tr+="</tbody>"
                $("#list").append(tr);
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
        $.ajax({
            type: "get",
            url: "/home/delCustomer",
            dataType: "json",
            data:{
                id : id
            },
            success: function (data) {
                if(data.state == "error"){
                    alert("删除失败！按F5刷新下页面");
                }else if(data.state == "success"){
                    $(ob).parent().parent().remove();
                }

            },
            error: function () {
                alert("发布失败！找钟伟杰！");
            }
        });
    }


    function edit(ob) {
        $("#myModalLabel").text("编辑");
        $("#c_id").val($(ob).attr("data-id"));
        $("#name").val($(ob).attr("data-name"));
        $("#money").val($(ob).attr("data-money"));
        $("#remark").val($(ob).attr("data-remark"));
        $('#myModal').modal();

    }

    function save() {
        var c_id = $("#c_id").val();
        var name = $("#name").val();
        var money = $("#money").val();
        var remark = $("#remark").val();
        if(name == ""){
            alert("名称不能为空");
            return;
        }
        var re = /^[0-9]+$/ ;
        if(!re.test(money)){
            alert("款数要为整数");
            return;
        }
        $.ajax({
            type: "get",
            url: "/home/addCustomer",
            dataType: "json",
            data:{
                id : c_id,
                name : name,
                money : money,
                remark : remark
            },
            success: function (data) {
                if(data.state == "fail"){
                    alert(data.message);
                    return;
                }else if(data.state == "success"){
                    window.location.href="/home/customer";
                }

            },
            error: function () {
                alert("发布失败！找钟伟杰！");
            }
        });
    }


    //筛选
    function search() {
        var search_name = $("#search_name").val();

        getList(1,search_name);
    }

    function cancel() {
        getList(1);
        $("#search_name").val("");
    }

</script>

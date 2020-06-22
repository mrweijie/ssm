<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/4
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
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
    <%@ include file="header.jsp" %>

    <div class="main-container">
        <div class="sidebar">
            <nav class="sidebar-nav">
                <ul class="nav">
                    <li class="nav-item">
                        <a href="/home/index" class="nav-link">
                            <i class="icon icon-home"></i> 会议
                        </a>
                    </li>
                </ul>
            </nav>

        </div>

        <div class="content"> <div class="row">
            <div class="col-md-12" id="Stock">
                <div class="card">
                    <div class="card-header bg-light">
                        <button id = "test"><i class="fa fa-plus"></i> 新增会议</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover" id="list">
                                <thead>
                                <tr>
                                    <%--<th>编号</th>--%>
                                    <th>会议名称</th>
                                    <th>会议内容</th>
                                    <th>会议开始时间</th>
                                    <th>会议结束时间</th>
                                    <th>状态</th>
                                    <th>创建时间</th>
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
                <h4 class="modal-title" id="myModalLabel">新增></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">

                <div class="form-group" style="display: none">
                    <label for="txt_id">id</label>
                    <input type="text" name="txt_departmentname" class="form-control" id="txt_id" placeholder="id">
                </div>
                <div class="form-group">
                    <label for="txt_name">会议名称</label>
                    <input type="text" name="txt_departmentname" class="form-control" id="txt_name" placeholder="会议名称">
                </div>
                <div class="form-group">
                    <label for="txt_price">会议内容</label>
                    <input type="text" name="txt_parentdepartment" class="form-control" id="txt_price" placeholder="会议内容">
                </div>
                <div class="form-group">
                    <label for="txt_beginDate">开始时间</label>
                    <input type="text" name="txt_departmentlevel" class="form-control" id="txt_beginDate" placeholder="开始时间">
                </div>
                <div class="form-group">
                    <label for="txt_endingDate">结束时间</label>
                    <input type="text" name="txt_departmentlevel" class="form-control" id="txt_endingDate" placeholder="结束时间">
                </div>
                <div class="form-group">
                    <label for="txt_status">状态</label>
                    <select class="form-control selectpicker" id="txt_status" name="txt_departmentlevel">
                        <option value="未开始">未开始</option>
                        <option value="进行中">进行中</option>
                        <option value="已结束">已结束</option>
                    </select>
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
<script>
    window.onload = function () {
        getStock(1);
        $("#test").click(function () {
            $("#myModalLabel").text("新增");
            $("#txt_name").val("");
            $("#txt_id").val("");
            $("#txt_price").val("");
            $("#txt_beginDate").val("");
            $("#txt_endingDate").val("");
            $('#myModal').modal();
        });
    }

    var nowPage;
    var maxPage;

    function getStock(currPage,year,month,name) {
        $.ajax({
            type: "get",
            url: "/meet/getAll",
            dataType: "json",
            data:{
                currentPage : currPage,
                year : year,
                month : month,
                name : name
            },
            success: function (data) {
                var result = data.lists;
                var tr = ""
                $("#list tbody").remove();
                for(var a = 0;a < result.length;a++){
                    tr += "<tr>" +
                        // "<td>"+result[a].id+"</td>" +
                        "<td>"+result[a].title+"</td>" +
                        "<td>"+result[a].context+"</td>" +
                        "<td>"+result[a].begindate+"</td>" +
                        "<td>"+result[a].endingdate+"</td>" +
                        "<td>"+result[a].status+"</td>" +
                        "<td>"+formatDate(result[a].publishdate)+"</td>" +
                        "<td><button data-id="+result[a].id+" onclick='showdetail(this)'>修改</button><button  data-id="+result[a].id+" onclick='delect(this)'>删除</button></td>" +
                        "</tr>";
                }
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
    //下一页
    function next() {
        if(nowPage == maxPage){
            getList(maxPage);
        }else {
            getList(nowPage+1)
        }
    }
    //上一页
    function Previous() {
        if(nowPage == 1){
            getList(1);
        }else {
            getList(nowPage-1)
        }
    }

    //详细按钮
    function showdetail(ob) {
        var id=$(ob).attr("data-id");
        $("#myModalLabel").text("编辑");
        $("#txt_id").val($(ob).attr("data-id"));
        $("#txt_name").val($(ob).parent().parent().children()[0].innerText);
        $("#txt_price").val($(ob).parent().parent().children()[1].innerText);
        $("#txt_beginDate").val($(ob).parent().parent().children()[2].innerText);
        $("#txt_endingDate").val($(ob).parent().parent().children()[3].innerText);
        $("#txt_status").val($(ob).parent().parent().children()[4].innerText);
        $('#myModal').modal();
    }
    //删除按钮
    function delect(ob) {
        var id=$(ob).attr("data-id");
        if(!window.confirm('你确定要删除此条数据？')) {
            return;
        }
        $.ajax({
            type: "get",
            url: "/meet/del",
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

    function save() {
        var p_id = $("#txt_id").val();
        var p_name = $("#txt_name").val();
        var p_price = $("#txt_price").val();
        var p_beginDate = $("#txt_beginDate").val();
        var p_endingDate = $("#txt_endingDate").val();
        var p_status = $("#txt_status").val();
        if(p_name == ""){
            alert("名称不能为空");
            return;
        }
        $.ajax({
            type: "get",
            url: "/meet/add",
            dataType: "json",
            data:{
                id : p_id,
                title : p_name,
                context : p_price,
                begindate : p_beginDate,
                endingdate : p_endingDate,
                status : p_status
            },
            success: function (data) {
                if(data.state == "fail"){
                    alert(data.message);
                    return;
                }else if(data.state == "success"){
                    window.location.href="/home/index";
                }

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
</script>
</body>
</html>

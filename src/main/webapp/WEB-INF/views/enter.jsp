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
                        Enter Table
                        <button id = "test">新增</button>
                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover" id="list">
                                <thead>
                                <tr>
                                    <th>录入时间</th>
                                    <th>名称</th>
                                    <th>进货数量</th>
                                    <th>单价</th>
                                    <th>备注</th>
                                    <th>总进货金额</th>
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

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">新增</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">

                <div class="form-group">
                    <label for="txt_departmentname">部门名称</label>
                    <input type="text" name="txt_departmentname" class="form-control" id="txt_departmentname" placeholder="部门名称">
                    <select class="form-control" data-live-search="true">
                        <option>123</option>
                        <option>456</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="txt_parentdepartment">上级部门</label>
                    <input type="text" name="txt_parentdepartment" class="form-control" id="txt_parentdepartment" placeholder="上级部门">
                </div>
                <div class="form-group">
                    <label for="txt_departmentlevel">部门级别</label>
                    <input type="text" name="txt_departmentlevel" class="form-control" id="txt_departmentlevel" placeholder="部门级别">
                </div>
                <div class="form-group">
                    <label for="txt_statu">描述</label>
                    <input type="text" name="txt_statu" class="form-control" id="txt_statu" placeholder="状态">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
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
        $("#test").click(function () {
            $("#myModalLabel").text("新增");
            $('#myModal').modal();
        });
        $("#enterdetailed").parent().addClass("active");
        $("#enterdetailed").parent().parent().parent().parent().toggleClass('open');
    }

    var nowPage;
    var maxPage;

    function getList(currPage) {
        $.ajax({
            type: "get",
            url: "/home/getStockRemainder",
            dataType: "json",
            data:{
                currentPage : currPage
            },
            success: function (data) {
                console.log(data);
                var result = data.lists;
                var tr = "<tbody>"
                $("#list tbody").remove();
                for(var a = 0;a < result.length;a++){
                    tr += "<tr>" +
                        "<td>"+formatDate(result[a].srUpdate)+"</td>" +
                        "<td>"+result[a].name+"</td>" +
                        "<td>"+(result[a].srNumber == null?0:result[a].srNumber)+"</td>" +
                        "<td>$"+result[a].price+"</td>" +
                        "<td>"+(result[a].srRemarks == null?"无":result[a].srRemarks)+"</td>" +
                        "<td>$"+(result[a].price * Number(result[a].srNumber == null?0:result[a].srNumber))+"</td>" +
                        "<td><button data-id="+result[a].srId+" onclick='delect(this)'>删除</button></td>" +
                        "</tr>";
                }
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
    }
</script>

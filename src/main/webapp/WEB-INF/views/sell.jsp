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
        <jsp:include page="sider.jsp"><jsp:param value="sell" name="pageTitle"/></jsp:include>
        <div class="content"> <div class="row">
            <div class="col-md-12" id="Stock">
                <div class="card">
                    <div class="card-header bg-light">
                        <button id = "test"><i class="fa fa-plus"></i> 新增出售</button>
                    </div>

                    <div class="card-body">
                        <div class="card-header bg-light">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        日期：
                                        <input type="date" id="search_date" class="form-control">
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
                                    <th class="table-th-css">录入时间</th>
                                    <th class="table-th-css">名称</th>
                                    <th class="table-th-css">成本</th>
                                    <th class="table-th-css">出售数量</th>
                                    <th class="table-th-css">出售单价</th>
                                    <th class="table-th-css">总金额</th>
                                    <th class="table-th-css">利润</th>
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

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">新增</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">

                <div class="form-group">
                    <label for="txt_name">产品名称</label>
                    <select class="form-control selectpicker" id="txt_name" name="txt_name" data-live-search="true" onchange="setprice(this)">
                    </select>
                </div>
                <div class="form-group">
                    <label for="txt_price">进货价格</label>
                    <input type="text" name="txt_price" class="form-control" id="txt_price" readonly>
                </div>
                <div class="form-group">
                    <label for="rs_price">出售价格</label>
                    <input type="text" name="rs_price" class="form-control" id="rs_price" placeholder="数量">
                </div>
                <div class="form-group">
                    <label for="txt_number">出售数量</label>
                    <input type="text" name="txt_number" class="form-control" id="txt_number" placeholder="数量">
                </div>
                <div class="form-group">
                    <label for="txt_remark">备注</label>
                    <input type="text" name="txt_remark" class="form-control" id="txt_remark" placeholder="备注">
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
            $("#rs_price").val("");
            $("#txt_number").val("");
            $("#txt_remark").val("");
            $('#myModal').modal();
        });
        setTimeout(getStockName(),100);
    }

    var nowPage;
    var maxPage;

    function getList(currPage,search_date) {
        $.ajax({
            type: "get",
            url: "/home/getStockSell",
            dataType: "json",
            data:{
                currentPage : currPage,
                search_date : search_date
            },
            success: function (data) {
                var result = data.lists;
                var tr = "<tbody>"
                $("#list tbody").remove();
                for(var a = 0;a < result.length;a++){
                    tr += "<tr class='product tr-backcolor'>" +
                        "<td>"+formatDate(result[a].sUpdate)+"</td>" +
                        "<td>"+result[a].name+"</td>" +
                        "<td>$"+result[a].price+"</td>" +
                        "<td>"+(result[a].sNumber == null?0:result[a].sNumber)+"</td>" +
                        "<td>$"+result[a].sPrice+"</td>" +
                        "<td>$"+(result[a].sPrice * Number(result[a].sNumber == null?0:result[a].sNumber))+"</td>" +
                        "<td>$"+((result[a].sPrice)-(result[a].price))*Number(result[a].sNumber == null?0:result[a].sNumber)+"</td>" +
                        "<td>"+(result[a].sRemarks == null?"无":result[a].sRemarks)+"</td>" +
                        "<td><button data-id="+result[a].sId+" onclick='delect(this)'>删除</button></td>" +
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
        $.ajax({
            type: "get",
            url: "/home/delStockRemainder",
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

    function getStockName() {
        $.ajax({
            type: "get",
            url: "/home/getStockName",
            success: function (data) {
                var list = data;
                var options ="";
                for (var i = 0; i < list.length; i++) {
                    $('#txt_name').append("<option value=" + list[i].id + " data-price='"+list[i].price+"'>" + list[i].name + "</option>");
                }
                $("#txt_price").val(list[0].price);
                $('#txt_name').selectpicker('refresh');
                $('#txt_name').selectpicker('render');
            },
            error: function () {
                alert("错误");
            }
        });
    }

    function delect(ob) {
        var id=$(ob).attr("data-id");
        if(!window.confirm('你确定要删除此条数据？')) {
            return;
        }
        $.ajax({
            type: "get",
            url: "/home/delStockSell",
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

    function setprice(ob) {
        $("#txt_price").val($(ob).find("option:selected").attr("data-price"));
    }

    function save() {
        var p_value = $("#txt_name").val();
        var rs_price = $("#rs_price").val();
        var p_number = $("#txt_number").val();
        var p_remark = $("#txt_remark").val();
        if(p_value == ""){
            alert("名称不能为空");
            return;
        }
        if(rs_price == ""){
            alert("价格不能为空");
            return;
        }
        if(p_number == ""){
            alert("数量不能为空");
            return;
        }
        var re = /^[0-9]+$/ ;
        if(!re.test(rs_price)){
            alert("价格要为整数");
            return;
        }
        if(!re.test(p_number)){
            alert("数量要为整数");
            return;
        }
        $.ajax({
            type: "get",
            url: "/home/addStockSell",
            dataType: "json",
            data:{
                sNumber : p_number,
                sPrice : rs_price,
                sStockId : p_value,
                sRemarks : p_remark
            },
            success: function (data) {
                if(data.state == "fail"){
                    alert(data.message);
                    return;
                }else if(data.state == "success"){
                    window.location.href="/home/sell";
                }

            },
            error: function () {
                alert("发布失败！找钟伟杰！");
            }
        });
    }


    //筛选
    function search() {
        var search_date = $("#search_date").val();

        getList(1,search_date);
    }

    function cancel() {
        getList(1);
        $("#search_date").val("");
    }

</script>

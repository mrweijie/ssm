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
    <%@ include file="header.html" %>

    <div class="main-container">
        <%@ include file="sider.html" %>

        <div class="content"> <div class="row">
            <div class="col-md-12" id="Stock">
                <div class="card">
                    <div class="card-header bg-light">
                        Bordered Table
                        <button id = "test">新增</button>
                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover" id="list">
                                <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>名称</th>
                                    <th>单价</th>
                                    <th>库存</th>
                                    <th>备注</th>
                                    <th>进货次数</th>
                                    <th>进货数量</th>
                                    <th>总进货金额</th>
                                    <th>销售次数</th>
                                    <th>售出数量</th>
                                    <th>总售出金额</th>
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
                <h4 class="modal-title" id="myModalLabel">新增></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="txt_name">产品名称</label>
                    <input type="text" name="txt_departmentname" class="form-control" id="txt_name" placeholder="产品名称">
                </div>
                <div class="form-group">
                    <label for="txt_price">产品单价</label>
                    <input type="text" name="txt_parentdepartment" class="form-control" id="txt_price" placeholder="产品单价">
                </div>
                <div class="form-group">
                    <label for="txt_remark">备注</label>
                    <input type="text" name="txt_departmentlevel" class="form-control" id="txt_remark" placeholder="备注">
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
        $(".icon-home").parent().addClass("active");

        $("#test").click(function () {
            $("#myModalLabel").text("新增");
            $("#txt_name").val("");
            $("#txt_price").val("");
            $("#txt_remark").val("");
            $('#myModal').modal();
        });
    }

    var nowPage;
    var maxPage;

    function getStock(currPage) {
        $.ajax({
            type: "get",
            url: "/home/getStock",
            dataType: "json",
            data:{
                currentPage : currPage
            },
            success: function (data) {
                console.log(data);
                var result = data.lists;
                var tr = ""
                var sum_rs = 0;
                var sum_rp = 0;
                var sum_ss = 0;
                var sum_sp = 0;
                var sum_kc = 0;
                $("#list tbody").remove();
                for(var a = 0;a < result.length;a++){
                    sum_rs = sum_rs + Number(result[a].r_sum);
                    sum_rp = sum_rp + (result[a].price * Number(result[a].r_sum == null?0:result[a].r_sum));
                    sum_ss = sum_ss + Number(result[a].s_sum);
                    sum_sp = sum_sp + Number(result[a].s_price);
                    sum_kc = sum_kc +((result[a].r_sum == null?0:Number(result[a].r_sum)) - (result[a].s_sum == null? 0:Number(result[a].s_sum)));
                    tr += "<tr><td>"+result[a].id+"</td>" +
                        "<td>"+result[a].name+"</td>" +
                        "<td>"+result[a].price+"</td>" +
                        "<td>"+((result[a].r_sum == null?0:Number(result[a].r_sum)) - (result[a].s_sum == null? 0:Number(result[a].s_sum))) +"</td>" +
                        "<td>"+(result[a].remarks == null?"无":result[a].remarks)+"</td>" +
                        "<td>"+(result[a].r_count == null?"":result[a].r_count)+"</td>" +
                        "<td>"+(result[a].r_sum == null?"":result[a].r_sum)+"</td>" +
                        "<td>"+(result[a].price * Number(result[a].r_sum == null?0:result[a].r_sum))+"</td>" +
                        "<td>"+(result[a].s_count == null?"":result[a].s_count)+"</td>" +
                        "<td>"+(result[a].s_sum == null?"":result[a].s_sum)+"</td>" +
                        "<td>"+(result[a].s_price == null?"":result[a].s_price)+"</td>" +
                        "<td><button data-id="+result[a].id+" onclick='showdetail(this)'>详细</button><button  data-id="+result[a].id+" onclick='delect(this)'>删除</button></td>" +
                        "</tr>";
                }
                tr = "<tbody><tr><td style = 'text-align: center'>"+"总计"+"</td>" +
                    "<td>"+"</td>" +
                    "<td>"+"</td>" +
                    "<td>"+sum_kc+"</td>" +
                    "<td>"+"</td>" +
                    "<td>"+"</td>" +
                    "<td>"+sum_rs+"</td>" +
                    "<td>"+sum_rp+"</td>" +
                    "<td>"+"</td>" +
                    "<td>"+sum_ss+"</td>" +
                    "<td>"+sum_sp+"</td>" +
                    "<td>"+""+"</td>" +
                    "</tr>"+tr;
                tr += "</tbody>";
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
        alert(id);
    }
    //删除按钮
    function delect(ob) {
        var id=$(ob).attr("data-id");
        if(!window.confirm('你确定要删除此条数据？')) {
            return;
        }
        $.ajax({
            type: "get",
            url: "/home/delStock",
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
        var p_name = $("#txt_name").val();
        var p_price = $("#txt_price").val();
        var p_remark = $("#txt_remark").val();
        if(p_name == ""){
            alert("名称不能为空");
            return;
        }
        if(p_price == ""){
            alert("价格不能为空");
            return;
        }
        var re = /^[0-9]+$/ ;
        if(!re.test(p_price)){
            alert("价格要为整数");
        }
        $.ajax({
            type: "get",
            url: "/home/addStock",
            dataType: "json",
            data:{
                name : p_name,
                price : p_price,
                remarks : p_remark
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
                alert("发布失败！找钟伟杰！");
            }
        });
    }
</script>
</body>
</html>

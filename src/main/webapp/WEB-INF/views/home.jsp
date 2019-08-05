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
        <jsp:include page="sider.jsp"><jsp:param value="home" name="pageTitle"/></jsp:include>

        <div class="content"> <div class="row">
            <div class="col-md-12" id="Stock">
                <div class="card">
                    <div class="card-header bg-light">
                        <button id = "test"><i class="fa fa-plus"></i> 新增</button>
                    </div>
                    <div class="card-body">
                        <div class="card-header bg-light">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        年份：
                                        <select class="form-control selectpicker" id="search_year" name="search_year">
                                            <option value=""></option>
                                            <option value="2019">2019 年</option>
                                            <option value="2020">2020 年</option>
                                            <option value="2021">2021 年</option>
                                            <option value="2022">2022 年</option>
                                            <option value="2023">2023 年</option>
                                            <option value="2024">2024 年</option>
                                            <option value="2025">2025 年</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        月份：
                                        <select class="form-control selectpicker" id="search_month" name="search_month">
                                            <option value=""></option>
                                            <option value="1"> 1 月</option>
                                            <option value="2"> 2 月</option>
                                            <option value="3"> 3 月</option>
                                            <option value="4"> 4 月</option>
                                            <option value="5"> 5 月</option>
                                            <option value="6"> 6 月</option>
                                            <option value="7"> 7 月</option>
                                            <option value="8"> 8 月</option>
                                            <option value="9"> 9 月</option>
                                            <option value="10">10 月</option>
                                            <option value="11">11 月</option>
                                            <option value="12">12 月</option>
                                        </select>
                                    </div>
                                </div>
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
                                    <%--<th>编号</th>--%>
                                    <th>名称</th>
                                    <th>单价</th>
                                    <th>库存</th>
                                    <th>库存总价</th>
                                    <th>进货次数</th>
                                    <th>进货数量</th>
                                    <th>总进货金额</th>
                                    <th>销售次数</th>
                                    <th>售出数量</th>
                                    <th>总售出金额</th>
                                    <th>总利润</th>
                                    <th>备注</th>
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

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" style="max-width: 80%;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" >详细</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <div class="col-md-12 mb-6">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#home" role="tab" aria-controls="home">入库记录</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#profile" role="tab" aria-controls="profile">出售记录</a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane active" id="home" role="tabpanel">
                            <div class="form-group">
                                <table class="table table-hover" id="enter">
                                    <thead>
                                    <tr>
                                        <th>时间</th>
                                        <th>数量</th>
                                        <th>备注</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="tab-pane" id="profile" role="tabpanel">
                            <div class="form-group">
                                <table class="table table-hover" id="sell">
                                    <thead>
                                    <tr>
                                        <th>时间</th>
                                        <th>数量</th>
                                        <th>价格</th>
                                        <th>备注</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
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
            $("#txt_price").val("");
            $("#txt_remark").val("");
            $('#myModal').modal();
        });
    }

    var nowPage;
    var maxPage;
    var search_y = "";
    var search_m = "";

    function getStock(currPage,year,month,name) {
        $.ajax({
            type: "get",
            url: "/home/getStock",
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
                var sum_rs = 0; //进货数量
                var sum_rp = 0; //进货总价
                var sum_ss = 0; //售出数量
                var sum_sp = 0; //售出总价
                var sum_kc = 0; //库存
                var sum_kcp = 0;
                var sum_lr = 0;
                $("#list tbody").remove();
                for(var a = 0;a < result.length;a++){
                    sum_kcp = sum_kcp + ((result[a].r_sum == null?0:Number(result[a].r_sum)) - (result[a].s_sum == null? 0:Number(result[a].s_sum)))*result[a].price;
                    sum_rs = sum_rs + Number(result[a].r_sum);
                    sum_rp = sum_rp + (result[a].price * Number(result[a].r_sum == null?0:result[a].r_sum));
                    sum_ss = sum_ss + Number(result[a].s_sum);
                    sum_sp = sum_sp + Number(result[a].s_price);
                    sum_kc = sum_kc +((result[a].r_sum == null?0:Number(result[a].r_sum)) - (result[a].s_sum == null? 0:Number(result[a].s_sum)));
                    sum_lr = sum_lr +((result[a].s_price == null?0:result[a].s_price)-(result[a].s_sum == null?"":result[a].s_sum)*result[a].price);
                    tr += "<tr>" +
                        // "<td>"+result[a].id+"</td>" +
                        "<td>"+result[a].name+"</td>" +
                        "<td>$"+result[a].price+"</td>" +
                        "<td>"+((result[a].r_sum == null?0:Number(result[a].r_sum)) - (result[a].s_sum == null? 0:Number(result[a].s_sum))) +"</td>" +
                        "<td>$"+((result[a].r_sum == null?0:Number(result[a].r_sum)) - (result[a].s_sum == null? 0:Number(result[a].s_sum)))*result[a].price +"</td>" +
                        "<td>"+(result[a].r_count == null?"":result[a].r_count)+"</td>" +
                        "<td>"+(result[a].r_sum == null?"":result[a].r_sum)+"</td>" +
                        "<td>$"+(result[a].price * Number(result[a].r_sum == null?0:result[a].r_sum))+"</td>" +
                        "<td>"+(result[a].s_count == null?"":result[a].s_count)+"</td>" +
                        "<td>"+(result[a].s_sum == null?"":result[a].s_sum)+"</td>" +
                        "<td>$"+(result[a].s_price == null?0:result[a].s_price)+"</td>" +
                        "<td>$"+((result[a].s_price == null?0:result[a].s_price)-(result[a].s_sum == null?"":result[a].s_sum)*result[a].price)+"</td>" +
                        "<td>"+(result[a].remarks == null?"无":result[a].remarks)+"</td>" +
                        "<td><button data-id="+result[a].id+" onclick='showdetail(this)'>详细</button><button  data-id="+result[a].id+" onclick='delect(this)'>删除</button></td>" +
                        "</tr>";
                }
                tr = "<tbody><tr><td style = 'text-align: center'>"+"总计"+"</td>" +
                    // "<td>"+"</td>" +
                    "<td>"+"</td>" +
                    "<td>"+sum_kc+"</td>" +
                    "<td>$"+sum_kcp+"</td>" +
                    "<td>"+"</td>" +
                    "<td>"+sum_rs+"</td>" +
                    "<td>$"+sum_rp+"</td>" +
                    "<td>"+"</td>" +
                    "<td>"+sum_ss+"</td>" +
                    "<td>$"+sum_sp+"</td>" +
                    "<td>$"+sum_lr+"</td>" +
                    "<td>"+"</td>" +
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
        $.ajax({
            type: "get",
            url: "/home/getdetail",
            dataType: "json",
            data:{
                id : id,
                year : search_y,
                month : search_m
            },
            success: function (data) {
                var enters = data.enter;
                var sells = data.sell;
                var e_tr = "<tbody>";
                var s_tr = "<tbody>";
                $("#enter tbody").remove();
                $("#sell tbody").remove();
                for (var i = 0; i < enters.length; i++) {
                    e_tr += "<tr>" +
                        "<td>"+formatDate(enters[i].srUpdate)+"</td>" +
                        "<td>"+enters[i].srNumber+"</td>" +
                        "<td>"+enters[i].srRemarks+"</td>" +
                        "</tr>";
                }
                for (var i = 0; i < sells.length; i++) {
                    s_tr += "<tr>" +
                        "<td>"+formatDate(sells[i].sUpdate)+"</td>" +
                        "<td>"+sells[i].sNumber+"</td>" +
                        "<td>"+sells[i].sPrice+"</td>" +
                        "<td>"+sells[i].sRemarks+"</td>" +
                        "</tr>";
                }
                e_tr += "</tbody>";
                s_tr += "</tbody>";

                $("#enter").append(e_tr);
                $("#sell").append(s_tr);


            },
            error: function () {
                alert("发布失败！找钟伟杰！");
            }
        });
        $('#myModal2').modal();
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
            return;
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


    //筛选
    function search() {
        search_y = $("#search_year").val();
        search_m = $("#search_month").val();
        var search_n = $("#search_name").val();

        getStock(1,search_y,search_m,search_n);
    }

    function cancel() {
        getStock(1);
        $("#search_year").val("");
        $("#search_month").val("");
        $("#search_name").val("");
        search_y = "";
        search_m = "";
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

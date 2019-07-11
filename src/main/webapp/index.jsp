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
    <link rel="stylesheet" href="./vendor/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="./vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="./css/styles.css">
</head>
<body class="sidebar-fixed header-fixed">
<div class="page-wrapper">
    <nav class="navbar page-header">
        <a href="#" class="btn btn-link sidebar-mobile-toggle d-md-none mr-auto">
            <i class="fa fa-bars"></i>
        </a>

        <a class="navbar-brand" href="#">
            <img src="./images/logo.png" alt="logo">
        </a>

        <a href="#" class="btn btn-link sidebar-toggle d-md-down-none">
            <i class="fa fa-bars"></i>
        </a>

        <ul class="navbar-nav ml-auto">
            <li class="nav-item d-md-down-none">
                <a href="#">
                    <i class="fa fa-bell"></i>
                    <span class="badge badge-pill badge-danger"></span>
                </a>
            </li>

            <li class="nav-item d-md-down-none">
                <a href="#">
                    <i class="fa fa-envelope-open"></i>
                    <span class="badge badge-pill badge-danger"></span>
                </a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="./images/avatar-1.png" class="avatar avatar-sm" alt="logo">
                    <span class="small ml-1 d-md-down-none">John Smith</span>
                </a>

                <div class="dropdown-menu dropdown-menu-right">
                    <div class="dropdown-header">Account</div>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-user"></i> Profile
                    </a>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-envelope"></i> Messages
                    </a>

                    <div class="dropdown-header">Settings</div>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-bell"></i> Notifications
                    </a>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-wrench"></i> Settings
                    </a>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-lock"></i> Logout
                    </a>
                </div>
            </li>
        </ul>
    </nav>

    <div class="main-container">
        <div class="sidebar">
            <nav class="sidebar-nav">
                <ul class="nav">
                    <li class="nav-item">
                        <a href="/home/index" class="nav-link active">
                            <i class="icon icon-home"></i> Home
                        </a>
                    </li>

                    <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link nav-dropdown-toggle">
                            <i class="icon icon-login"></i> Layin <i class="fa fa-caret-left"></i>
                        </a>

                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a href="/home/enter" class="nav-link">
                                    <i class="icon icon-list"></i> detailed
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="layouts-fixed-sidebar.html" class="nav-link">
                                    <i class="icon icon-eye"></i> Record
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link nav-dropdown-toggle">
                            <i class="icon icon-logout"></i> Layout <i class="fa fa-caret-left"></i>
                        </a>

                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a href="/home/sell" class="nav-link">
                                    <i class="icon icon-list"></i> detailed
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="layouts-fixed-sidebar.html" class="nav-link">
                                    <i class="icon icon-eye"></i> Record
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link" onclick="openicon()">
                            <i class="icon icon-badge"></i> Icon
                        </a>
                    </li>
                </ul>
            </nav>

        </div>

        <div class="content"> <div class="row">
            <div class="col-md-12" id="icon" style="display:none">
                <div class="card">
                    <div class="card-header bg-light">
                        Bordered Table
                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>icon</th>
                                    <th>class</th>
                                    <th>icon</th>
                                    <th>class</th>
                                    <th>icon</th>
                                    <th>class</th>
                                    <th>icon</th>
                                    <th>class</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th><i class="icon icon-link"></i></th><th>link</th><th><i class="icon icon-pie-chart"></i></th><th>pie-chart</th><th><i class="icon icon-present"></i></th><th>present</th><th><i class="icon icon-user-female"></i></th><th>user-female</th>
                               </tr><tr><th><i class="icon icon-lock"></i></th><th>lock</th><th><i class="icon icon-pencil"></i></th><th>pencil</th><th><i class="icon icon-playlist"></i></th><th>playlist</th><th><i class="icon icon-people"></i></th><th>people</th>
                               </tr><tr><th><i class="icon icon-lock-open"></i></th><th>lock-open</th><th><i class="icon icon-note"></i></th><th>note</th><th><i class="icon icon-pin"></i></th><th>pin</th><th><i class="icon icon-user-follow"></i></th><th>user-follow</th>
                               </tr><tr><th><i class="icon icon-magnifier"></i></th><th>magnifier</th><th><i class="icon icon-music-tone-alt"></i></th><th>music-tone-alt</th><th><i class="icon icon-picture"></i></th><th>picture</th><th><i class="icon icon-user-following"></i></th><th>user-following</th>
                               </tr><tr><th><i class="icon icon-magnifier-add"></i></th><th>magnifier-add</th><th><i class="icon icon-music-tone"></i></th><th>music-tone</th><th><i class="icon icon-map"></i></th><th>map</th><th><i class="icon icon-user-unfollow"></i></th><th>user-unfollow</th>
                               </tr><tr><th><i class="icon icon-magnifier-remove"></i></th><th>magnifier-remove</th><th><i class="icon icon-microphone"></i></th><th>microphone</th><th><i class="icon icon-layers"></i></th><th>layers</th><th><i class="icon icon-user"></i></th><th>user</th>
                               </tr><tr><th><i class="icon icon-paper-clip"></i></th><th>paper-clip</th><th><i class="icon icon-loop"></i></th><th>loop</th><th><i class="icon icon-handbag"></i></th><th>handbag</th><th><i class="icon icon-trophy"></i></th><th>trophy</th>
                               </tr><tr><th><i class="icon icon-paper-plane"></i></th><th>paper-plane</th><th><i class="icon icon-logout"></i></th><th>logout</th><th><i class="icon icon-globe-alt"></i></th><th>globe-alt</th><th><i class="icon icon-speedometer"></i></th><th>speedometer</th>
                               </tr><tr><th><i class="icon icon-plus"></i></th><th>plus</th><th><i class="icon icon-login"></i></th><th>login</th><th><i class="icon icon-globe"></i></th><th>globe</th><th><i class="icon icon-social-youtube"></i></th><th>social-youtube</th>
                               </tr><tr><th><i class="icon icon-location-pin"></i></th><th>location-pin</th><th><i class="icon icon-list"></i></th><th>list</th><th><i class="icon icon-frame"></i></th><th>frame</th><th><i class="icon icon-social-twitter"></i></th><th>social-twitter</th>
                               </tr><tr><th><i class="icon icon-power"></i></th><th>power</th><th><i class="icon icon-like"></i></th><th>like</th><th><i class="icon icon-folder-alt"></i></th><th>folder-alt</th><th><i class="icon icon-social-tumblr"></i></th><th>social-tumblr</th>
                               </tr><tr><th><i class="icon icon-refresh"></i></th><th>refresh</th><th><i class="icon icon-home"></i></th><th>home</th><th><i class="icon icon-film"></i></th><th>film</th><th><i class="icon icon-social-facebook"></i></th><th>social-facebook</th>
                               </tr><tr><th><i class="icon icon-reload"></i></th><th>reload</th><th><i class="icon icon-grid"></i></th><th>grid</th><th><i class="icon icon-feed"></i></th><th>feed</th><th><i class="icon icon-social-dropbox"></i></th><th>social-dropbox</th>
                               </tr><tr><th><i class="icon icon-settings"></i></th><th>settings</th><th><i class="icon icon-graph"></i></th><th>graph</th><th><i class="icon icon-earphones-alt"></i></th><th>earphones-alt</th><th><i class="icon icon-social-dribbble"></i></th><th>social-dribbble</th>
                               </tr><tr><th><i class="icon icon-star"></i></th><th>star</th><th><i class="icon icon-equalizer"></i></th><th>equalizer</th><th><i class="icon icon-earphones"></i></th><th>earphones</th><th><i class="icon icon-shield"></i></th><th>shield</th>
                               </tr><tr><th><i class="icon icon-symble-female"></i></th><th>symble-female</th><th><i class="icon icon-dislike"></i></th><th>dislike</th><th><i class="icon icon-drop"></i></th><th>drop</th><th><i class="icon icon-screen-tablet"></i></th><th>screen-tablet</th>
                               </tr><tr><th><i class="icon icon-symbol-male"></i></th><th>symbol-male</th><th><i class="icon icon-cursor"></i></th><th>cursor</th><th><i class="icon icon-drawar"></i></th><th>drawar</th><th><i class="icon icon-screen-smartphone"></i></th><th>screen-smartphone</th>
                               </tr><tr><th><i class="icon icon-target"></i></th><th>target</th><th><i class="icon icon-control-start"></i></th><th>control-start</th><th><i class="icon icon-docs"></i></th><th>docs</th><th><i class="icon icon-screen-desktop"></i></th><th>screen-desktop</th>
                               </tr><tr><th><i class="icon icon-volume-1"></i></th><th>volume-1</th><th><i class="icon icon-control-rewind"></i></th><th>control-rewind</th><th><i class="icon icon-directions"></i></th><th>directions</th><th><i class="icon icon-plane"></i></th><th>plane</th>
                               </tr><tr><th><i class="icon icon-volume-2"></i></th><th>volume-2</th><th><i class="icon icon-control-play"></i></th><th>control-play</th><th><i class="icon icon-direction"></i></th><th>direction</th><th><i class="icon icon-notebook"></i></th><th>notebook</th>
                               </tr><tr><th><i class="icon icon-volume-off"></i></th><th>volume-off</th><th><i class="icon icon-control-pause"></i></th><th>control-pause</th><th><i class="icon icon-diamond"></i></th><th>diamond</th><th><i class="icon icon-mustache"></i></th><th>mustache</th>
                               </tr><tr><th><i class="icon icon-phone"></i></th><th>phone</th><th><i class="icon icon-control-forward"></i></th><th>control-forward</th><th><i class="icon icon-cup"></i></th><th>cup</th><th><i class="icon icon-mouse"></i></th><th>mouse</th>
                               </tr><tr><th><i class="icon icon-menu"></i></th><th>menu</th><th><i class="icon icon-control-end"></i></th><th>control-end</th><th><i class="icon icon-compass"></i></th><th>compass</th><th><i class="icon icon-magnet"></i></th><th>magnet</th>
                               </tr><tr><th><i class="icon icon-options-vertical"></i></th><th>options-vertical</th><th><i class="icon icon-calender"></i></th><th>calender</th><th><i class="icon icon-call-out"></i></th><th>call-out</th><th><i class="icon icon-magic-wand"></i></th><th>magic-wand</th>
                               </tr><tr><th><i class="icon icon-options"></i></th><th>options</th><th><i class="icon icon-bulb"></i></th><th>bulb</th><th><i class="icon icon-call-in"></i></th><th>call-in</th><th><i class="icon icon-hourglass"></i></th><th>hourglass</th>
                               </tr><tr><th><i class="icon icon-arrow-down"></i></th><th>arrow-down</th><th><i class="icon icon-chart"></i></th><th>chart</th><th><i class="icon icon-call-end"></i></th><th>call-end</th><th><i class="icon icon-graduation"></i></th><th>graduation</th>
                               </tr><tr><th><i class="icon icon-arrow-left"></i></th><th>arrow-left</th><th><i class="icon icon-arrow-up-circle"></i></th><th>arrow-up-circle</th><th><i class="icon icon-calculator"></i></th><th>calculator</th><th><i class="icon icon-ghost"></i></th><th>ghost</th>
                               </tr><tr><th><i class="icon icon-arrow-right"></i></th><th>arrow-right</th><th><i class="icon icon-arrow-right-circle"></i></th><th>arrow-right-circle</th><th><i class="icon icon-bubbles"></i></th><th>bubbles</th><th><i class="icon icon-game-controller"></i></th><th>game-controller</th>
                               </tr><tr><th><i class="icon icon-arrow-up"></i></th><th>arrow-up</th><th><i class="icon icon-arrow-left-circle"></i></th><th>arrow-left-circle</th><th><i class="icon icon-briefcase"></i></th><th>briefcase</th><th><i class="icon icon-fire"></i></th><th>fire</th>
                               </tr><tr><th><i class="icon icon-paypal"></i></th><th>paypal</th><th><i class="icon icon-arrow-down-circle"></i></th><th>arrow-down-circle</th><th><i class="icon icon-book-open"></i></th><th>book-open</th><th><i class="icon icon-eyeglass"></i></th><th>eyeglass</th>
                               </tr><tr><th><i class="icon icon-social-instagram"></i></th><th>social-instagram</th><th><i class="icon icon-ban"></i></th><th>ban</th><th><i class="icon icon-basket-loaded"></i></th><th>basket-loaded</th><th><i class="icon icon-envelope-open"></i></th><th>envelope-open</th>
                               </tr><tr><th><i class="icon icon-social-linkedin"></i></th><th>social-linkedin</th><th><i class="icon icon-bubble"></i></th><th>bubble</th><th><i class="icon icon-basket"></i></th><th>basket</th><th><i class="icon icon-envolope-letter"></i></th><th>envolope-letter</th>
                               </tr><tr><th><i class="icon icon-social-pintarest"></i></th><th>social-pintarest</th><th><i class="icon icon-camrecorder"></i></th><th>camrecorder</th><th><i class="icon icon-bag"></i></th><th>bag</th><th><i class="icon icon-energy"></i></th><th>energy</th>
                               </tr><tr><th><i class="icon icon-social-github"></i></th><th>social-github</th><th><i class="icon icon-camera"></i></th><th>camera</th><th><i class="icon icon-action-undo"></i></th><th>action-undo</th><th><i class="icon icon-emotsmile"></i></th><th>emotsmile</th>
                               </tr><tr><th><i class="icon icon-social-google"></i></th><th>social-google</th><th><i class="icon icon-check"></i></th><th>check</th><th><i class="icon icon-action-redo"></i></th><th>action-redo</th><th><i class="icon icon-disc"></i></th><th>disc</th>
                               </tr><tr><th><i class="icon icon-social-reddit"></i></th><th>social-reddit</th><th><i class="icon icon-clock"></i></th><th>clock</th><th><i class="icon icon-wrench"></i></th><th>wrench</th><th><i class="icon icon-cursor-move"></i></th><th>cursor-move</th>
                               </tr><tr><th><i class="icon icon-social-skype"></i></th><th>social-skype</th><th><i class="icon icon-close"></i></th><th>close</th><th><i class="icon icon-umbrella"></i></th><th>umbrella</th><th><i class="icon icon-crop"></i></th><th>crop</th>
                               </tr><tr><th><i class="icon icon-social-behance"></i></th><th>social-behance</th><th><i class="icon icon-cloud-download"></i></th><th>cloud-download</th><th><i class="icon icon-trash"></i></th><th>trash</th><th><i class="icon icon-credit-card"></i></th><th>credit-card</th>
                               </tr><tr><th><i class="icon icon-social-foursqare"></i></th><th>social-foursqare</th><th><i class="icon icon-cloud-upload"></i></th><th>cloud-upload</th><th><i class="icon icon-tag"></i></th><th>tag</th><th><i class="icon icon-chemistry"></i></th><th>chemistry</th>
                               </tr><tr><th><i class="icon icon-social-soundcloud"></i></th><th>social-soundcloud</th><th><i class="icon icon-doc"></i></th><th>doc</th><th><i class="icon icon-support"></i></th><th>support</th><th><i class="icon icon-bell"></i></th><th>bell</th>
                               </tr><tr><th><i class="icon icon-social-spotify"></i></th><th>social-spotify</th><th><i class="icon icon-envolope"></i></th><th>envolope</th><th><i class="icon icon-size-fullscreen"></i></th><th>size-fullscreen</th><th><i class="icon icon-badge"></i></th><th>badge</th>
                               </tr><tr><th><i class="icon icon-social-stumbleupon"></i></th><th>social-stumbleupon</th><th><i class="icon icon-eye"></i></th><th>eye</th><th><i class="icon icon-size-actual"></i></th><th>size-actual</th><th><i class="icon icon-anchor"></i></th><th>anchor</th>
                               </tr><tr><th><i class="icon icon-minus"></i></th><th>minus</th><th><i class="icon icon-flag"></i></th><th>flag</th><th><i class="icon icon-shuffle"></i></th><th>shuffle</th><th><i class="icon icon-wallet"></i></th><th>wallet</th>
                               </tr><tr><th><i class="icon icon-organization"></i></th><th>organization</th><th><i class="icon icon-folder"></i></th><th>folder</th><th><i class="icon icon-share-alt"></i></th><th>share-alt</th><th><i class="icon icon-vector"></i></th><th>vector</th>
                               </tr><tr><th><i class="icon icon-exclamation"></i></th><th>exclamation</th><th><i class="icon icon-heart"></i></th><th>heart</th><th><i class="icon icon-share"></i></th><th>share</th><th><i class="icon icon-speech"></i></th><th>speech</th>
                               </tr><tr><th><i class="icon icon-social-vkontakte"></i></th><th>social-vkontakte</th><th><i class="icon icon-info"></i></th><th>info</th><th><i class="icon icon-rocket"></i></th><th>rocket</th><th><i class="icon icon-puzzle"></i></th><th>puzzle</th>
                               </tr><tr><th><i class="icon icon-event"></i></th><th>event</th><th><i class="icon icon-key"></i></th><th>key</th><th><i class="icon icon-question"></i></th><th>question</th><th><i class="icon icon-printer"></i></th><th>printer</th>
                               </tr><tr><th><i class="icon icon-social-steam"></i></th><th>social-steam</th><th><i class="icon icon-"></i></th><th></th><th><i class="icon icon-"></i></th><th></th><th><i class="icon icon-"></i></th><th></th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12" id="Stock">
                <div class="card">
                    <div class="card-header bg-light">
                        Bordered Table
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
<script src="./vendor/jquery/jquery.min.js"></script>
<script src="./vendor/popper.js/popper.min.js"></script>
<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="./vendor/chart.js/chart.min.js"></script>
<script src="./js/carbon.js"></script>
<script src="./js/demo.js"></script>
<script>
    window.onload = function () {
        // window.location.href="/home/index";
        // getStock(1);
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
    function openicon() {
        if($("#icon").css("display") == "none"){
            $("#icon").css('display','block');
        }else{
            $("#icon").css('display','none');
        }
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

    function showdetail(ob) {
        var id=$(ob).attr("data-id");
        alert(id);
    }
    function delect(ob) {
        var id=$(ob).attr("data-id");
        if(!window.confirm('你确定要删除此条数据？')) {
            return;
        }
    }
</script>
</body>
</html>

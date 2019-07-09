package com.ssm.controller;

import com.ssm.entity.PostBean;
import com.ssm.entity.Stock;
import com.ssm.service.MessageService;
import com.ssm.service.StockRemainderService;
import com.ssm.service.StockSellService;
import com.ssm.service.StockService;
import com.ssm.until.Tools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/home")
public class HomeController {
    @Autowired
    public MessageService messageService;

    @Autowired
    public StockService stockService;

    @Autowired
    public StockRemainderService stockRemainderService;

    @Autowired
    public StockSellService stockSellService;

    @RequestMapping(value="/index")
    public String index() {
        return "home";
    }

    @RequestMapping(value="/enter")
    public String enter() {
        return "enter";
    }

    @RequestMapping(value="/sell")
    public String sell() {
        return "sell";
    }

    @ResponseBody
    @RequestMapping(value = "/getAll", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String System() {
        return Tools.toJson(messageService.getAll());
    }

    @ResponseBody
    @RequestMapping(value = "/getStock", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String getStock(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage) {
        return Tools.toJson(stockService.getAll(currentPage,1000));
    }

    @ResponseBody
    @RequestMapping(value = "/getStockRemainder", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String getStockRemainder(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage) {
        return Tools.toJson(stockRemainderService.getAll(currentPage,50));
    }

    @ResponseBody
    @RequestMapping(value = "/getStockSell", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String getStockSell(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage) {
        return Tools.toJson(stockSellService.getAll(currentPage,50));
    }

    @ResponseBody
    @RequestMapping(value = "/addStock", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String addStock(Stock stock) {
        int state = stockService.add(stock);
        PostBean postBean = new PostBean();
        if(state == 1){
            postBean.setState("success");
            postBean.setMessage("保存成功");
        }else if(state == 2){
            postBean.setState("fail");
            postBean.setMessage("该产品已存在");
        }else{
            postBean.setState("error");
            postBean.setMessage("保存错误，找钟伟杰！");
        }
        return Tools.toJson(postBean);
    }

    @ResponseBody
    @RequestMapping(value = "/delStock", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String delStock(Integer id) {
        System.out.println(id);
        PostBean postBean = new PostBean();
        int state = stockService.deleteById(id);
        if(state == 1){
            postBean.setState("success");
            postBean.setMessage("删除成功");
        }else{
            postBean.setState("error");
            postBean.setMessage("删除错误，找钟伟杰！");
        }
        return Tools.toJson(postBean);
    }
}

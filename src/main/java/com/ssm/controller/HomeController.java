package com.ssm.controller;

import com.ssm.entity.*;
import com.ssm.service.*;
import com.ssm.until.Tools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Autowired
    public CustomerService customerService;

    @RequestMapping(value = "/index")
    public String index() {
        return "home";
    }

    @RequestMapping(value = "/enter")
    public String enter() {
        return "enter";
    }

    @RequestMapping(value = "/sell")
    public String sell() {
        return "sell";
    }

    @RequestMapping(value = "/customer")
    public String customer() {
        return "customer";
    }

    @ResponseBody
    @RequestMapping(value = "/getAll", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String System() {
        return Tools.toJson(messageService.getAll());
    }

    @ResponseBody
    @RequestMapping(value = "/getStock", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String getStock(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
                           @RequestParam(value = "year", defaultValue = "", required = false) String year,
                           @RequestParam(value = "month", defaultValue = "", required = false) String month,
                           @RequestParam(value = "name", defaultValue = "", required = false) String name) {
        return Tools.toJson(stockService.getAll(currentPage, 5000, year, month, name));
    }

    @ResponseBody
    @RequestMapping(value = "/getStockRemainder", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String getStockRemainder(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
                                    @RequestParam(value = "search_date", defaultValue = "", required = false) String search_date) {
        return Tools.toJson(stockRemainderService.getAll(currentPage, 50, search_date));
    }

    @ResponseBody
    @RequestMapping(value = "/getStockSell", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String getStockSell(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
                               @RequestParam(value = "search_date", defaultValue = "", required = false) String search_date) {
        return Tools.toJson(stockSellService.getAll(currentPage, 50, search_date));
    }

    @ResponseBody
    @RequestMapping(value = "/addStock", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String addStock(Stock stock) {
        int state = stockService.add(stock);
        PostBean postBean = new PostBean();
        if (state == 1) {
            postBean.setState("success");
            postBean.setMessage("保存成功");
        } else if (state == 2) {
            postBean.setState("fail");
            postBean.setMessage("该产品已存在");
        } else {
            postBean.setState("error");
            postBean.setMessage("保存错误，找钟伟杰！");
        }
        return Tools.toJson(postBean);
    }

    @ResponseBody
    @RequestMapping(value = "/delStock", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String delStock(Integer id) {
        PostBean postBean = new PostBean();
        int state = stockService.deleteById(id);
        if (state == 1) {
            postBean.setState("success");
            postBean.setMessage("删除成功");
        } else {
            postBean.setState("error");
            postBean.setMessage("删除错误，找钟伟杰！");
        }
        return Tools.toJson(postBean);
    }

    @ResponseBody
    @RequestMapping(value = "/getStockName", method = {RequestMethod.GET})
    public List<Stock> getStockName() {
        return stockService.selectAllName();
    }

    @ResponseBody
    @RequestMapping(value = "/addStockRemainder", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String addStockRemainder(StockRemainder stockRemainder) {
        int state = stockRemainderService.add(stockRemainder);
        PostBean postBean = new PostBean();
        if (state == 1) {
            postBean.setState("success");
            postBean.setMessage("保存成功");
        } else {
            postBean.setState("error");
            postBean.setMessage("保存错误，找钟伟杰！");
        }
        return Tools.toJson(postBean);
    }

    @ResponseBody
    @RequestMapping(value = "/delStockRemainder", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String delStockRemainder(Integer id) {
        PostBean postBean = new PostBean("success", "删除成功");
        int state = stockRemainderService.deleteById(id);
        if (state != 1) {
            postBean.setState("error");
            postBean.setMessage("删除错误，找钟伟杰！");
        }
        return Tools.toJson(postBean);
    }

    @ResponseBody
    @RequestMapping(value = "/addStockSell", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String addStockSell(StockSell stockSell) {
        int state = stockSellService.add(stockSell);
        PostBean postBean = new PostBean("success", "保存成功");
        if (state != 1) {
            postBean.setState("error");
            postBean.setMessage("保存错误，找钟伟杰！");
        }
        return Tools.toJson(postBean);
    }

    @ResponseBody
    @RequestMapping(value = "/delStockSell", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String delStockSell(Integer id) {
        PostBean postBean = new PostBean("success", "删除成功");
        int state = stockSellService.deleteById(id);
        if (state != 1) {
            postBean.setState("error");
            postBean.setMessage("删除错误，找钟伟杰！");
        }
        return Tools.toJson(postBean);
    }

    @ResponseBody
    @RequestMapping(value = "/getdetail", method = {RequestMethod.GET})
    public Map<String, List> getdetail(Integer id, String year, String month) {
        List<StockRemainder> remainderList = stockRemainderService.getListByStockId(id, year, month);
        List<StockSell> sellList = stockSellService.getListByStockId(id, year, month);
        Map<String, List> map = new HashMap<String, List>();
        map.put("enter", remainderList);
        map.put("sell", sellList);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/addCustomer", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String addCustomer(Customer customer) {
        int state = 1;
        customer.setTime(new Date());
        if (customer.getId() != null) {
            state = customerService.update(customer);
        } else {
            state = customerService.add(customer);
        }
        PostBean postBean = new PostBean("success", "保存成功");
        if (state != 1) {
            postBean.setState("error");
            postBean.setMessage("保存错误，找钟伟杰！");
        }
        return Tools.toJson(postBean);
    }

    @ResponseBody
    @RequestMapping(value = "/delCustomer", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String delCustomer(Integer id) {
        int status = customerService.deleteById(id);
        PostBean postBean = new PostBean("success", "删除成功");
        if (status != 1) {
            postBean.setState("error");
            postBean.setMessage("保存错误，找钟伟杰！");
        }
        return Tools.toJson(postBean);
    }

    @ResponseBody
    @RequestMapping(value = "/getAllCustomer", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String getAllCustomer(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
                                 @RequestParam(value = "name", defaultValue = "", required = false) String name) {
        return Tools.toJson(customerService.getAll(currentPage, 5000, name));
    }

}

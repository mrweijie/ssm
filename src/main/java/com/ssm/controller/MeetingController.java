package com.ssm.controller;

import com.ssm.entity.Meeting;
import com.ssm.entity.PostBean;
import com.ssm.service.MeetingService;
import com.ssm.until.Tools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/meet")
public class MeetingController {
    @Autowired
    public MeetingService meetingService;

    @ResponseBody
    @RequestMapping(value = "/getAll", method = {RequestMethod.GET})
    public String getStockName(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
                                      @RequestParam(value = "name", defaultValue = "", required = false) String name) {
        return Tools.toJson(meetingService.getAll(currentPage,10,name));
    }

    @ResponseBody
    @RequestMapping(value = "/add", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String addStock(Meeting meeting) {
        int state = 1;
        meeting.setPublishdate(new Date());
        if (meeting.getId() != null) {
            state = meetingService.update(meeting);
        } else {
            state = meetingService.add(meeting);
        }
        PostBean postBean = new PostBean("success", "保存成功");
        if (state != 1) {
            postBean.setState("error");
            postBean.setMessage("保存错误");
        }
        return Tools.toJson(postBean);
    }

    @ResponseBody
    @RequestMapping(value = "/del", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public String delStock(Integer id) {
        PostBean postBean = new PostBean();
        int state = meetingService.deleteById(id);
        if (state == 1) {
            postBean.setState("success");
            postBean.setMessage("删除成功");
        } else {
            postBean.setState("error");
            postBean.setMessage("删除错误");
        }
        return Tools.toJson(postBean);
    }
}

package com.ssm.service;

import com.ssm.dao.CustomerMapper;
import com.ssm.dao.StockMapper;
import com.ssm.dao.StockRemainderMapper;
import com.ssm.dao.StockSellMapper;
import com.ssm.entity.Customer;
import com.ssm.entity.Stock;
import com.ssm.entity.StockRemainder;
import com.ssm.entity.StockSell;
import com.ssm.until.Tools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.text.DateFormat;
import java.util.*;

@Service
public class EmailService {

    private final String DOMAIN_NAME_QQ = "@qq.com";
    private final String DOMAIN_NAME_163 = "@163.com";

    @Autowired
    private StockMapper mapper;


    @Autowired
    private StockSellMapper sellMapper;

    @Autowired
    private StockRemainderMapper remainderMapper;

    @Autowired
    private CustomerMapper customerMapper;

    @PostConstruct
    public void send(){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("a","");
        List<Stock> lists = mapper.getAll(map);
        List<StockRemainder> remainderList = remainderMapper.findByPage(map);
        List<StockSell> sellList = sellMapper.findByPage(map);
        List<Customer> customerList = customerMapper.getAll(map);
        send("stock",Tools.toJson(lists));
        send("stockRemainderList",Tools.toJson(remainderList));
        send("stockSellList",Tools.toJson(sellList));
        send("customerList",Tools.toJson(customerList));
    }

    public void send(String title,String content){
        try {
            Properties properties = new Properties();
            properties.put("mail.transport.protocol", "smtp");// 连接协议
            properties.put("mail.smtp.host", "smtp.qq.com");// 主机名
            properties.put("mail.smtp.port", 465);// 端口号
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.ssl.enable", "true");// 设置是否使用ssl安全连接 ---一般都使用
//            properties.put("mail.debug", "true");// 设置是否显示debug信息 true 会在控制台显示相关信息
            // 得到回话对象
            Session session = Session.getInstance(properties);
            // 获取message对象
            Message message = new MimeMessage(session);
            // 设置senfer email address
            message.setFrom(new InternetAddress("****" + DOMAIN_NAME_QQ));
            // 设置 Addressee email address
            message.setRecipient(Message.RecipientType.TO, new InternetAddress("*****"+DOMAIN_NAME_163));
            // 设置 title
            message.setSubject(DateFormat.getDateInstance(DateFormat.LONG,Locale.CHINA).format(Calendar.getInstance().getTime())+"_" + title);
            // 设置 content
            message.setText(content);
            // 得到Transport对象
            Transport transport = session.getTransport();
            // connect email smtp
            transport.connect("*****" + DOMAIN_NAME_QQ, "111");
            // send email
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }catch (Exception e){

        }
    }
}

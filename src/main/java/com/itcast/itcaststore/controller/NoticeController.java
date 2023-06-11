package com.itcast.itcaststore.controller;

import com.itcast.itcaststore.domain.Notice;
import com.itcast.itcaststore.domain.WeekHotProduct;
import com.itcast.itcaststore.service.INoticeService;
import com.itcast.itcaststore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



import java.util.List;

@Controller
//@RequestMapping("/Notice")
public class NoticeController {
    @Autowired
    private INoticeService noticeService;
    @Autowired
    private ProductService productService;
    @RequestMapping("/getRecentNotice")
    public String getRecentNotice(Model model){
        Notice recentNotice = noticeService.getRecentNotice();
        System.out.println(recentNotice);
        model.addAttribute("notice",recentNotice);
        List<WeekHotProduct> weekHotProduct = productService.getWeekHotProduct();
        System.out.println(weekHotProduct);
        model.addAttribute("pList",weekHotProduct);
        return "index1";

    }


}

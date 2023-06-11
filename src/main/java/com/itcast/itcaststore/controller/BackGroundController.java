package com.itcast.itcaststore.controller;


import com.itcast.itcaststore.domain.*;
import com.itcast.itcaststore.exception.AddProductException;
import com.itcast.itcaststore.mapper.NoticeMapper;
import com.itcast.itcaststore.mapper.OrderMapper;
import com.itcast.itcaststore.mapper.ProductMapper;
import com.itcast.itcaststore.service.impl.ProductServiceImpl;
import com.itcast.itcaststore.utils.FileUploadUtils;
import com.itcast.itcaststore.utils.IdUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BackGroundController {
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private ProductServiceImpl productService;
    @Autowired
    private NoticeMapper noticeMapper;
    @Autowired
    private OrderMapper orderMapper;

    @RequestMapping("/ShowProductByPageAdminServlet")
    public String ShowProductByPageAdminServlet(HttpServletRequest request) {

// 1.定义当前页码，默认为1
        int currentPage = 1;
        String _currentPage = request.getParameter("currentPage");
        if (_currentPage != null) {
            currentPage = Integer.parseInt(_currentPage);
        }
        // 2.定义每页显示条数,默认为4
        int currentCount = 4;
        String _currentCount = request.getParameter("currentCount");
        if (_currentCount != null) {
            currentCount = Integer.parseInt(_currentCount);
        }
        // 3.获取查找的分类
        String category = "全部商品";
        String _category = request.getParameter("category");
        if (_category != null) {
            category = _category;
        }
        // 4.调用service，完成获取当前页分页Bean数据.
        PageBean bean = productService.findProductByPage(currentPage, currentCount, category
        );
        // 将数据存储到request范围，跳转到product_list.jsp页面展示
        request.setAttribute("bean", bean);
//        request.getRequestDispatcher("admin/products/list.jsp").forward(request, response);
        return "admin/products/list";
    }

    @RequestMapping("/findProductByManyCondition")
    public String findProductByManyCondition(HttpServletRequest request) {
        String id = request.getParameter("id"); // 商品id
        String name = request.getParameter("name"); // 商品名称
        String category = request.getParameter("category"); // 商品类别
        String minprice = request.getParameter("minprice"); // 最小价格
        String maxprice = request.getParameter("maxprice"); // 最大价格
        // 3.调用service层用于条件查询的方法
        List<Product> ps = productMapper.findProductByManyCondition(id, name,
                category, minprice, maxprice);
        // 4.将条件查询的结果放进request域中
//        request.setAttribute("ps", ps);
        PageBean bean = new PageBean();
        bean.setCurrentPage(1);
        bean.setCurrentCount(5);
        bean.setTotalPage(1);
        bean.setTotalCount(1);
        bean.setPs(ps);
        request.setAttribute("bean", bean);
        return "/admin/products/list";
    }

    @RequestMapping("/ListNoticeServlet")
    public String ListNoticeServlet(HttpServletRequest request) {
        List<Notice> notices = noticeMapper.getAllNotices();
        request.setAttribute("notices", notices);
        return "/admin/notices/list";
    }

    @RequestMapping("/listProduct")
    public String listProduct(HttpServletRequest request) throws IOException {

        // 2.调用service层用于查询所有商品的方法
        List<Product> ps = productMapper.listAll();
        // 3.将查询出的所有商品放进request域中
        request.setAttribute("ps", ps);
        return "/admin/products/list";

    }

    @RequestMapping("/AddNoticeServlet")
    public ModelAndView AddNoticeServlet(HttpServletRequest request) throws IOException {

        Notice bean = new Notice();
        //获取表单参数
        String title = request.getParameter("title");
        String details = request.getParameter("details");

        //将当前时间设为添加公告的时间
        String t = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        bean.setTitle(title);
        bean.setDetails(details);
        bean.setN_time(t);
        //调用addNotice方法
        noticeMapper.addNotice(bean);
        return new ModelAndView("redirect:/ListNoticeServlet");
//        request.getRequestDispatcher("ListNoticeServlet").forward(request,response);
    }

    @RequestMapping("/EditNoticeServlet")
    public ModelAndView EditNoticeServlet(HttpServletRequest request) {

        Notice bean = new Notice();
        //获取表单参数
        int n_id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String details = request.getParameter("details");

        //将当前时间设为添加公告的时间
        String t = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

        bean.setN_id(n_id);
        bean.setTitle(title);
        bean.setDetails(details);
        bean.setN_time(t);

        //调用dao层方法
        noticeMapper.updateNotice(bean);


        return new ModelAndView("redirect:/ListNoticeServlet");
    }

    @RequestMapping("/DeleteNoticeServlet")
    public ModelAndView DeleteNoticeServlet(HttpServletRequest request) {
        String n_id = request.getParameter("id");

        //调用dao层方法
        noticeMapper.deleteNotice(n_id);
        return new ModelAndView("redirect:/ListNoticeServlet");
//        request.getRequestDispatcher("ListNoticeServlet").forward(request,response);
    }

    @RequestMapping("/FindByIdNoticeServlet")
    public String FindByIdNoticeServlet(HttpServletRequest request) {
        //获取公告id
        String n_id = request.getParameter("id");
        Notice notice = noticeMapper.findNoticeById(n_id);

        request.setAttribute("n", notice);

        return "/admin/notices/edit";
    }

    @RequestMapping("/download")
    public String download(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String year = request.getParameter("year");
        String month = request.getParameter("month");

        List<SaleTop> ps = productMapper.salesList(year, month);
        String fileName = year + "年" + month + "月销售榜单.csv";
//        response.setContentType(this.getServletContext().getMimeType(fileName));
        response.setHeader("Content-Disposition", "attachement;filename=" + new String(fileName.getBytes("GBK"), "iso8859-1"));
        response.setCharacterEncoding("gbk");
        PrintWriter out = response.getWriter();
        out.println("商品名称,销售数量");
        for (int i = 0; i < ps.size(); i++) {
            SaleTop arr = ps.get(i);
            out.println(arr.getProductName() + "," + arr.getTotalSum());
//			out.println();
//			out.println(arr[0]+","+arr[1]);
        }
        out.flush();
        out.close();
        return "/admin/products/download";
    }

    //addProduct
    @RequestMapping("/addProduct")
    public String addProduct(MultipartFile multipartFile, HttpSession session, HttpServletRequest request,@RequestParam("upload") MultipartFile file) throws IOException {
        Product product = new Product();
        // 封装商品id
        product.setId(IdUtils.getUUID());

        if (!file.isEmpty()) {
            // 得到上传文件真实名称
            String fileName = file.getOriginalFilename();
            fileName = FileUploadUtils.subFileName(fileName);

            // 得到随机名称
            String randomName = FileUploadUtils.generateRandonFileName(fileName);

            // 得到随机目录
            String randomDir = FileUploadUtils.generateRandomDir(randomName);
            // 图片存储父目录
            String imgurl_parent = "/productImg" + randomDir;

            File parentDir = new File(request.getServletContext().getRealPath(imgurl_parent));

            // 验证目录是否存在，如果不存在，创建出来
            if (!parentDir.exists()) {
                parentDir.mkdirs();
            }
            String imgurl = imgurl_parent + "/" + randomName;

            product.setImgurl(imgurl);
            product.setName(request.getParameter("name"));
            product.setPrice(Double.parseDouble(request.getParameter("price")));
            product.setPnum(Integer.parseInt(request.getParameter("pnum")));
            product.setCategory(request.getParameter("category"));
            product.setDescription(request.getParameter("description"));

            file.transferTo(new File(parentDir, randomName));
        }

        productService.addProduct(product);
        return "redirect:/listProduct";

    }


    @RequestMapping("/findOrderByManyCondition")
    public String findOrderByManyCondition(HttpServletRequest request) {
        String id = request.getParameter("id");
        String receiverName = request.getParameter("receiverName");
        //创建Service层对象

        //调用Service层OrderService类的findOrderByManyCondition()方法查询数据
        List<Order> orders = orderMapper.findOrderByManyCondition(id, receiverName);
        //将查询结果添加到request作用域中
        request.setAttribute("orders", orders);
        //请求转发到list.jsp页面，并将request请求和response响应也转发到该页面中
//        request.getRequestDispatcher("/admin/orders/list.jsp").forward(request,
//                response);
        return "admin/orders/list";
    }

    @RequestMapping("/deleteProduct")
    public String deleteProduct(HttpServletRequest request) {
        String id = request.getParameter("id");
        productMapper.deleteProduct(id);
        return "redirect:/ShowProductByPageAdminServlet";
    }

    @RequestMapping("/editProduct")
    public String editProduct(HttpServletRequest request, @RequestParam("upload") MultipartFile upload) throws IOException {
        Product p = new Product();
        p.setId(request.getParameter("id"));
        if (!upload.isEmpty()) {
            // 得到上传文件真实名称
            String fileName = upload.getOriginalFilename();
            fileName = FileUploadUtils.subFileName(fileName);

            // 得到随机名称
            String randomName = FileUploadUtils.generateRandonFileName(fileName);

            // 得到随机目录
            String randomDir = FileUploadUtils.generateRandomDir(randomName);
            // 图片存储父目录
            String imgurl_parent = "/productImg" + randomDir;

            File parentDir = new File(request.getServletContext().getRealPath(imgurl_parent));

            // 验证目录是否存在，如果不存在，创建出来
            if (!parentDir.exists()) {
                parentDir.mkdirs();
            }
            String imgurl = imgurl_parent + "/" + randomName;

            p.setImgurl(imgurl);
            p.setName(request.getParameter("name"));
            p.setPrice(Double.parseDouble(request.getParameter("price")));
            p.setPnum(Integer.parseInt(request.getParameter("pnum")));
            p.setCategory(request.getParameter("category"));
            p.setDescription(request.getParameter("description"));

            upload.transferTo(new File(parentDir, randomName));
        }
        // 调用service完成修改商品操作
        productMapper.editProduct(p);

        return "redirect:/ShowProductByPageAdminServlet";
    }
    @RequestMapping("/SalesList")
    public String SalesList(HttpServletRequest request) {
    return "redirect:admin/products/download.jsp";
    }
}







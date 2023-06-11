package com.itcast.itcaststore.controller;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class TestController {
    @RequestMapping("/fileUpload")
    public String uploadFile(HttpServletRequest request,MultipartFile upload2) throws Exception {
        //使用fileupload组件进行上传
        //上传的位置
        String path = request.getSession().getServletContext().getRealPath("/uploads/");
        //判断路径是否存在
        File file = new File(path);
        if (!file.exists()) {
            file.mkdirs();
        }
        //获取文件上传名称
        String filename = upload2.getOriginalFilename();
        //把文件名设置成唯一值.UUID
        String uuid = UUID.randomUUID().toString().replace("-", "");
        filename = uuid + "_" + filename;
        //完成文件上传
        upload2.transferTo(new File(path, filename));
        System.out.println("fileupload2"+path);
        return "testup";
    }
}

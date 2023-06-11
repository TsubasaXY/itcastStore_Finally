package com.itcast.itcaststore.utils;



import javax.imageio.ImageIO;
import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/CodeServlet")
public class CodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        BufferedImage image=new BufferedImage(100,50,BufferedImage.TYPE_INT_RGB);
        Graphics g=image.getGraphics();
        g.setColor(Color.pink);
        g.setFont(new Font(null,Font.BOLD,20));
        g.fillRect(0,0,100,50);
        g.setColor(Color.black);
        String str="ABCDEFGabcdefg678954";
        Random random = new Random();
        int index;

        StringBuilder sb = new StringBuilder();
        char ch;
        for (int i=0;i<4;i++){
            index=random.nextInt(str.length());
//           random.nextInt(str.length());
            ch=str.charAt(index);
            sb.append(ch);
            g.drawString(ch+"",20+15*i,20);
        }
        for (int i=0;i<100;i++) {
            g.setColor(Color.white);
            g.fillRoundRect(1, 1, 2, 2, 1, 1);
        }

        for (int i=0;i<100;i++) {
            g.setColor(Color.green);
            g.fillRoundRect(1, 1, 2, 2, 1, 1);

        }
        HttpSession session=request.getSession();
        String code=sb.toString();
        session.setAttribute("mycode",code);
        //g.drawString(ch+"",20,10);


//        response.getWriter().println();
        ImageIO.write(image,"jpg",response.getOutputStream());


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}

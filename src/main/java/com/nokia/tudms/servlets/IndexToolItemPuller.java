package com.nokia.tudms.servlets;

import com.google.gson.Gson;
import com.nokia.tudms.beans.IndexToolItemBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * @Author Rin
 * @Date 2017/4/24
 */
@WebServlet(name = "IndexToolItemPuller",urlPatterns = {"/api/index_tool_item_puller"})
public class IndexToolItemPuller extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        int type = Integer.parseInt(request.getParameter("type"));
        int startPos = Integer.parseInt(request.getParameter("startPos"));
        int needNumber = Integer.parseInt(request.getParameter("num"));

        // TODO 以下是测试部分
        System.out.println("type:"+type+" startPos:"+startPos+" needNum:"+needNumber);
        ArrayList<IndexToolItemBean> toolList=new ArrayList<IndexToolItemBean>();
        toolList.add(new IndexToolItemBean(1,1,"dnf",60.8,"Very Interesting!",20,60,30));
        toolList.add(new IndexToolItemBean(2,1,"waigua",60.8,"Very good!",23,66,20));
        toolList.add(new IndexToolItemBean(3,1,"dnf",60.8,"Very Interesting!",20,60,30));
        toolList.add(new IndexToolItemBean(4,2,"waigua",60.8,"Very good!",23,66,20));
        Gson gson = new Gson();
        String json = gson.toJson(toolList);
        System.out.println(json);
        response.getWriter().append(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("hhh");
    }
}

package com.example.zhengai.config;

import com.example.zhengai.model.YzUser;
import com.example.zhengai.service.YzUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;

public class MyIntercept implements HandlerInterceptor {

    @Autowired
    private YzUserService yzUserService;

    /*拦截器的前置拦截的方法，这里做权限判断，在一般情况下，除了登录页面，其他页面默认是不让访问的，
      只有登录用户后才可以访问（因为登录成功时候，会把用户放到session域中，也就是Session域中有User了），*/
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
       /* YzUser user = (YzUser)request.getSession().getAttribute("user");
        if (user==null){
            response.sendRedirect("/PageHome/login");
            return false;
        }else {
            return true;
        }*/

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}

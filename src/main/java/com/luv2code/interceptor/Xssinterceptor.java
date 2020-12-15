package com.luv2code.interceptor;

//import org.jetbrains.annotations.Nullable;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;

public class Xssinterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        try {
            Enumeration<String> paramNames = request.getParameterNames();
            while(paramNames.hasMoreElements()){
                String key = paramNames.nextElement();
                String val = request.getParameter(key);

                if(xssCheck(val)){
                    request.setAttribute("unsafe_request", "true");
                    break;
                }
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return true;
    }

    private boolean xssCheck(String value) {
        if (value != null) {
            return (value.matches("<script>(.*?)</script>") || value.matches("\"<script(.*?)>\""));
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {
    }
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {
    }
}

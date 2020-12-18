package com.luv2code.interceptor;

import com.luv2code.Entity.Manager;
import com.luv2code.Entity.Student;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManagerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        if(student != null) session.removeAttribute("student");
        Manager manager = (Manager) session.getAttribute("manager");
        if(manager == null){
            response.sendRedirect("/manager/login/");
            return false;
        }
        response.sendRedirect("/manager/home");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}

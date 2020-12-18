package com.luv2code.interceptor;

import com.luv2code.Entity.Manager;
import com.luv2code.Entity.Student;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StudentInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Manager manager = (Manager) session.getAttribute("manager");
        if(manager != null){
            session.removeAttribute("manager");
        }
        Student student = (Student)session.getAttribute("student");
        if(student == null){
            response.sendRedirect("/Final_war_exploded/user/show/");
            return false;
        }
//        response.sendRedirect("/Final_war_exploded/student/home/");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}

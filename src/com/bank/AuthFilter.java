package com.bank;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AuthFilter implements Filter  {
   public void  doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws java.io.IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String loginURI = req.getContextPath() + "/login.jsp";
        String registerURI = req.getContextPath() + "/register.jsp";
        String homeURI = req.getContextPath() + "/home.jsp";
        String aboutURI = req.getContextPath() + "/about.jsp";
        String contactURI = req.getContextPath() + "/contact.jsp";
        String requestURI = req.getRequestURI().toString();
        
        if((session != null && session.getAttribute("uid") != null) || requestURI.equals(registerURI) || requestURI.equals(homeURI) || 
        requestURI.equals(aboutURI) || requestURI.equals(contactURI)) {  
            chain.doFilter(request,response);
        }
        else {

            if(requestURI.equals(loginURI)) {
                requestURI = "home.jsp";
            }
            req.setAttribute("orig", requestURI);
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req,res);
        }
    }
   public void init(FilterConfig fConfig) throws ServletException {}
   public void destroy() {}
}
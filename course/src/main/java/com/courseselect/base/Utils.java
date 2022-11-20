package com.courseselect.base;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

public class Utils {
    public static Map<String, String> getCookies(HttpServletRequest request) {
        Map<String, String> cList = new HashMap<>();
        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return null;
        } else {
            for (Cookie cookie : cookies) {
                cList.put(cookie.getName(), cookie.getValue());
            }
            return cList;
        }
    }

    public static boolean isLogin(HttpServletRequest request) {
        Map<String, String> cookies = Utils.getCookies(request);
        if (cookies == null) {
            return false;
        } else {
            String uname = cookies.get("uname");
            return uname != null && uname.length() > 0;
        }
    }

    public static void setLoginInfo(HttpServletRequest request, ModelAndView modelAndView) {
        Map<String, String> cookies = Utils.getCookies(request);
        modelAndView.getModel().put("uname", cookies.get("uname"));
        modelAndView.getModel().put("uid", cookies.get("uid"));
        modelAndView.getModel().put("role", cookies.get("role"));
        if ("1".equals(cookies.get("role"))) {
            modelAndView.getModel().put("path", "employee");
        } else {
            modelAndView.getModel().put("path", "employer");
        }
    }
}

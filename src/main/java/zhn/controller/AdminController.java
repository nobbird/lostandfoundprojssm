package zhn.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import zhn.entity.Admin;
import zhn.entity.User;
import zhn.entity.Wuping;
import zhn.service.AdminService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author:zhn
 * @Date:2018/12/28
 */
@SessionAttributes(value ="admin" )
@Controller
@RequestMapping("/adminController")
public class AdminController {

    @Autowired
    AdminService adminService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login( Admin admin,Map map){
        String url="";
        Admin admin1 = adminService.login(admin);
        if (admin1!=null){
            map.put("admin",admin1);
            url="adminjsp/adminIndex";
        }else {
            url="adminjsp/admin";
        }
        return url;
    }

    @RequestMapping(value = "/getAllUser",method = RequestMethod.POST)
    @ResponseBody
    public Map getAllUser(HttpServletRequest request, HttpServletResponse response){
        String pageNow = request.getParameter("pageNow");
        String pageSize = request.getParameter("pageSize");
        PageInfo<User> pages = null;
        if (pageNow!=null) {
            pages = adminService.getAllUser(Integer.parseInt(pageNow), Integer.parseInt(pageSize));
        }else {
            pages = adminService.getAllUser(1, Integer.parseInt(pageSize));
        }
        Map map = new HashMap();
        map.put("payload", pages);
        map.put("status", 0);
        return map;
    }

    @RequestMapping(value = "/updateAdmin",method = RequestMethod.POST)
    @ResponseBody
    public boolean update(@RequestBody Admin admin, Map map){
        boolean b = adminService.updateAdmin(admin);
        map.put("admin", admin);
        return b;
    }

}

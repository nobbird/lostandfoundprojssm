package zhn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import zhn.entity.User;
import zhn.service.UserService;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author:zhn
 * @Date:2018/12/8
 */
@SessionAttributes(value = {"user"})
@Controller
@RequestMapping("/userController")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/{url}", method = RequestMethod.GET)
    public String getPage( @PathVariable("url") String url ) {
        if (url != null) {
            return "myjsp/"+url;
        }
        return "myjsp/error";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login( User user, Map map){
        String url="";
        User user1 = userService.login(user);
        if(user1!=null){
            map.put("user",user1);
            url="redirect:/index";
        }else{
            url="redirect:/login";
        }
        return url;
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(User user){
        String url="";
        boolean b = userService.register(user);
        if (b==true){
            url="myjsp/login";
        }else{
            url="myjsp/register";
        }
        return  url;
    }

    @RequestMapping(value = "/updateUser",method = RequestMethod.POST)
    public String updateUser(User user){
        String url="";
        boolean b = userService.updateUser(user);
        if (b==true){
            url="myjsp/index";
        }else{
            url="myjsp/userMessage";
        }
        return  url;
    }

    @RequestMapping(value = "/deleteUser/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Map deleteUser(@PathVariable Integer id){
        Integer i = userService.deleteUser(id);
        Map map=new HashMap();
        map.put("payload",i);
        return map;
    }
}

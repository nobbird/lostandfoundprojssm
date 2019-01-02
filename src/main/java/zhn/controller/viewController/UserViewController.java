package zhn.controller.viewController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Author:zhn
 * @Date:2018/12/8
 */
@Controller
public class UserViewController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "myjsp/login";
    }

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String register(){
        return "myjsp/register";
    }

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(){
        return "myjsp/index";
    }

    @RequestMapping(value = "/userMessage",method = RequestMethod.GET)
    public String userMessage(){return "myjsp/userMessage";}

}



package zhn.controller.viewController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Author:zhn
 * @Date:2018/12/28
 */
@Controller
public class AdminViewController {

    @RequestMapping(value = "/admin",method = RequestMethod.GET)
    public String adminLogin(){
        return "adminjsp/admin";
    }

    @RequestMapping(value = "/adminIndex",method = RequestMethod.GET)
    public String adminIndex(){
        return "adminjsp/adminIndex";
    }

    @RequestMapping(value = "/console",method = RequestMethod.GET)
    public String adminConsole(){return "adminjsp/console";}

    @RequestMapping(value = "/lostInfo",method = RequestMethod.GET)
    public String adminLostInfo(){return "adminjsp/lostInfo";}

    @RequestMapping(value = "/foundInfo",method = RequestMethod.GET)
    public String adminFoundInfo(){return "adminjsp/foundInfo";}

    @RequestMapping(value = "/userList",method = RequestMethod.GET)
    public String adminUserList(){return "adminjsp/userList";}

    @RequestMapping(value = "/applyList",method = RequestMethod.GET)
    public String adminApplyList(){return "adminjsp/applyList";}

    @RequestMapping(value = "/adminInfo",method = RequestMethod.GET)
    public String adminInfo(){return "adminjsp/adminInfo";}

    @RequestMapping(value = "/adminPass",method = RequestMethod.GET)
    public String adminPass(){return "adminjsp/adminPass";}

    @RequestMapping(value = "/wupingform",method = RequestMethod.GET)
    public String wupingform(){return "adminjsp/wupingform";}

    @RequestMapping(value = "/lostWupingForm",method = RequestMethod.GET)
    public String lostwupingform(){return "adminjsp/lostWupingForm";}

    @RequestMapping(value = "/userInfoForm",method = RequestMethod.GET)
    public String userInfoForm(){return "adminjsp/userInfoForm";}

    @RequestMapping(value = "/applyForm",method = RequestMethod.GET)
    public String applyForm(){return "adminjsp/applyForm";}
}

package zhn.controller.viewController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

/**
 * @Author:zhn
 * @Date:2018/12/11
 */
@Controller
public class WupingViewController {
    @RequestMapping(value = "/lost", method = RequestMethod.GET)
    public String lost() {
        return "myjsp/lost";
    }

    @RequestMapping(value = "/issuelost", method = RequestMethod.GET)
    public String issueLost() {
        return "myjsp/issuelost";
    }

    @RequestMapping(value = "/apply/{id}",method = RequestMethod.GET)
    public String apply(@PathVariable Integer id,Map map){
        map.put("tid",id);
        return "myjsp/apply";
    }

}

package zhn.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import zhn.entity.Apply;
import zhn.service.ApplyService;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author:zhn
 * @Date:2018/12/22
 */
@Controller
@RequestMapping("/applyController")
public class ApplyController {
    @Autowired
    ApplyService applyService;

    @RequestMapping("/applyWuping/{tid}/{userId}")
    public String applyWuping( @PathVariable Integer tid,@PathVariable String userId, Apply apply){
        String url="";
        apply.setTid(tid);
        apply.setUserId(userId);
        boolean b = applyService.applyWuping(apply);
        if (b==true){
            url="/myjsp/index";
        }
        return url;
    }

    @RequestMapping(value = "/getAllApply",method = RequestMethod.POST)
    @ResponseBody
    public Map getAllApply( HttpServletRequest request){
        String pageNow = request.getParameter("pageNow");
        String pageSize = request.getParameter("pageSize");
        PageInfo<Apply> allApply = applyService.getAllApply(Integer.parseInt(pageNow),Integer.parseInt(pageSize));
        Map map = new HashMap();
        map.put("payload", allApply);
        map.put("status", 0);
        return map;
    }

    @RequestMapping(value = "/changeFlag",method = RequestMethod.GET)
    @ResponseBody
    public boolean changeFlag( @RequestParam(value="id") Integer id,@RequestParam(value = "flag") Integer flag){
        Integer integer = applyService.changeFlag(id, flag);
        return integer>0;
    }
}

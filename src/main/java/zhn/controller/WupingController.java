package zhn.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import zhn.entity.Wuping;
import zhn.service.WupingService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * @Author:zhn
 * @Date:2018/12/11
 */
@Controller
@RequestMapping("/wupingController")
public class WupingController {

    @Autowired
    WupingService wupingService;

    @RequestMapping(value = "/getAllWuping",method = RequestMethod.POST)
    @ResponseBody
    public Map getAllWuping(){
        ArrayList allWuping = wupingService.getAllWuping();
        Map map = new HashMap();
        map.put("wupings", allWuping);
        map.put("total", allWuping.size());
        return map;
    }

    @RequestMapping("/getListByPage/{flag}")
    public String getListByPage( @PathVariable Integer flag, Map map ) {
        String url = "";
        ArrayList list = wupingService.getListByPage(flag);
        map.put("list", list);
        if (flag == 0) {
            url = "myjsp/lost";
        } else {
            url = "myjsp/found";
        }
        return url;
    }

    @RequestMapping("/wupingAdd/{userId}")
    public String wupingLost( Wuping wuping , HttpServletRequest request,Map map,@PathVariable String userId) {
        String url = "";
        if(wuping.getFlag()==0){
            wuping.setState("0");
        }else{
            wuping.setState("2");
        }
        //保存数据库的路径
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath=request.getServletContext().getRealPath("upload/images");
        //定义 文件名
        String filename=null;
        if(!wuping.getFile().isEmpty()){
            //生成uuid作为文件名称
            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType=wuping.getFile().getContentType();
            //获得文件后缀名
            String suffixName=contentType.substring(contentType.indexOf("/")+1);
            //得到 文件名
            filename=uuid+"."+suffixName;
            System.out.println(filename);
            //文件保存路径
            try {
                File file = new File(localPath, filename);
                file.createNewFile();
                wuping.getFile().transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        //把图片的相对路径保存至数据库
        sqlPath = "/upload/images/"+filename;
        System.out.println(sqlPath);
        wuping.setImages(sqlPath);
        wuping.setUserId(userId);
        boolean wupingAdd = wupingService.wupingAdd(wuping);
        map.put("wuping",wuping);
        return "myjsp/index";
    }

    @RequestMapping("/keyWordSearch")
    @ResponseBody
    public PageInfo<Wuping> keyWordSearch( @RequestParam String keyWord, @RequestParam Integer flag, Map map,HttpServletRequest request){
        String  pageNow = request.getParameter("pageNow");
        String pageSize = request.getParameter("pageSize");
        int totalCount=wupingService.keyWordSearch(keyWord, flag).size();
        PageInfo<Wuping> pages = null;
        if (pageNow!=null) {
            pages = wupingService.getWupingByPagesByKeyWord(Integer.parseInt(pageNow),Integer.parseInt(pageSize),flag,keyWord);
        }else {
            pages = wupingService.getWupingByPagesByKeyWord(1,Integer.parseInt(pageSize),flag,keyWord);
        }
        return pages;
    }

    @RequestMapping(value = "/getWupingByPages/{flag}", method = RequestMethod.POST)
    @ResponseBody
    public Map getWupingByPages( @PathVariable Integer flag, HttpServletRequest request, HttpServletResponse response){
        String pageNow = request.getParameter("pageNow");
        String pageSize = request.getParameter("pageSize");
        //获取总页数
        int totalCount=wupingService.getWupingCount(flag);
        List<Wuping> list = null;
        PageInfo<Wuping> pages = null;
        if (pageNow!=null) {
            pages = wupingService.getWupingByPages(Integer.parseInt(pageNow), Integer.parseInt(pageSize), flag);
        }else {
            pages = wupingService.getWupingByPages(1, Integer.parseInt(pageSize), flag);
        }
        Map map = new HashMap();
        map.put("payload", pages);
        map.put("status", 0);
        return map;
    }

    @RequestMapping(value = "/deleteWuping/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Map deleteWuping(@PathVariable Integer id){
        int b = wupingService.deleteWuping(id);
        Map map = new HashMap();
        map.put("payload",b);
        return map;
    }


}

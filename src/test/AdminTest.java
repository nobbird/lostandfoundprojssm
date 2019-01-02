import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import zhn.entity.Admin;
import zhn.entity.Apply;
import zhn.entity.User;
import zhn.service.AdminService;
import zhn.service.WupingService;

import java.util.ArrayList;

/**
 * @Author:zhn
 * @Date:2018/12/28
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = {"classpath:spring-mybatis.xml","classpath:ApplicationContext.xml"})
public class AdminTest {
    @Autowired
    AdminService adminService;

    @Autowired
    WupingService wupingService;

    @Test
    public void loginTest(){
        Admin admin =new Admin();
        admin.setAdminname("admin");
        admin.setAdminpass("admin");
        Admin admin1 = adminService.login(admin);
        System.out.println(admin1);
    }

    @Test
    public void register(){
        Admin admin = new Admin();
        admin.setAdminname("admin2");
        admin.setAdminpass("admin2");
        admin.setAdmintel("13198678890");
        admin.setAdminemail("34678@qq.com");
        boolean b = adminService.register(admin);
        System.out.println(b);
    }

   /* @Test
    public void getAllUser(){
        ArrayList<User> allUser = adminService.getAllUser();
        System.out.println(allUser);
    }

    @Test
    public void getALLApply(){
        ArrayList<Apply> allApply = adminService.getAllApply();
        System.out.println(allApply);
    }*/

   @Test
    public void deleteWuping(){
       int b = wupingService.deleteWuping(63);
       System.out.println(b);
   }

}

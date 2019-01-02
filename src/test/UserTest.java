import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import zhn.dao.WupingMapper;
import zhn.entity.User;
import zhn.entity.Wuping;
import zhn.service.UserService;
import zhn.service.WupingService;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * @Author:zhn
 * @Date:2018/12/5
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = {"classpath:spring-mybatis.xml","classpath:ApplicationContext.xml"})
public class UserTest {

    @Autowired
    UserService userService = null;
    @Autowired
    WupingService wupingService = null;

    @Test
    public void TestLogin(){
        User user = new User();
        user.setUsername("zhao");
        user.setUserpass("123");
        User user1 = userService.login(user);
        System.out.println(user1);

    }

    @Test
    public void TestRigister(){
        User user = new User();
        user.setUserpass("liu");
        user.setUserpass("123");
        boolean b = userService.register(user);
        System.out.println(b);
    }

    @Test
    public void TestWupingList(){
        ArrayList list = wupingService.getListByPage(0);
        System.out.println(list);
    }

    @Test
    public void TestKeyWordSearch(){
        ArrayList list=wupingService.keyWordSearch("2016",0);
        System.out.println(list);
    }

/*    @Test
    public void testGetWupingByPages() {
        PageInfo<Wuping> pages = wupingService.getWupingByPages(1, 2);
        System.out.println(pages);
        System.out.println(pages.getList().toString());
        Iterator<Wuping> iterator = pages.getList().iterator();
        while(iterator.hasNext()) {
            System.out.println(iterator.next());
        }
    }*/

    @Test
    public void deleteuser(){
        Integer integer = userService.deleteUser(11);
        System.out.println(integer);
    }
}

import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import zhn.dao.AdminMapper;
import zhn.dao.WupingMapper;
import zhn.entity.User;
import zhn.entity.Wuping;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @Author:zhn
 * @Date:2018/12/31
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = {"classpath:spring-mybatis.xml","classpath:ApplicationContext.xml"})
public class adminMapperTest {

    @Autowired
    AdminMapper adminMapper;

    @Autowired
    WupingMapper wupingMapper;

    @Test
    public void test() {
        List<User> allUser = adminMapper.getAllUser(1, 10);
        Iterator<User> iterator = allUser.iterator();
        while (iterator.hasNext()) {
            System.out.println(iterator.next());
        }
    }

    @Test
    public void getAllListTest(){
        ArrayList<Wuping> listByPage = wupingMapper.getListByPage(0);
        System.out.println(listByPage);
    }


}

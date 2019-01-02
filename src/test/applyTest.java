import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import zhn.dao.ApplyMapper;
import zhn.entity.Apply;
import zhn.service.ApplyService;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * @Author:zhn
 * @Date:2019/1/1
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = {"classpath:spring-mybatis.xml","classpath:ApplicationContext.xml"})
public class applyTest {

    @Autowired
    ApplyService applyService;

    @Autowired
    ApplyMapper applyMapper;

    @Test
    public void getAllApplyTest(){
        /*PageInfo<Apply> allApply = applyService.getAllApply(1, 3);
        System.out.println(allApply);*/
        ArrayList<Apply> allApply = applyMapper.getAllApply();
        Iterator<Apply> iterator = allApply.iterator();
        while (iterator.hasNext()){
            System.out.println(iterator.next());
        }

    }

    @Test
    public void changeFlagTest(){
        Integer integer = applyMapper.changeFlag(33, 1);
        System.out.println(integer);

    }
}

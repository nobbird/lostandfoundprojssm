package zhn.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zhn.dao.UserMapper;
import zhn.dao.WupingMapper;
import zhn.entity.Wuping;
import zhn.service.WupingService;

import java.util.ArrayList;

/**
 * @Author:zhn
 * @Date:2018/12/10
 */
@Service
public class WupingServiceImpl implements WupingService {

    @Autowired
    private WupingMapper wupingMapper;

    @Override
    public ArrayList getAllWuping() {
        ArrayList allWuping = wupingMapper.getAllWuping();
        return allWuping;
    }

    @Override
    public ArrayList getListByPage(  int flag ) {
        ArrayList list = wupingMapper.getListByPage(flag);
        return list;
    }

    @Override
    public boolean wupingAdd( Wuping wuping ) {
        boolean b = wupingMapper.wupingAdd(wuping);
        return b;
    }



    @Override
    public ArrayList<Wuping> keyWordSearch( String keyWord ,Integer flag) {
        ArrayList<Wuping> list=wupingMapper.keyWordSearch("%" + keyWord + "%", flag);
        return list;
    }

    @Override
    public PageInfo<Wuping> getWupingByPages( int startPos, int pageSize, Integer flag) {
        PageHelper.startPage(startPos, pageSize);
        ArrayList<Wuping> wupingByPages = wupingMapper.getListByPage(flag);
        PageInfo<Wuping> wupingPageInfo = new PageInfo<>(wupingByPages);
        return wupingPageInfo;
    }

    @Override
    public PageInfo<Wuping> getWupingByPagesByKeyWord( int startPos, int pageSize, Integer flag ,String keyWord) {
        PageHelper.startPage(startPos, pageSize);
        ArrayList<Wuping> wupingByPages = wupingMapper.keyWordSearch("%"+keyWord+"%",flag);
        PageInfo<Wuping> wupingPageInfo = new PageInfo<>(wupingByPages);
        return wupingPageInfo;
    }

    @Override
    public Integer getWupingCount( int flag ) {
        Integer wupingCount = wupingMapper.getWupingCount(flag);
        return wupingCount;
    }

    @Override
    public int deleteWuping( int id ) {
       int b = wupingMapper.deleteWuping(id);
        return b;
    }

}

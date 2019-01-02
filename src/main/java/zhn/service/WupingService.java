package zhn.service;

import com.github.pagehelper.PageInfo;
import zhn.entity.Wuping;

import java.util.ArrayList;

/**
 * @Author:zhn
 * @Date:2018/12/10
 */
public interface WupingService {
    ArrayList getAllWuping();
    ArrayList getListByPage(int flag);
    boolean wupingAdd( Wuping wuping);
    ArrayList<Wuping> keyWordSearch(String keyWord, Integer flag);
    PageInfo<Wuping> getWupingByPages( int startPos, int pageSize, Integer flag);
    PageInfo<Wuping>getWupingByPagesByKeyWord(int startPos, int pageSize, Integer flag,String keyWord);
    Integer getWupingCount(int flag);
    int deleteWuping(int id);
}

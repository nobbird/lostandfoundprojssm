package zhn.dao;

import org.apache.ibatis.annotations.Param;
import zhn.entity.Wuping;

import java.util.ArrayList;

/**
 * @Author:zhn
 * @Date:2018/12/10
 */
public interface WupingMapper {
    ArrayList<Wuping> getAllWuping();
    ArrayList<Wuping> getListByPage( int flag);
    boolean wupingAdd( Wuping wuping);
    ArrayList<Wuping> keyWordSearch( @Param("keyWord")String keyWord, @Param("flag") Integer flag);
    Integer getWupingCount(int flag);
    int deleteWuping(int id);
}

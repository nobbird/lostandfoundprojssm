package zhn.dao;

import org.apache.ibatis.annotations.Param;
import zhn.entity.Apply;

import java.util.ArrayList;

/**
 * @Author:zhn
 * @Date:2018/12/22
 */
public interface ApplyMapper {
    boolean applyWuping( Apply apply);
    ArrayList<Apply> getAllApply();
    Integer changeFlag( @Param("id") Integer id, @Param("flag") Integer flag);
}

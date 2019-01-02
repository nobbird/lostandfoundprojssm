package zhn.service;

import com.github.pagehelper.PageInfo;
import zhn.entity.Apply;

/**
 * @Author:zhn
 * @Date:2018/12/22
 */
public interface ApplyService {
    boolean applyWuping( Apply apply);
    PageInfo<Apply> getAllApply(int startPos, int pageSize);
    Integer changeFlag(Integer id,Integer flag);
}

package zhn.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zhn.dao.ApplyMapper;
import zhn.entity.Apply;
import zhn.service.ApplyService;

import java.util.ArrayList;

/**
 * @Author:zhn
 * @Date:2018/12/22
 */
@Service
public class ApplyServiceImpl implements ApplyService {
    @Autowired
    ApplyMapper applyMapper;

    @Override
    public boolean applyWuping( Apply apply ) {
        boolean b = applyMapper.applyWuping(apply);
        return b;
    }

    @Override
    public PageInfo<Apply> getAllApply(int startPos, int pageSize) {
        PageHelper.startPage(startPos,pageSize);
        ArrayList<Apply> allApply = applyMapper.getAllApply();
        PageInfo<Apply> applyPageInfo = new PageInfo<>(allApply);
        return applyPageInfo;
    }

    @Override
    public Integer changeFlag( Integer id ,Integer flag) {
        Integer integer = applyMapper.changeFlag(id,flag);
        return integer;
    }
}

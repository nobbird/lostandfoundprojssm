package zhn.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zhn.dao.AdminMapper;
import zhn.entity.Admin;
import zhn.entity.Apply;
import zhn.entity.User;
import zhn.service.AdminService;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author:zhn
 * @Date:2018/12/28
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;
    @Override
    public Admin login( Admin admin ) {
        Admin admin1 = adminMapper.login(admin);
        return admin1;
    }

    @Override
    public boolean register( Admin admin ) {
        boolean b = adminMapper.register(admin);
        return b;
    }

    @Override
    public PageInfo<User> getAllUser(int startPos, int pageSize) {
        PageHelper.startPage(startPos, pageSize);
        List<User> allUser = adminMapper.getAllUser(startPos, pageSize);
        PageInfo<User> userPageInfo = new PageInfo<>(allUser);
        return userPageInfo;
    }

    @Override
    public PageInfo<Apply> getAllApply(int startPos, int pageSize) {
        PageHelper.startPage(startPos, pageSize);
        List<Apply> allApply = adminMapper.getAllApply(startPos, pageSize);
        PageInfo<Apply> applyPageInfo = new PageInfo<>(allApply);
        return applyPageInfo;
    }

    @Override
    public boolean updateAdmin( Admin admin ) {
        boolean b = adminMapper.updateAdmin(admin);
        return b;
    }
}

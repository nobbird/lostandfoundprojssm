package zhn.service;

import com.github.pagehelper.PageInfo;
import zhn.entity.Admin;
import zhn.entity.Apply;
import zhn.entity.User;
import zhn.entity.Wuping;

import java.util.ArrayList;

/**
 * @Author:zhn
 * @Date:2018/12/28
 */
public interface AdminService {
    Admin login( Admin admin);
    boolean register(Admin admin);
    PageInfo<User> getAllUser(int startPos, int pageSize);
    PageInfo<Apply> getAllApply(int startPos, int pageSize);
    boolean updateAdmin(Admin admin);
}

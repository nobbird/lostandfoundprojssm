package zhn.dao;

import zhn.entity.Admin;
import zhn.entity.Apply;
import zhn.entity.User;

import java.util.List;

/**
 * @Author:zhn
 * @Date:2018/12/28
 */
public interface AdminMapper {
    Admin login(Admin admin);
    boolean register(Admin admin);
    List<User> getAllUser( int startPos, int pageSize);
    List<Apply> getAllApply(int startPos, int pageSize);
    boolean updateAdmin(Admin admin);
}

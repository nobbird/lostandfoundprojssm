package zhn.service;

import zhn.entity.User;

/**
 * @Author:zhn
 * @Date:2018/12/5
 */
public interface UserService {
    User login(User user);
    boolean register(User user);
    boolean updateUser(User user);
    Integer deleteUser(Integer id);
}

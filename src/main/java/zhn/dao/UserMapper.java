package zhn.dao;

import org.springframework.stereotype.Repository;
import zhn.entity.User;

/**
 * @Author:zhn
 * @Date:2018/12/5
 */
public interface UserMapper {
    User login(User user);
    boolean register(User user);
    boolean updateUser(User user);
    Integer deleteUser(Integer id);
}

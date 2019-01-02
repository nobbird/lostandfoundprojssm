package zhn.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zhn.dao.UserMapper;
import zhn.entity.User;
import zhn.service.UserService;

import javax.annotation.Resource;

/**
 * @Author:zhn
 * @Date:2018/12/5
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login( User user ) {
        User user1 = userMapper.login(user);
        return user1;
    }

    @Override
    public boolean register( User user ) {
        boolean b = userMapper.register(user);
        return b;
    }

    @Override
    public boolean updateUser( User user ) {
        boolean b = userMapper.updateUser(user);
        return b;
    }

    @Override
    public Integer deleteUser( Integer id ) {
        Integer i = userMapper.deleteUser(id);
        return i;
    }
}

package lesson.usermanager.service;

import lesson.usermanager.UsernameNotFoundException;
import lesson.usermanager.dao.UserDao;
import lesson.usermanager.model.User;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private UserDao userDao;

    @Override
    @Transactional
    public void addUser(User user) {
this.userDao.addUser(user);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
this.userDao.updateUser(user);
    }

    @Override
    @Transactional
    public void removeUser(int id) {
this.userDao.removeUser(id);
    }

    @Override
    @Transactional
    public User getUserById(int id) {

        return this.userDao.getUserById(id);
    }

    @Override
    @Transactional
    public List<User> listUsers() {
        return this.userDao.listUsers();
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
    @Override
@Transactional
    public User loadUserByUsername(String username) {
        return this.userDao.findUserByName(username);
    }

}

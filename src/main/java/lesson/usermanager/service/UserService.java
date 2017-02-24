package lesson.usermanager.service;

import lesson.usermanager.UsernameNotFoundException;
import lesson.usermanager.model.User;
import org.springframework.dao.DataAccessException;

import java.util.List;


public interface UserService {
     void addUser(User user);
     void  updateUser(User user);
     void removeUser(int id);
     User getUserById(int id);
     List<User>listUsers();

    User loadUserByUsername(String username)throws UsernameNotFoundException, DataAccessException;
}

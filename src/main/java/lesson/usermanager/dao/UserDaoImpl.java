package lesson.usermanager.dao;

import lesson.usermanager.UsernameNotFoundException;
import lesson.usermanager.model.User;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;


@Repository
public class UserDaoImpl  implements UserDao {
    private static final Logger logger= LoggerFactory.getLogger(UserDaoImpl.class);
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        Session session=this.sessionFactory.getCurrentSession();
        session.persist(user);
        logger.info("User successfully updated. User details: "+user);
    }

    @Override
    public void updateUser(User user) {
Session session=this.sessionFactory.getCurrentSession();
        session.update(user);
        logger.info("User successfully updated.User details: "+ user);
    }

    @Override
    public void removeUser(int id) {
        Session session=this.sessionFactory.getCurrentSession();
        User user=(User)session.load(User.class,new Integer(id));
        if(user!=null){
        session.delete(user);
            logger.info("User successfully removed. User details: "+ user);

    }}

    @Override
    public User getUserById(int id) {
        Session session=this.sessionFactory.getCurrentSession();
        User user=(User)session.load(User.class, new Integer(id));
       logger.info("User successfully loaded. User details: "+ user);
        return user;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List <User> listUsers() {
        Session session=this.sessionFactory.getCurrentSession();
        List<User> userList=session.createQuery("from User").list();
        for(User user:userList){
            logger.info("User list: "+ user);
        }
        return userList;
    }

   /* @Override
    public User findUserByName(String name) {
        return null;
    }
*/
    @Override

    @SuppressWarnings("unchecked")
    public User findUserByName (String username) {

User user=null;

        Session session=this.sessionFactory.getCurrentSession();
        try {
            System.out.println("username in userdaoimpl is:"+username);
            List<User> userList=session.createQuery("from User  where name = :username").setString("username",username).list();

                if(userList.size()==0){
                    throw new UsernameNotFoundException("Sorry....User :"+username+": not found");
                }
            else user=userList.get(0);

        }
        catch (UsernameNotFoundException e){
            e.printStackTrace();
        }
        logger.info("User successfully find by Name. User details: "+ user);

        return user;


    }

}

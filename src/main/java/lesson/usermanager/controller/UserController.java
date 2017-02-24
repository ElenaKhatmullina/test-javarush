package lesson.usermanager.controller;

import lesson.usermanager.UsernameNotFoundException;
import lesson.usermanager.model.User;
import lesson.usermanager.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.tags.Param;
import sun.misc.Request;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class UserController {
    private UserService userService;
@Autowired(required = true)
@Qualifier(value = "UserService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
   /* @RequestMapping(value = "users",method = RequestMethod.GET)
    public String listUsers(Model model){
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.listUsers());
        return "users";

    }
    */
    @RequestMapping(value = "/users/add",method = RequestMethod.POST)
   public String addBook(@ModelAttribute("user") User user){
        if(user.getId()==0){
            this.userService.addUser(user);
        }
        else {
            this.userService.updateUser(user);
        }
        return "redirect:/users";
}
    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id){
        this.userService.removeUser(id);
        return "redirect:/users";
    }
    @RequestMapping("/edit/{id}")
    public String editUser(@PathVariable("id")int id,Model model){
        model.addAttribute("user",this.userService.getUserById(id));
        model.addAttribute("listUsers", this.userService.listUsers());
        return "users";
    }
    @RequestMapping(value = "/userdata/{id}",method = RequestMethod.GET)
    public String userData(@PathVariable("id")int id,Model model){
        model.addAttribute("user",this.userService.getUserById(id));
        return "userdata";
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    public String searchUser (HttpServletRequest request, Model model)throws UsernameNotFoundException{
        String username=request.getParameter("username");
        System.out.println("Username in controller: "+username );
        User user=this.userService.loadUserByUsername(username);
        String result;
        if(user==null){
            result="oops";
        }
        else result="userdata";
        model.addAttribute("user",user);
        return result;
    }
    @RequestMapping(value="/users",method = RequestMethod.GET)

    public ModelAndView listOfUsers(@RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView("users");
        modelAndView.addObject("user",new User());
        List<User> users = userService.listUsers();
        System.out.println("Users-list:"+users);
        PagedListHolder<User> pagedListHolder = new PagedListHolder<User>(users);
        pagedListHolder.setPageSize(5);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());


        if(page==null || page < 1 || page > pagedListHolder.getPageCount())
            page = 1;


            modelAndView.addObject("page", page);

       if(page>pagedListHolder.getPageCount()){
            pagedListHolder.setPage(page);
            modelAndView.addObject("listUsers", pagedListHolder.getPageList());
        }

        else if(page <= pagedListHolder.getPageCount()) {

            pagedListHolder.setPage(page-1);
            modelAndView.addObject("listUsers", pagedListHolder.getPageList());
        }

        return modelAndView;
    }



}
package web.controller;
import org.springframework.stereotype.Controller;
import web.model.User;
import web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String showAllUsers(Model model){
        model.addAttribute("allUsers", userService.getAllUsers());
        model.addAttribute("user", new User());
        return "all-users";
    }

    @RequestMapping("/addNewUser")
    public String addNewUser(Model model){
        model.addAttribute("user", new User());
        return "redirect:/";
    }

    @RequestMapping("/saveUser")
    public String saveUser(@ModelAttribute("user") User user) {
        userService.saveUser(user);
        return "redirect:/";
    }

    @RequestMapping("/updateInfo")
    public String updateUser(@RequestParam("userId") int id, Model model){
        model.addAttribute("user", userService.getUser(id));
        model.addAttribute("allUsers", userService.getAllUsers());
        return "all-users";
    }

    @RequestMapping("/deleteUser")
    public String deleteUser(@RequestParam("userId") int id){
        userService.deleteUser(id);
        return "redirect:/";
    }
}

package com.bank.web;

import com.bank.domain.*;
import com.bank.service.AdminService;
import com.bank.service.ManagerService;
import com.bank.service.TellerService;
import com.bank.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by XiaHaijiao on 2015/4/21.
 */
@Controller("logOutController")
public class LoginOutController {
    @RequestMapping("/hello.do")
    public String init(Model model) {
        String message = "hello world";
        model.addAttribute("message", message);
        return "hello";
    }


    @RequestMapping("/logintest.do")
    public String test(ModelMap modelMap, User user) {
        modelMap.addAttribute("User", user);
        return "logintest";
    }

    @RequestMapping("loginshow.do")
    public void show(User user) {
        System.out.println(user);
    }

    @RequestMapping("/login.do")
    public String login() {
        return "Login";
    }


    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String loginfail(String username, String password,
                            HttpServletRequest request,
                            RedirectAttributes redirect,
                            HttpSession httpSession) {
        String logintype = request.getParameter("logintype");
        String message = null;
        switch (logintype) {
            case "teller":
                Teller teller = tellerService.getTeller(username);
                if (teller != null) {
                    if (teller.getPassword().equals(password)) {
                        httpSession.setAttribute("teller", teller);
                        //modelMap.addAttribute("teller", teller);
                        return "redirect:Teller.do";
                    } else message = "登录失败，密码错误！";//密码错误或者账号不存在
                } else {
                    message = "登录失败，账号不存在！";
                }
                break;
            case "user":
                User user = userService.getUser(username);
                if (user != null) {
                    if (user.getPassword().equals(password)) {
                        if (user.getStatus().getId() == 2)
                            message = "您的账号已被冻结，请到柜台激活！";
                        else {
                            httpSession.setAttribute("user", user);
                            // redirect.addFlashAttribute("user", user);
                            //modelMap.addAttribute("user", user);
                            //  modelMap.addAttribute("user", user);
                            return "redirect:User.do";
//                        return "UserIndex";
                        }
                    } else message = "登录失败，密码错误！";//密码错误或者账号不存在
                } else {
                    message = "登录失败，账号不存在！";
                }
                break;
            case "manager":
                Manager manager = managerService.getManager(username);
                if (manager != null) {
                    if (manager.getPassword().equals(password)) {
                        httpSession.setAttribute("manager", manager);
                        return "redirect:Manager.do";
                    } else message = "登录失败，密码错误！";
                } else message = "登录失败，账号不存在！";
                break;
            case "admin":
                Admin admin = adminService.getAdmin(username);
                if (admin != null) {
                    if (admin.getPassword().equals(password)) {
                        httpSession.setAttribute("admin", admin);
                        return "redirect:Admin.do";
                    } else message = "登录失败，密码错误！";
                } else message = "登录失败，账号不存在！";
                break;
        }
        if (message != null) {
            redirect.addFlashAttribute("message", message);
        }
        return "redirect:login.do";
    }


    //注销
    @RequestMapping("logout.do")
    public String logout(HttpSession httpSession) {
//        httpSession.removeAttribute("user");
        httpSession.invalidate();
        return "redirect:login.do";
    }


    @RequestMapping("Teller.do")
    public String tellerIndex(HttpSession httpSession) {
        Teller teller = (Teller) httpSession.getAttribute("teller");
        if (teller != null) {

            System.out.println("teller.do中的" + teller.toString());
        } else
            System.out.println("teller.do中的teller为空！");

        return "TellerIndex";
    }

    @RequestMapping("User.do")
    public String userIndex(HttpSession httpSession, Model modelMap) {
        User user = (User) httpSession.getAttribute("user");
        if (user != null) {
            System.out.println("user.do中的" + user.toString());
        } else
            System.out.println("user.do中的user为空！");

        Personinfo personinfo = (Personinfo) user.getPersoninfo().iterator().next();
        httpSession.setAttribute("info", personinfo);
        return "UserIndex";
    }

    @RequestMapping("Manager.do")
    public String managerIndex(HttpSession httpSession, Model model) {
        Manager manager = (Manager) httpSession.getAttribute("manager");
        if (manager != null) {
            System.out.println("manager.do中的" + manager.toString());
        } else
            System.out.println("manager.do中的manager为空！");

        return "ManagerIndex";
    }
    @RequestMapping("Admin.do")
    public String adminIndex(HttpSession httpSession,ModelMap modelMap){
       Admin admin= (Admin) httpSession.getAttribute("admin");
        return "AdminIndex";
    }
    @RequestMapping("newFunction.do")
    public String newFunction(){
        return "newFunction";
    }

    @Autowired
    UserService userService;
    @Autowired
    ManagerService managerService;
    @Autowired
    TellerService tellerService;
    @Autowired
    AdminService adminService;
}

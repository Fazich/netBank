package com.bank.web;

import com.bank.domain.*;
import com.bank.service.TellerService;
import com.bank.service.UserService;
import com.bank.service.UserService;
import com.bank.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.crypto.interfaces.PBEKey;
import javax.servlet.http.HttpSession;
import java.security.PublicKey;
import java.util.List;

/**
 * Created by XiaHaijiao on 2015/4/16.
 */
@Controller("tellerController")
public class TellerController {
    String message = null;

    @RequestMapping("list_Users.do")
    public String list_Users(@ModelAttribute("statusId") Integer statusId, Model modelMap) {
//        System.out.println("statusId" + statusId);
        Status status = userService.getStatus(statusId);
//        System.out.println(status.toString());
        //调用业务方法，根据账户状态获取个人信息，状态为0表示获取所有客户
        List<Personinfo> users = userService.searchPersoninfo(status);
//        System.out.println("size"+ users.size());
//        if (users != null)
//            for (Personinfo object : users) {
//                System.out.println(object.toString());
//            }
//        else {
//            System.out.println("users=null!~");
//        }
        message = "list_Users_show" + statusId;
        modelMap.addAttribute("message", message);
        modelMap.addAttribute("users", users);
        return "TellerIndex";
    }

    @RequestMapping("user_search.do")
    public String user_search(Integer statusId, Personinfo personinfo, Model modelMap) {
        System.out.println("statusId" + statusId);
        System.out.println(personinfo.toString());

        //调用业务方法，根据账户状态获取个人信息，状态为0表示获取所有客户
        List<Personinfo> users = userService.searchPersoninfo(personinfo);
        if (users.size() == 0) {
            message = "您所查找的用户不存在！";
            modelMap.addAttribute("message", message);
            modelMap.addAttribute("users", users);
            return "TellerIndex";
        }
        System.out.println(users.size());
        message = "list_Users_show" + statusId;
        modelMap.addAttribute("message", message);
        modelMap.addAttribute("users", users);
        return "TellerIndex";
    }

    @RequestMapping("enabled.do")
    public String enabled(@RequestParam("userid") Integer userid, ModelMap modelMap) {
        userService.enabled(userid);
        modelMap.addAttribute("message", "启用成功！");
        return "TellerIndex";
    }

    @RequestMapping("locking.do")
    public String locking(@RequestParam("userid") Integer userid, ModelMap modelMap) {
        userService.locking(userid);
        modelMap.addAttribute("message", "冻结成功！");
        return "TellerIndex";
    }

    @RequestMapping("withdrawal.do")
    public String withdrawal(User user, TransactionLog log, ModelMap modelMap) {
        if (userService.getUser(user.getUsername()).getStatus().getName().equals("冻结")) {
            modelMap.put("message", "该账户被冻结,无法进行相关操作");
            return "TellerIndex";
        }
        if (!userService.getUser(user.getUsername()).getPassword().equals(user.getPassword())) {
            modelMap.addAttribute("message", "用户的密码错误，请重新输入");
            return "TellerIndex";
        }
        log.setUser(userService.getUser(user.getUsername()));
        if (!userService.withdrawal(log)) {
            modelMap.addAttribute("message", "取款失败，余额不足！");
        } else modelMap.addAttribute("message", "取款成功！");

        System.out.println(modelMap.toString());
        return "TellerIndex";


//        System.out.println(user);
//        System.out.println(log);

    }

    @RequestMapping("deposit.do")
    public String deposit(User user, TransactionLog log, ModelMap modelMap) {
        if (userService.getUser(user.getUsername()).getStatus().getName().equals("冻结")) {
            modelMap.put("message", "该账户被冻结,无法进行相关操作");
            return "TellerIndex";
        }
        if (!userService.getUser(user.getUsername()).getPassword().equals(user.getPassword())) {
            modelMap.addAttribute("message", "用户的密码错误，请重新输入");
            return "TellerIndex";
        }
        log.setUser(userService.getUser(user.getUsername()));
        if (!userService.deposit(log)) {
            modelMap.addAttribute("message", "无知错误!");
        } else modelMap.addAttribute("message", "存款成功！");

        System.out.println(modelMap.toString());
        return "TellerIndex";

    }

    @RequestMapping("addUser.do")
    public String addUser(User user, TransactionLog transactionLog, Personinfo personinfo, ModelMap modelMap) {
        System.out.println(user.toString());
        System.out.println(transactionLog.toString());
        System.out.println(personinfo.toString());

        if (userService.getUser(user.getUsername()) != null) {
            modelMap.addAttribute("message", "该账号已存在");
            return "TellerIndex";
        }

        List list = userService.searchPersoninfo(personinfo);
        if (list.size() > 0) {
            modelMap.addAttribute("message", "一张身份证只能拥有一个账号");
            return "TellerIndex";
        }


        //调用业务方法，向账户表Account中添加账户
        userService.addUser(user);

        transactionLog.setOtherid(user.getUserid());
        transactionLog.setTrMoney(user.getBalance());
        //调用业务方法，向个人信息表personinfo添加个人信息
        user = userService.getUser(user.getUsername());
        personinfo.setUser(user);
        userService.add(personinfo);
//        userService.logForAddUser(transactionLog,user.getUsername());
        modelMap.put("message", "添加成功");
        return "TellerIndex";


    }

    @RequestMapping("delUser.do")
    public String delUser(Integer userid, ModelMap modelMap) {
//        System.out.println(userid);
        userService.delUser(userid);
        modelMap.addAttribute("message", "删除成功");

        return "TellerIndex";

    }

    @RequestMapping("changeTellerPwd.do")
    public String changeTellerPwd(Password pwd, HttpSession httpSession, ModelMap modelMap) {
        Teller teller = (Teller) httpSession.getAttribute("teller");
        System.out.println(pwd);
        if (!pwd.getOldpwd().equals(teller.getPassword())) {
            modelMap.put("message", "密码修改失败，当前密码不正确！");//密码不正确！
            return "TellerIndex";
        }
        if (!pwd.getNewpwd().equals(pwd.getConfirmpwd())) {
            modelMap.put("message", "密码修改失败，两次输入的密码不一样！");//两次输入的密码不一样！
            return "TellerIndex";
        }
        teller.setPassword(pwd.getNewpwd());
        if (tellerService.modifyTeller(teller)) {
            httpSession.setAttribute("teller", teller);
            modelMap.put("message", "密码修改成功！");
            return "TellerIndex";

        }
        modelMap.put("message", "密码修改失败！");
        return "TellerIndex";


    }

    @Autowired
    UserService userService;

    @Autowired
    TellerService tellerService;
}


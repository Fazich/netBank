package com.bank.web;

import com.bank.domain.*;

import com.bank.service.UserService;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by XiaHaijiao on 2015/4/7.
 */
@Controller("userController")

public class UserController {


    @RequestMapping("changeUserPwd.do")
    public String changeUserPwd(Password pwd, HttpSession httpSession, ModelMap modelMap) {
        String message = null;
        User user = (User) httpSession.getAttribute("user");
        System.out.println(pwd);
        if (!pwd.getOldpwd().equals(user.getPassword())) {
            modelMap.put("message", "密码修改失败，当前密码不正确！");//密码不正确！
            return "UserIndex";
        }
        if (!pwd.getNewpwd().equals(pwd.getConfirmpwd())) {
            modelMap.put("message", "密码修改失败，两次输入的密码不一样！");//两次输入的密码不一样！
            return "UserIndex";
        }
        user.setPassword(pwd.getNewpwd());
        if (userService.modifyUser(user)) {
            httpSession.setAttribute("user", user);
            modelMap.put("message", "密码修改成功！");
            return "UserIndex";
        }
        modelMap.put("message", "密码修改失败！");
        return "UserIndex";
    }

    @RequestMapping("transfer.do")
    public String transfer(
            HttpSession httpSession,
//                           @RequestParam("otherUserId") Integer otherUserId,
//                           @RequestParam("datetime") String datetime,
//                           @RequestParam("trMoney") Long trMoney,
            @RequestParam("otherUserName") String otherUserName,
            TransactionLog log, Model modelMap) {

        String message = null;
        User user = (User) httpSession.getAttribute("user");
//        System.out.println("transfer:" + user);
//        System.out.println("user:" + user.getStatus().getName());
//        System.out.println("user:" + user.getStatus().getId());
//        System.out.println("transfer:" + log);
        User otheruser = userService.getUser(otherUserName);
//        User otheruser = userService.getUser(log.getOtherName());
//        System.out.println(otheruser);
//        System.out.println(otheruser.getStatus().getName());
//        System.out.println(otheruser.getStatus().getId());
        if (otheruser == null) {
            message = "对方账号不存在，请重新输入！";
            modelMap.addAttribute("message", message);
            return "UserIndex";
        }
        if (otheruser.getStatus().getId() != 1) {//2,冻结
            message = "对方账号已被冻结，无法进行转账！";
            modelMap.addAttribute("message", message);
            return "UserIndex";
        }
        //log中的transactionType可以为空，service中自动填充
        log.setUser(user);
        log.setOtherid(otheruser.getUserid());


        System.out.println(log.toString());
        if (userService.transfer(log)) {
            message = "转账成功！";//成功
        } else message = "转账金额不足，请检查您的账户余额！";//余额不足

        modelMap.addAttribute("message", message);
        return "UserIndex";

    }

    @RequestMapping("list_transactionInfo.do")
    public String list_transactionInfo(@ModelAttribute("curPage") Pager pager,
                                       HttpSession httpSession, Model modelMap) {
        String message = null;
        //获取待显示页页码
        int curPage = pager.getCurPage();
        System.out.println("curpage:" + curPage);
        User user = (User) httpSession.getAttribute("user");
        if (user == null) {
            return "UserIndex";
        }
        //根据待显示页页码和账户对象获取交易记录
        List<TransactionLog> logs = userService.getLogs(user, curPage);
        //获得账户的交易记录总数，用来初始化分页类Pager对象，并设置其perPageRows和rowCount属性
        pager = userService.getPagerOfLogs(user);
        //设置Pager对象中的待显示页页码
        pager.setCurPage(curPage);
        modelMap.addAttribute("user", user);
        //每个log都有两份，删除用不到的一份
        for (Iterator<TransactionLog> it = logs.iterator(); it.hasNext(); ) {
            TransactionLog log = it.next();
            log.setOtherName(userService.getUser(log.getOtherid()).getUsername());
            if (log.getOtherid() == user.getUserid() && log.getTransactionType().getId() != 1 && log.getTransactionType().getId() != 2)
                it.remove();
        }
//        for (TransactionLog log : logs) {
//            System.out.println(log);
//        }
        modelMap.addAttribute("logs", logs);
        modelMap.addAttribute("pager", pager);
        message = "show_list";//显示list
        modelMap.addAttribute("message", message);

        return "UserIndex";
    }

    @RequestMapping("modify.do")
    public String modify(Personinfo personinfo, HttpSession httpSession, Model modelmap) {
        //从session中获取保存的个人信息对象
        System.out.println(personinfo);
        Personinfo per = (Personinfo) httpSession.getAttribute("info");
        //使用modify.jsp页面表单参数更新个人信息对象中的属性
        per.setAddress(personinfo.getAddress());
        per.setAge(personinfo.getAge());
        per.setCardid(personinfo.getCardid());
        per.setRealname(personinfo.getRealname());
        per.setSex(personinfo.getSex());
        per.setTelephone(personinfo.getTelephone());
        //将个人信息更新到数据库中
        if (userService.modifyPersoninfo(per)) {
            //更新成功后，将个人信息对象重新存入session保存
            httpSession.setAttribute("info", per);
            modelmap.addAttribute("message", "信息修改成功！");
            return "UserIndex";
        }
        modelmap.addAttribute("message", "信息修改失败！");
        return "UserIndex";
    }

    @RequestMapping("list_daikuanlilv.do")
    public String list_dailuanlilv(ModelMap modelMap) {
        List<Daikuanlilv> daikuanlilvs = userService.getAllDaikuanlilv();
        modelMap.addAttribute("daikuanlilvs", daikuanlilvs);
        modelMap.addAttribute("message", "list_daikuanlilv_show");
        return "UserIndex";

    }

    @RequestMapping("list_cunkuanlilv.do")
    public String list_cunluanlilv(ModelMap modelMap) {
        List<Cunkuanlilv> cunkuanlilvs=userService.getAllCunkuanlilv();
        modelMap.addAttribute("cunkuanlilvs",cunkuanlilvs);
        modelMap.addAttribute("message", "list_cunkuanlilv_show");
        return "UserIndex";
    }


    @Autowired
    private UserService userService;
}

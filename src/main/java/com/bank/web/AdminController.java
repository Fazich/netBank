package com.bank.web;

import com.bank.domain.Manager;
import com.bank.domain.Teller;
import com.bank.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by XiaHaijiao on 2015/4/21.
 */
@Controller
public class AdminController {

    @RequestMapping("addManager.do")
    public String addManager(Manager manager, ModelMap modelMap) {
        System.out.println(manager);
        managerService.addManager(manager);
        modelMap.addAttribute("message","增加成功！");
        return "AdminIndex";
    }

    @RequestMapping("list_Managers.do")
    public  String list_Managers(ModelMap modelMap){
        List<Manager> managers=managerService.getAllManager();
        modelMap.addAttribute("managers",managers);
        modelMap.addAttribute("message","list_Managers_show");
        return "AdminIndex";
    }

    @RequestMapping("delmanager.do")
    public String delmanager(Integer managerid, ModelMap modelMap) {
        Manager manager=managerService.getManager(managerid);
        managerService.delManager(manager);
        modelMap.addAttribute("message", "删除成功！");
        return "AdminIndex";
    }
    @Autowired
    ManagerService managerService;
}
